_art = _this select 0;
_range = 10;

if (_art == "use") then
{
	if (vehicle player == player) then {
		player groupChat "Attempting fix...";
		{
			if ((typeOf _x == "") && (damage _x > 0)) then { _x setdamage 0; };
			if (_x isKindOf "LandVehicle" || _x isKindOf "Air") then {
				{ if (!(alive _x)) then { unassignVehicle _x; deleteVehicle _x; }; } forEach (crew _x);
			};
		} forEach (nearestObjects [player,[], _range]);
	} else { player groupChat "You must be on foot."; };
};
