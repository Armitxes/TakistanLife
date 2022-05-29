[csafe, 213.1] call setHeightASL;

_unCP = [["Open/Close Border (West)","noscript.sqf",'[""unCP"",""cpWest""] execVM ""armitxes\remote.sqf""'],["Call Jailbus","noscript.sqf",'[""jailbus""] execVM ""armitxes\remote.sqf""']];
// ["Open/Close Border (East)","noscript.sqf",'[""unCP"",""cpEast""] execVM ""armitxes\remote.sqf""']
// ["Open/Close Border (Central)","CodePad.sqf",[[9,1,4,8,2], {["unCP","cpCentral"] execVM "armitxes\remote.sqf"}, {ctrlSetText [999,"Wrong code!"]; sleep 1; ctrlSetText [999, ""];}]]
_court = [["Open Cell 1","noscript.sqf",'[""door"",cCell1,[4156.71,9465.54,123.664]] execVM ""armitxes\remote.sqf""'],["Open Cell 2","noscript.sqf",'[""door"",cCell2,[4158.41,9466.84,123.621]] execVM ""armitxes\remote.sqf""'],["UNPOL Terminal","CodePad.sqf",[[9,1,4,8,2], {if(isun)then{createDialog "CopMenuLite";};}, {ctrlSetText [999,"Wrong code!"];
sleep 1; ctrlSetText [999, ""];}]]];
_jail = ["Open Airlock","noscript.sqf",'[""prisonDoor"",prisondoor,[5964.85,7489.2,118.602]] execVM ""armitxes\remote.sqf""'];
_build = [
	["Land_House_C_4_EP1",[6814.44,8905.19,0],-250,"false"],
	["Notebook",[5153,6060,4],75,_unCP,"true"],
	["Notebook",[3507.7, 8343.1,1.05],315,[(_unCP select 0),(_court select 2),(_unCP select 1)],"true"],
	["Notebook",[4146,9478.5,5.06],10,_court,"true"],
	["Notebook",[5964.5,7483.3,1.18],7,[_jail,["Open/Close Border (Central)","noscript.sqf",'[""unCP"",""cpCentral""] execVM ""armitxes\remote.sqf""']],"true"],
	["Notebook",[5967.1,7489.6,1.3],7,[_jail,["Open Airlock 2","noscript.sqf",'[""prisonDoor"",prisonDoor2,[5972.32,7490.72,119.567]] execVM ""armitxes\remote.sqf""']],"true"]
];

{
	_class = _x select 0;
	_cur = (_class) createVehicle (_x select 1);
	if ((_x select 4) == "true") then { _cur enableSimulation false; };
	_cur setDir (_x select 2);
	_cur setPos (_x select 1);

	if (_class == "Notebook") then {
		_init = "";

		{
			_init = _init + format["this addAction %1; this allowDamage false;",_x];
		} forEach (_x select 3);
		_cur setVehicleInit _init;
	};
} forEach _build;
processInitCommands;

{ _x setVariable ["lastRob",0,true]; } forEach [gasstation1,gasstation2,gasstation3,gasstation4,gasstation5,gasstation6,gasstation7,northsupermarket,gasstation8,gasstation9,southsupermarket];
