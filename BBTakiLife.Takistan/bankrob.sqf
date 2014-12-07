_this = _this select 3;
_art  = _this select 0;
_safe = _this select 1;

if (_art == "ausrauben") then {
  _robpool = robpoolsafe;
  _copplayernumber = playersNumber west;
  if (_copplayernumber < 5)exitWith{player groupchat "There are not enough cops on to rob this safe"};
  if(_robpool < 15000)exitWith{player groupchat "This safe has recently been stolen from and is empty"};
  if(!robenable)exitwith{player groupchat "you are already robbing the bank"};
  if(!(call INV_isArmed) and !debug)exitWith{player groupChat localize "STRS_bank_rob_noweapon";};
  
  robenable = false;
  _startRob = round(time)+300;
  robpoolsafe = 0;
  publicVariable "robpoolsafe"; 
  player groupChat format[localize "STRS_bank_rob_info"];
  player playmove "AinvPknlMstpSlayWrflDnon_medic";
  
  ('titleText [localize "STRS_bank_rob_titlemsg", "plain"]; _safe say "Bank_alarm";') call toClients;
   
  while {
    (_startRob > time) &&
    ((player distance safe) <= 100) &&
    (animationstate player != "civillying01") &&
    (alive player) &&
    ((vehicle player) == player)
  } do {    
    hint format ["%1 seconds until successful robbery!",round(_startRob-time)];
    sleep 1;
  };
  hint ""; 
  
  if((animationstate player == "civillying01") || ((player distance safe) >= 100) || !(alive player) || ((vehicle player) != player)) then {
    format['[0,1,2,["busted", "%1"]] execVM "bankrob.sqf";', name player] call toClients; 
  } else {
    format['[0,1,2,["opfer", %1, %2]] execVM "bankrob.sqf";', _safe, _robpool] call toClients;  
    ['dollarz', _robpool] call INV_AddInventoryItem;
    player groupChat format[localize "STRS_bank_rob_success"];
  local_useBankPossible = false;
robenable = true;
rblock = rblock + ((_robpool/5000)*60);
_rblock = rblock;

sleep 2;

if(_rblock != rblock)exitwith{};

for [{rblock}, {rblock > -1}, {rblock=rblock-1}] do {sleep 1;};

local_useBankPossible = true;
rblock	   = 0;
  };
  
  robenable = true;
};


if (_art == "opfer") then
{
  if (isun) exitWith {};
  server globalchat format["The thief stole $%1!", (_this select 2)];
  sleep 4;
  
  _moneyz = (PLAYERDATA select 1); 
  _verlust = round(_moneyz*Maxbankrobpercentlost);
  _verlustA = round(_moneyz*MaxbankrobpercentlostA);
  _verlustB = round(_moneyz*MaxbankrobpercentlostB);

  if ((_moneyz <= _verlust) and (_moneyz >= 1) and (('bankversicherung' call INV_GetItemAmount) == 0)) then
	{
    PLAYERDATA set [1,0];
    player groupChat localize "STRS_bank_rob_allmoneylost";
	};
  //Takes 1 percent
  if((_moneyz >  _verlust) and (_moneyz <= 99999) and (('bankversicherung' call INV_GetItemAmount) == 0)) then
	{
    [-_verlust] call setMoney;
  	player groupChat format[localize "STRS_bank_rob_somemoneylost", (_verlust call ISSE_str_IntToStr), (_moneyz call ISSE_str_IntToStr)];
	};
  //Takes 2.5 percent
  if((_moneyz >  _verlust) and (_moneyz >= 100000) and (_moneyz <= 999999) and (('bankversicherung' call INV_GetItemAmount) == 0)) then
	{
  	[-_verlustA] call setMoney;
  	player groupChat format[localize "STRS_bank_rob_somemoneylost", (_verlustA call ISSE_str_IntToStr), (_moneyz call ISSE_str_IntToStr)];
	};
  
  //Takes 5 percent
  if((_moneyz >  _verlust) and (_moneyz >= 1000000) and (('bankversicherung' call INV_GetItemAmount) == 0)) then
	{
    [-_verlustB] call setMoney;
    player groupChat format[localize "STRS_bank_rob_somemoneylost", (_verlustB call ISSE_str_IntToStr), (_moneyz call ISSE_str_IntToStr)];
	};	

  if (('bankversicherung' call INV_GetItemAmount) > 0) then
	{
    player groupChat localize "STRS_bank_rob_lostnomoney";
    ['bankversicherung', -(1)] call INV_AddInventoryItem;
	};
};

if (_art == "busted") then {
  server globalchat format["%1 was caught robbing the bank!", _safe];
};