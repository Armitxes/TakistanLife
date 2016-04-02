_tool = _this select 0;
if(typeName _tool == "OBJECT") then { _tool = (_this select 3) select 0; };
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
		if(player != vehicle player) then { titleText ["You cant repair a vehicle from the inside ^^", "PLAIN DOWN", 0.5]; } else {
			if (call fnc_isBusy) exitWith {titleText ["Wait! I'm busy...", "PLAIN DOWN", 0.5];};
			if (isNil "_vcl") then {titleText ["There is no vehicle here...", "PLAIN DOWN", 0.5];} else {
				if(player distance _vcl < 5) then {   
					_dam = damage _vcl;
					if(_dam >= 1) exitWith { titleText ["This vehicle is a mess, no chance I can repair it.", "PLAIN DOWN", 0.5]; };
					_w = [(_dam * 15 + 7),"Repairing...","AinvPknlMstpSnonWrflDnon_medic","AinvPknlMstpSnonWrflDnon_medicEnd"] spawn fnc_timer;
					waitUntil { scriptDone _w; };
					if(player != vehicle player) exitWith { titleText ["Repair cancelled.", "PLAIN DOWN", 0.5]; };
					_vcl setDamage 0; titleText ["The vehicle look like new. Well almost..", "PLAIN DOWN", 0.5];
				} else { titleText ["What am I supposed to repair?", "PLAIN DOWN", 0.5]; };
			};
		};
	};
	case "carjack": {
		if (isNil "_vcl") then {titleText ["Unflipping air is no much fun :)", "PLAIN DOWN", 0.5]; } else {
			if (call fnc_isBusy) exitWith {titleText ["Wait! I'm busy...", "PLAIN DOWN", 0.5];};
			titleText ["It works! Now I should slowly...", "PLAIN DOWN", 0.5];
			sleep 5;
		
			if (player distance _vcl < 10) then {
				_vcl setVectorUp [0.001,0.001,1.2]; titleText ["I made it!", "PLAIN DOWN", 0.5];
			} else { titleText ["Damn, I slipped of! I should stay closer.", "PLAIN DOWN", 0.5]; };	
		};
	};
	case "refuel": {                              
		if(player != vehicle player) then { titleText ["I must leave the vehicle to refuel it!", "PLAIN DOWN", 0.5]; } else {
			if (call fnc_isBusy) exitWith {titleText ["Wait! I'm busy...", "PLAIN DOWN", 0.5];};
			if (isNil "_vcl") then { titleText ["There is no vehicle close...", "PLAIN DOWN", 0.5]; } else {
				if(player distance _vcl < 5) then {   
					_fuel = fuel _vcl;
					if(_fuel > 0.95) exitWith { titleText ["This vehicle does not need refueling", "PLAIN DOWN", 0.5]; };
					_vcl lock true;
					_w = [((1-_fuel) * 10 + 7),"Refueling...","AinvPknlMstpSnonWrflDnon_medic","AinvPknlMstpSnonWrflDnon_medicEnd"] spawn fnc_timer;
					waitUntil { scriptDone _w; };
					_vcl setFuel 1;
				};
			};
		};
	};
	case "towing": {
		_plrVcl = vehicle player;
		_towing = _plrVcl getVariable "towing";
		if(_plrVcl isKindOf "Motorcycle") exitWith { titleText ["How should that work out!?!", "PLAIN DOWN", 0.5]; };
		if(isNil "_towing") then {
			if (_plrVcl != player) then {
				_vcl = ((nearestObjects [_plrVcl,["LandVehicle"], 20]) - [_plrVcl]) select 0;
				if (!isNil "_vcl") then {
					if(_vcl in INV_VehicleArray || ismedic || iscop || isun) then {
						_vclAllow = _vcl getVariable "towing";
						if (isNil "_vclAllow") then {
							if (speed _vcl == 0) then {
								if (_plrVcl isKindOf "Air") then { _vcl attachTo [_plrVcl,[0,-0.5,-10]]; } else { _vcl attachTo [_plrVcl,[0,-5,0.7]]; };
								_plrVcl setVariable ["towing",_vcl,true];
							} else { titleText ["You can't tow a moving vehicle, the risk is too high.", "PLAIN DOWN", 0.5]; };
						} else { titleText ["You can't tow a towing vehicle...", "PLAIN DOWN", 0.5]; };
					} else { titleText ["You don't have the keys for the vehicle...", "PLAIN DOWN", 0.5]; };
				} else { titleText ["There is no vehicle close...", "PLAIN DOWN", 0.5]; };
			} else { titleText ["I'm not that strong...", "PLAIN DOWN", 0.5]; };
		} else { _vcl = _plrVcl getVariable "towing"; detach _vcl; titleText ["Vehicle untowed.", "PLAIN DOWN", 0.5]; _plrVcl setVariable ["towing",nil,true]; };
	};
};