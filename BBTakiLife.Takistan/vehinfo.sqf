_type    = typeOf _this;
_driver  = "No driver";
if ((_this emptyPositions "Driver") == 0) then {_driver = driver _this};

_bomb = _this getVariable "bombActive";
if(!isNil "_bomb") then { _bomb = format["<t color='#FF0000'>C4 DETECTED!<br />Forensics found the fingerprints of %1 on the explosive.<br />C4 defused.</t>",_bomb]; _this setVariable ["bombActive",nil,true]; } else { _bomb = ""; };
hint parseText format[localize "STRS_hints_vehicle_information",  _type,  (round(getdir _this)),  (round(getposASL _this select 2)),  _this,  _driver,  (_this emptyPositions "cargo")+(_this emptyPositions "driver"),  (round((sizeOf _type)*10)/10), _bomb];