if(gangcap)exitwith{};

gangcap=true;

_this 		= _this select 3;
_gangarea 	= _this select 0;
_type		= _this select 1;
_control	= _gangarea getVariable "control";
_owns 		= false;

if (_type == "capture") then {
	if (!(isNil "_control")) then {
		if(_control == group player) then { _owns=true; };
	};
	if(gangmember && !_owns) then {
		(format['server globalchat "%1 is being captured by another gang!!";',_gangarea]) call toClients;

		_captime = round(time)+150;
		while {
			(_captime > time) &&
			((player distance _gangarea) <= 60) &&
			(animationState player != "civillying01") &&
			(alive player) &&
			((vehicle player) == player) &&
			(gangmember)
		} do {
			titleText [format ["%1 seconds until gang area capture!",round(_captime-time)], "PLAIN DOWN", 0.1];
			sleep 1;
		};
		hint "";

		if((animationState player in animRestrained) || ((player distance _gangarea) > 30) || !(alive player) || ((vehicle player) != player) || !gangmember) then {
			(format['server globalChat "%1 has failed to capture %2";',_mygang, _gangarea]) call toClients;
		} else {
			{
				if (_x select 1 == group player) exitWith {
					_gangarea setVariable ["control", group player, true];
					(format['server globalChat "%1 has captured %2 ";', _x select 0, _gangarea]) call toClients;
				};
			} forEach gangsarray;
		};
	} else { hintSilent "You gang already owns this gangarea or you're not in a gang."; };
};
gangcap = false;
