_art = _this select 0;
_range = 10;

switch (_art) do {
	case "use": {
		if (vehicle player == player) then {
			hintSilent "Attempting fix...";
			{
				if ((typeOf _x == "") && (damage _x > 0)) then { _x setdamage 0; };
				if (_x isKindOf "LandVehicle" || _x isKindOf "Air") then {
					{ if (!(alive _x)) then { unassignVehicle _x; deleteVehicle _x; }; } forEach (crew _x);
				};
			} forEach (nearestObjects [player,[], _range]);
		} else { hintSilent "You must be on foot."; };
	};
	case "jaildoors": {
		if ( (iscop || isun) && PLAYERDATA select 2 > 30 ) then {
			deleteVehicle prisondoor;
			wall = "Concrete_Wall_EP1" createVehicle [5964.83,7489.18,0];
			wall setPos [5964.83,7489.18,0];
			wall setDir 8;
			wall setVehicleInit "prisondoor = this;";

			deleteVehicle prisonDoor2;
			wall = "Concrete_Wall_EP1" createVehicle [5972.32,7490.72,0];
			wall setPos [5972.32,7490.72,0];
			wall setDir 277;
			wall setVehicleInit "prisonDoor2 = this;";
			processInitCommands;			
		} else { systemChat "Only support members or above playing as cop or un may reset prison doors."; };
	};
};