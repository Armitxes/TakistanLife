if(gangcap)exitwith{};

gangcap=true;

_this 		= _this select 3;
_gangarea 	= _this select 0;
_type		= _this select 1;

if (_type == "capture") then {
	if(gangmember) then {
		(format['server globalchat "%1 is being captured by another gang!!";',_gangarea]) call toClients;

		_captime = round(time)+300;
		while {
			(_captime > time) &&
			((player distance _gangarea) <= 30) &&
			(animationState player != "civillying01") &&
			(alive player) &&
			((vehicle player) == player) &&
			(gangmember)
		} do {    
			hint format ["%1 seconds until gang area capture!",round(_captime-time)];
			sleep 1;
		};
		hint "";
		
		if((animationState player in animRestrained) || ((player distance _gangarea) > 30) || !(alive player) || ((vehicle player) != player) || !gangmember) then {
			(format['server globalchat "%1 has failed to capture %2";',_mygang, _gangarea]) call toClients;
		} else {
			_i = 0;
			_grpData = [];
			{
				if (_x select 1 == group player) exitWith { _grpData=_x; };
				_i=_i+1;
			} forEach gangsarray;
			_gangarea setVariable ["control", _i, true];
			(format['server globalchat "%1 has captured %2 ";', _grpData select 0, _gangarea]) call toClients;
		};
	} else { hintSilent "You need to be in a gang (Press 5)"; };
};
gangcap = false;