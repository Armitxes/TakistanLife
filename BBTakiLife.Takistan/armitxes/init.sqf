_funcs = execVM "armitxes\_functions.sqf"; waitUntil {scriptDone _funcs};

if(isServer) then {
	["db\server",true] call execARM;
	["init_map",true] call execARM;
};

["handler",true] call execARM;
["plr_functions",true] call execARM;

if(!isDedicated) then 
{
	chatAbbr = "[Bugged ";
	iscop = false;
	isun = false;
	isciv = false;
	PLAYERDATA = [0];
	
	if(enableDebug) then {
		PLAYERDATA = [1,300000,245,4,2,50,[],0,[],0,''];
		if ((count PLAYERDATA) == 11) then {
			lastArray = str(PLAYERDATA);
			INV_LizenzOwner = [];
			{ INV_LizenzOwner = INV_LizenzOwner + [(INV_Lizenzen select _x) select 0]; } forEach (PLAYERDATA select 6);    
			chatAbbr = "[DevTest ";
			INV_Fabrikowner = [];
			_z = 0;
			{
				_fac = (INV_ItemFabriken select _z);
				if (_x > 0) then { 
					INV_Fabrikowner = INV_Fabrikowner + [_fac select 1];
					call compile format ["%1workers = %2;",(_fac select 8),_x];
				} else { call compile format ["%1workers = %2;",(_fac select 8),0]; };
				_z=_z+1; 
			} forEach (PLAYERDATA select 8);
			if(isciv && PLAYERDATA select 9 == 0) then { _w = ["nation"] execVM "armitxes\dialogs\controller.sqf"; waitUntil {scriptDone _w}; };
			player setVariable ["pubPlrData",[PLAYERDATA select 4, PLAYERDATA select 5, PLAYERDATA select 9,0],true];
		};
		submitLoad = nil;
		closeDialog 5000;
		JIP_Stats_Ready = true;
	};

	"North/West" setMarkerAlphaLocal 0;
	"North/East" setMarkerAlphaLocal 0;
	"South" setMarkerAlphaLocal 0;
	if(!iscop) then { "North" setMarkerAlphaLocal 0; };

	waitUntil {alive player};
	while {(count PLAYERDATA) != 11} do 
	{
		if (!(createDialog "Portal")) exitWith {hint "Dialog Error! - Portal"; endMission "LOSER";};
		((findDisplay 5000) displayCtrl 1) ctrlSetText format["%1", getPlayerUID player]; 
		waitUntil { !dialog };
	};
	if(isciv && (PLAYERDATA select 9) == 2) then {player setPos (getMarkerPos "respawn_civilian2");};
	["elections",false] call execARM;
	civstatsdone = true;
};