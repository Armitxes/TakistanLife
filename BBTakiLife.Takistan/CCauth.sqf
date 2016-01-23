_civnumber = _this select 0;
_announce  = _this select 1;
_selanno   = _this select 2;
_civnumber = _civnumber +1;
_civ       = format["civ%1", _civnumber];
_civvar	   = call compile format["%1", _civ];
_gangarray	   = _this select 3;
_gang		   = _gangarray select 0;




if (_selanno == 0) then {
	if (_announce == "Reason Not in List, Type Reason Here") exitWith {hintSilent "You must enter a reason!"};
	
	format["server globalChat ""The Chief Constable(%1) has given authorisation on %2 to %3"";",name player, name _civvar,_announce] call toClients;
	} else {
	if (not(_civ call ISSE_UnitExists)) exitWith {role groupChat localize "STRS_player_not_ingame";};
	_announce = "";
	switch (_selanno) do
	{
	case 1:{_announce = "Tyres to be shot out"; };
	case 2: {_announce = "Air vehicle to be disabled"; };
	case 3:{_announce = "Raid Gang Area 1"; };
	case 4:{_announce = "Raid Gang Area 2"; };
	case 5:{_announce = "Raid Gang Area 3";};
	};

	if (_announce != "") then {
	if ((_selanno) > 2) then {
	if (isNil "_gang") then {hintSilent "You must select a Gang";
	} else { 
	format["server globalChat ""The Chief Constable (%1) has issued a warrant on %2 to %3"";",name player, _gang,_announce] call toClients;};
	};
	if ((_selanno) < 3) then {
	format["server globalChat ""The Chief Constable (%1) has given authorisation for %2,s %3"";",name player, name _civvar,_announce] call toClients;
	 };
	};
  };

	