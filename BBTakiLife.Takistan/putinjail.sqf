_copobj = _this select 0;
  
(format ["server GLOBALCHAT format [""%2 ARRESTED %1."", name %1, name %2];", player, _copobj]) call broadcast;  
player setpos getmarkerpos "prisonspawn";  
(format ["%1 switchmove ""%2"";", player, "normal"]) call toClients;
call INV_EntferneIllegales;
player setDamage 0;
dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;

bountyToPay = 0;

for [{_i=0}, {_i <= (count warrantarray)}, {_i=_i+1}] do {
  _singleWarrant = warrantarray select _i;
  _pIdCiv  = _singleWarrant select 0;
  _pBounty = _singleWarrant select 2;
  
  if(player == _pIdCiv) exitWith {
    (format ["if (player == %1) then { [%2] call setMoney; player groupChat ""You received $%2 for the arrest""; };", _copobj, round(_pBounty)]) call toClients;    
    bountyToPay = _pBounty;
  };
};  


while {true} do
{
  bountyToPay = bountyToPay - 16.5;
	_timetotake = bountyToPay / 16.5;
	hintsilent format["Time until release: %1 seconds\nBail left to pay: $%2", round(_timetotake), round(bountyToPay*2)];
	
	if (isNull(player))                       exitWith {_exitart = ""};
	if (!(alive player))                      exitWith {_exitart = "tot"};
	if (player Distance prison_logic >= 50)   exitWith 
  {
    ["addWarrant",player,"Jailbreak",3000] execVM "warrant.sqf";
    (format ["if (player == %1) then { server GLOBALCHAT format [localize ""STRS_civmenucheck_breakout"", name %1];", player]) call toClients;
    bountyToPay = 0;    
  };
  
	if (bountyToPay <= 0) exitWith 
  {
    bountyToPay = 0;
    player setPos getMarkerPos "jail_freemarker";	
    player setDamage 0;
    dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;
	  ["deleteWarrant",player, "", 0] execVM "warrant.sqf";
	  (format ["if (player == %1) then { player groupChat localize ""STRS_civmenucheck_free_self"";}; server GLOBALCHAT format [localize ""STRS_civmenucheck_free_global"", name %1];", player]) call toClients;
  };

	sleep 1;
};