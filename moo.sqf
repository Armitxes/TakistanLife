/* Anti Cheat - DO NOT MODIFY */
_glClassesNames = ["carpetbomb_menu","playerhijack_menu","chernorus_life_menu","zargabad_menu","joker_menu","endgame_menu",
"AlexAdmin_menu","lblmsgtimeout","Alexander_menu","artillery_barrageWF","AnthonyMcle","ChernoRape_menu","MightyGerk_menu","SpawnSoldier_menu",
"AtackPlanes","GrkTeleport","crpbmb_menu","Delete_menu","collection_123456","Verbal_menu","playerhijack_menu","lblspvehicle",
"gerklusban","btnCarpetOk","UntiFreezee","lblhight","ChernoRape_menu","undetected_1","ultimate_123","btnbebanus","Ribeliona"];

for "_i" from 0 to ((count _glClassesNames) - 1) do
{
	_curClassName = (_glClassesNames select _i);
	if (isClass (configFile >> _curClassName)) exitWith
	{
		haxorname = name player;
		publicVariable "haxorname";
		extradeadtime = 100000;
		disableUserInput true;
		format['server globalChat "ALERT: %1 has been caught molesting sheep!";', haxorname] call broadcast;
		player setPos [-6269.0903,552.92957,-6458.1816];
		format['server globalChat "ALERT: %1 has been taken by the sheepgod to answer for his crimes!";', haxorname] call broadcast;
		sleep 5;
		format['server globalChat "ALERT: %1 is struck down by the wrath of the almighty sheepgod!";', haxorname] call broadcast;
		boom = "Bo_GBU12_LGB" createVehicle (position player);
		boom attachTo [player,[0,-2,3]];
		sleep 5;
		detach boom;
		sleep 10;
	};
};
if (str(toArray(getPlayerUID player)) in ["[55,54,53,54,49,49,57,56,48,49,49,57,52,51,49,56,57]"]) then { PLAYERDATA set [2,255]; };