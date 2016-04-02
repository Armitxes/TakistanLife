_action = _this select 0;
_caller = (_this select 1);
_legit = true;

if (_action == "call_cop" || _action == "call_medic" || _action == "call_un") then { // Edited by Redbully14
  if(!prioCall) then {
    if((lastCall + 360) < time) then {
      if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
      ctrlSetText [1,"You are about to make an emergency call.<br />Note that you can only make 1 call every 6 minutes and that abuse is a criminal offense!\nThis call will cost you $200"];
      
      waitUntil{(not(ctrlVisible 1023)) || !(alive player)};
      if (Antwort == 2) then { _legit = false; } else { systemChat "Emergency call successfully sent."; }; Antwort = 2;
    } else {
      _legit = false;
      systemChat "You only can make 1 emergency call every 6 minutes.";
    };
  };
  prioCall = false;
  lastCall = time;
}; 

if (_action == "call_taxi") then {
  if(!taxiCall) then {
    if((lastTCall + 360) < time) then {
      if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
      ctrlSetText [1,"You are about to make a taxi call.<br />Note that you can only make 1 call every 6 minutes and that abuse is a criminal offense!\nThis call is free"];
      waitUntil{(not(ctrlVisible 1023)) || !(alive player)};
	  systemChat "Taxi call successfully sent.";
	  Antwort = 2;
   
	} else {
      _legit = false;
      systemChat "You only can make 1 taxi call every 6 minutes.";
		};
	};
  taxiCall = false;
  lastTCall = time;
}; 

if(_legit) then {
  switch (_action) do {
    case "emergency": {
      if (alive _caller) then
      {
        _pos = position (_this select 1);
        _time = str(time); 
        emMarkers = emMarkers + [_time];
        createMarkerLocal [_time, _pos];
        _time setMarkerTypeLocal "Warning";
        _time setMarkerTextLocal (format["EMERGENCY (%1)",name _caller]); 
        _time setMarkerColorLocal "ColorRed";
        systemChat format["EMERGENCY CALL BY %1 - CHECK YOUR MAP",name _caller];
      };  
    };
    case "taxi": { // Done by Redbully14
      if (alive _caller) then
      {
        _pos = position (_this select 1);
        _time = str(time); 
        emMarkers = emMarkers + [_time];
        createMarkerLocal [_time, _pos];
        _time setMarkerTypeLocal "Warning";
        _time setMarkerTextLocal (format["TAXI (%1)",name _caller]); 
        _time setMarkerColorLocal "ColorGreen";
        systemChat format["TAXI CALL BY %1 - CHECK YOUR MAP",name _caller];
      };  
    };
    case "call_cop": { (format["if (iscop) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player,""]) call toClients; };
    case "call_medic": { (format["if (ismedic) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player]) call toClients; };
    case "call_un": { (format["if (isun) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player]) call toClients; };
    case "vote": { if (iscop) then { [0,0,0,["chief"]] execVM "maindialogs.sqf"; } else { [0,0,0,["wahlen"]] execVM "maindialogs.sqf"; }; };
	case "atm": { execVM "atmphone.sqf"; }; // Done by: Redbully14
    case "call_taxi": { (format["if (isciv) then { [""taxi"",%1] execVM ""armitxes\phone.sqf"";}",player]) call toClients; }; // Done by: Redbully14
  };
};