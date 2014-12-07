// Made By TomNyeTheScGuy.........
_start = createDialog "ItemsMenu";

#define ItemsMenu 2119

thingsAvailable = [
"Large Repair Kit",
"Refuel Can",
"SpeedUpgrade 3",
"SpeedUpgrade 5",
"lockpick",
"Medikit",
"Nitro",
"LSD",
"Cocaine",
"Heroin",
"Marijuana",
"Watchtower",
"Bunker (large)",
"Bunker (small)",
"H-Barrier"
];

{
	lbAdd [ItemsMenu, _x];
} forEach thingsAvailable;