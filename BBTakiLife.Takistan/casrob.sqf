_this = _this select 3;
_art  = _this select 0;
_safe = _this select 1;

if (_art == "robcas") then {
  _robpool = crobpoolsafe;
  _copplayernumber = playersNumber west;
  if (_copplayernumber < 5)exitWith{player groupchat "There are not enough cops on to rob this safe"};
  if(_robpool < 15000)exitWith{player groupchat "This safe has recently been stolen from and is empty"};
  if(!robenable)exitwith{player groupchat "you are already robbing the casino"};
  if(!(call INV_isArmed) and !debug)exitWith{player groupChat localize "STRS_casino_rob_noweapon";};
  
  robenable = false;
  _startRob = round(time)+600;
  crobpoolsafe = 0;
  publicVariable "crobpoolsafe"; 
  player groupChat format[localize "STRS_casino_rob_info"];
  player playmove "AinvPknlMstpSlayWrflDnon_medic";
  
  ('titleText [localize "STRS_casino_rob_titlemsg", "plain"]; _safe say "Bank_alarm";') call toClients;
   
  while {
    (_startRob > time) &&
    ((player distance csafe) <= 60) &&
    (animationstate player != "civillying01") &&
    (alive player) &&
    ((vehicle player) == player) && !([player] call plr_isUnConscious)
  } do {    
    hint format ["%1 seconds until successful robbery!",round(_startRob-time)];
    sleep 1;
  };
  hint ""; 
  
  if((animationstate player == "civillying01") || ((player distance csafe) >= 60) || !(alive player) || ((vehicle player) != player) || ([player] call plr_isUnConscious)) then {
    format['[0,1,2,["busted", "%1"]] execVM "casrob.sqf";', name player] call toClients; 
  } else {
    format['[0,1,2,["success", %1, %2]] execVM "casrob.sqf";', _safe, _robpool] call toClients;  
    ['dollarz', _robpool] call INV_AddInventoryItem;
    player groupChat format[localize "STRS_casino_rob_success"];
  };
  
  robenable = true;
};
if (_art == "success") then {
server globalchat format["The thief stole $%1!", (_this select 2)];
sleep 4;
server globalchat "The Casino has just been robbed successfully all bets are off for 10 minutes!!";
nobet = true;
sleep 600;
nobet = false;
server globalchat "The Casino has recovered it's losses, all bets are ON!!!!";
server globalchat "The Casino has recovered it's losses, all bets are ON!!!!";};


if (_art == "busted") then {
  server globalchat format["%1 was caught robbing the casino!", _safe];
};