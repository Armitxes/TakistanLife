_unCP = [["Open/Close Border (West)","noscript.sqf",'[""unCP"",""cpWest""] execVM ""armitxes\remote.sqf""'],["Open/Close Border (East)","noscript.sqf",'[""unCP"",""cpEast""] execVM ""armitxes\remote.sqf""'],["Call Jailbus","noscript.sqf",'[""jailbus""] execVM ""armitxes\remote.sqf""']];
// ["Open/Close Border (Central)","CodePad.sqf",[[9,1,4,8,2], {["unCP","cpCentral"] execVM "armitxes\remote.sqf"}, {ctrlSetText [999,"Wrong code!"]; sleep 1; ctrlSetText [999, ""];}]]
_court = [["Open Cell 1","noscript.sqf",'[""door"",cCell1] execVM ""armitxes\remote.sqf""'],["Open Cell 2","noscript.sqf",'[""door"",cCell2] execVM ""armitxes\remote.sqf""'],["UNPOL Terminal","CodePad.sqf",[[9,1,4,8,2], {if(isun)then{createDialog "CopMenuLite";};}, {ctrlSetText [999,"Wrong code!"];
sleep 1; ctrlSetText [999, ""];}]]];

_build = [
	["Land_House_C_4_EP1",[6814.44,8905.19,0],-250,"false"],
	["Notebook",[5153,6060,4],75,_unCP,"true"],
	["Notebook",[3507.7, 8343.1,1.05],315,[(_unCP select 0),(_court select 2),(_unCP select 2)],"true"],
	["Notebook",[9048,5889.7,1.05],325,[(_unCP select 1),(_court select 2),(_unCP select 2)],"true"],
	["Notebook",[4146,9478.5,5.06],10,_court,"true"]
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
			_init = _init + format["this addAction %1;",_x];
		} forEach (_x select 3);   
		_cur setVehicleInit _init;      
	};
} forEach _build;

processInitCommands;

{ _x setVariable ["lastRob",0,true]; } forEach [fuelshop1,fuelshop2,fuelshop3,fuelshop4,fuelshop5,fuelshop6,fuelshop7,fuelshop8,fuelshop9,fuelshop10,gunshop2];