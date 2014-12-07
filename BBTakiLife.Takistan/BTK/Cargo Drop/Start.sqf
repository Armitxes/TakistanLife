// Wait until player ready, exit if server
waitUntil {!isNull player};
if (!local player) exitWith {};

// Launch the init once
while {true} do {
	{[_x] execVM "BTK\Cargo Drop\InitAction.sqf";} forEach (nearestObjects [player, ["Air"], 30]);
	sleep 5;
};