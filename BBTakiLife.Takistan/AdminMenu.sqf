// Made By TomNyeTheScGuy.........
_start = createDialog "AdminMenu";

#define AdminMenu 2119

thingsAvailable = [
"Player Controls",
"Vehicle Spawns",
"God Mode"
];

{
	lbAdd [AdminMenu, _x];
} forEach thingsAvailable;