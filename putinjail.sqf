_copobj = _this select 0;
  
(format ["server GLOBALCHAT format [""%2 ARRESTED %1."", name %1, name %2];", player, _copobj]) call broadcast;  
player setpos getmarkerpos "prisonspawn";  
(format ["%1 switchmove ""%2"";", player, "normal"]) call toClients;
call INV_EntferneIllegales;
if(stolencash > 0)then  
{
	_INVrmv = stolencash;
	_BNKrmv = 0;
	_dollarz   = "dollarz" call INV_getitemamount;

	if(_dollarz < stolencash)then{_INVrmv = _dollarz;};
	if((PLAYERDATA select 1) < (stolencash - _INVrmv))then{_BNKrmv = (PLAYERDATA select 1)};

	["dollarz", -(_INVrmv)] call INV_addinventoryitem;
	[-_BNKrmv] call setMoney;
	(format ["server globalchat ""%1 was a bank robber and has been charged $%2!"";", name player, (_INVrmv + _BNKrmv)]) call broadcast;
};

stolencash = 0;

player setDamage 0;
dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;
bountyToPay = 0;

for [{_i=0}, {_i <= (count warrantarray)}, {_i=_i+1}] do {
	_singleWarrant = warrantarray select _i;
	_pIdCiv  = _singleWarrant select 0;
	_pBounty = _singleWarrant select 2;

	if(player == _pIdCiv) exitWith {
		(format ["if (player == %1) then { [%2] call setMoney; hintSilent ""You received $%2 for the arrest""; };", _copobj, round(_pBounty)]) call toClients;    
		bountyToPay = _pBounty;
	};
};  


while {true} do
{
	bountyToPay = bountyToPay - 16.5;
	_timetotake = bountyToPay / 16.5;
	hintsilent format["Time until release: %1 seconds\nBail left to pay: $%2", round(_timetotake), round(bountyToPay*4)];

	if (isNull(player))                       exitWith {_exitart = ""};
	if (!(alive player))                      exitWith {_exitart = "tot"};
	if (player distance prison_logic >= 100)  exitWith {
		["addWarrant",player,"Escaping Jail",5000] execVM "warrant.sqf";
		(format ["if (player == %1) then { server globalChat format [localize ""STRS_civmenucheck_breakout"", name %1];", player]) call toClients;
		bountyToPay = 0;    
	};

	if (bountyToPay <= 0) exitWith {
		bountyToPay = 0;
		player setPos getMarkerPos "jail_freemarker";	
		player setDamage 0;
		dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;
		["deleteWarrant",player, "", 0] execVM "warrant.sqf";
		(format ["if (player == %1) then { hintSilent localize ""STRS_civmenucheck_free_self"";}; server GLOBALCHAT format [localize ""STRS_civmenucheck_free_global"", name %1];", player]) call toClients;
	};

	sleep 1;
};