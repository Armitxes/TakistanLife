_type    = typeOf _this;
_driver  = "No driver";
if ((_this emptyPositions "Driver") == 0) then {_driver = driver _this};

_owner = (_this getVariable "owner") select 0;
_bomb = _this getVariable "bombActive";
if(!isNil "_bomb") then {_bomb = format["<t color='#FF0000'>C4 DETECTED!<br />Forensics found the fingerprints of %1 on the explosive.<br />C4 defused.</t>",_bomb]; _this setVariable ["bombActive",nil,true]; } else { _bomb = "No C4 detected."; };
hint parseText format["ID: %1<br />Owner: %4<br />Driver: %2<br /><br />%3",_this,_driver,_bomb,_owner];