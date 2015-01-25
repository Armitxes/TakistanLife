_action = _this select 0;

switch (_action) do {
  case "emergency": {
    _pos = position (_this select 1);
    _time = str(time); 
    emMarkers = emMarkers + [_time];
    createMarkerLocal [_time, _pos];
    _time setMarkerTypeLocal "Warning";
    _time setMarkerTextLocal " EMERGENCY CALL";
    _time setMarkerColorLocal "ColorRed";
    systemChat format["EMERGENCY CALL BY %1 - CHECK YOUR MAP",name (_this select 1)];  
  };
  case "call_cop": { (format["if (iscop) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player]) call toClients; };
  case "call_medic": { (format["if (ismedic) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player]) call toClients; };
  case "call_un": { (format["if (isun) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player]) call toClients; };
  case "vote": { if (iscop) then { [0,0,0,["chief"]] execVM "maindialogs.sqf"; } else { [0,0,0,["wahlen"]] execVM "maindialogs.sqf"; }; };
};