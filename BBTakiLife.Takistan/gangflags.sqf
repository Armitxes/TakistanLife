if(gangcap)exitwith{};

gangcap=true;

_this 		= _this select 3;
_gangarea 	= _this select 0;
_type		= _this select 1;
_control = _gangarea getvariable "control";

if (_type == "capture") then {
	(format['server globalchat "%1 is being captured by another gang!!";',_gangarea]) call toClients;
	_gangarea setvariable["control", "Nobody", true];
	_captime = round(time)+360;
	while {
		(_captime > time) &&
		((player distance _gangarea) <= 30) &&
		(animationstate player != "civillying01") &&
		(alive player) &&
		((vehicle player) == player) &&
		(gangmember)
	} do {    
		hint format ["%1 seconds until gang area capture!",round(_captime-time)];
		sleep 1;
	};
	hint "";
  
  if((animationState player in animRestrained) || ((player distance _gangarea) > 30) || !(alive player) || ((vehicle player) != player) || !(gangmember)) then {
  _mygang  = call INV_mygang;
  (format['server globalchat "%1 has failed to capture %2";',_mygang, _gangarea]) call toClients;
  if (!isnil "_control") then {
  _gangarea setVariable["control",_control,true];
  } else {
  _gangarea setVariable["control",nil,true];
  };
  } else {
  _mygang  = call INV_mygang;
	_controlc = _gangarea getvariable "control";
	if(_mygang != "" and _controlc == "Nobody")then
	{
	_gangarea setvariable["control", _mygang, true];
	(format['server globalchat "%1 has captured %2 ";',_mygang, _gangarea]) call toClients;
	  };
	};
  };
 gangcap = false;
