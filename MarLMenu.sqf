_selreason = _this select 0;
_reason = _this select 1;
_art = _this select 2;

if (_selreason == 0) then {
	if (_reason == "Reason Not in List, Type Reason Here") exitWith {hintSilent "You must enter a reason!"};

	format["server globalChat ""The Chief Constable (%1) has declared martial law because of %2"";",name player,_reason] call toClients;
} else {
	_reason = "";
	switch (_selreason) do {
		case 1: {_reason = "The High Crime Rate";};
		case 2: {_reason = "A High Threat of Terrorism";};
		case 3: {_reason = "A Declaration of War";};
	};
	if (_reason != "") then {
		format ["server globalChat ""The Chief Constable (%1) has declared martial law because of %2"";mlaw = true",name player,_reason] call toClients;
	};
};
   

  
  
	  

