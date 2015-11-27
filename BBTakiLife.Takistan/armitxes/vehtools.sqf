_tool = _this select 0;
_vcl = (nearestObjects [getpos player, ["LandVehicle","Air","Ship"], 10]) select 0;

switch (_tool) do {
	case "spikes": {
		_vcl = vehicle player;
		_vcl setHit ["wheel_1_1_steering", 1];
		_vcl setHit ["wheel_2_1_steering", 1];
		_vcl setHit ["wheel_1_2_steering", 1];
		_vcl setHit ["wheel_2_2_steering", 1];
	};
	case "repair": {
		if(player != vehicle player) then { systemChat "I cant repair a vehicle from the inside ^^"; } else {
			if (call fnc_isBusy) exitWith {systemChat "Wait, I am busy...";};
			if (isNil "_vcl") then {systemChat "There is no vehicle here...";} else {
				if(player distance _vcl < 5) then {   
					_dam = damage _vcl;
					if(_dam >= 1) exitWith { systemChat "This vehicle is a mess, no chance I can repair it."; };
					_w = [(_dam * 15 + 7),"Repairing...","AinvPknlMstpSnonWrflDnon_medic","AinvPknlMstpSnonWrflDnon_medicEnd"] spawn fnc_timer;
					waitUntil { scriptDone _w; };
					if(player != vehicle player) exitWith { hint "You canceled the car repair"; };
					_vcl setDamage 0; systemChat "The vehicle looks like new.";
				} else { systemChat "What am I supposed to repair?"; };
			};
		};
	};
	case "carjack": {
		if (isNil "_vcl") then {systemChat "There is no vehicle here...";} else {
			if (call fnc_isBusy) exitWith {systemChat "Wait, I am busy...";};
			systemChat "It works! Now I should slowly...";
			sleep 5;
		
			if (player distance _vcl < 10) then {
				_vcl setVectorUp [0.001,0.001,1.2]; systemChat "I made it!";
			} else { systemChat "Damn, I slipped of! I should stay closer."; };		
		};
	};
	case "refuel": {                              
		if(player != vehicle player) then { systemChat "I must leave the vehicle to refuel it!"; } else {
			if (call fnc_isBusy) exitWith {systemChat "Wait, I am busy...";};
			if (isNil "_vcl") then {systemChat "There is no car here...";} else {
				if(player distance _vcl < 5) then {   
					_fuel = fuel _vcl;
					if(_fuel > 0.95) exitWith { hint "This vehicle needs no refuel"; };
					_vcl lock true;
					_w = [((1-_fuel) * 10 + 7),"Refueling...","AinvPknlMstpSnonWrflDnon_medic","AinvPknlMstpSnonWrflDnon_medicEnd"] spawn fnc_timer;
					waitUntil { scriptDone _w; };
					_vcl setFuel 1;
				};
			};
		};
	};
	case "tow": {
		_plrVcl = vehicle player;
		if (_plrVcl != player) then {
			_vcl = ((nearestObjects [_plrVcl,["LandVehicle"], 20]) - [_plrVcl]) select 0;
			if (!isNil "_vcl") then {
				if (speed _vcl == 0) then {
					if (_plrVcl isKindOf "Air") then { _vcl attachTo [_plrVcl,[0,-0.2,-1]]; } else { _vcl attachTo [_plrVcl,[0,-4,0.5]]; };
				} else { systemChat "I can't tow a moving vehicle, the risk is too high."; };
			} else { systemChat "There is no vehicle close..."; };
		} else { systemChat "I'm not that strong..."; };
	};
	case "untow": {
		_vcls = nearestObjects [vehicle player,["LandVehicle"], 10];
		if(count _vcls > 0) then {
			{
				//_objs = attachedObjects _x;
				//if(count _objs > 0) then { _vcl = (_objs select 0); _vcl attachTo [vehicle player,[0,-11,0.5]]; detach _vcl; };
			} forEach _vcls;
		} else { systemChat "There is nothing around..."; };
	};
};