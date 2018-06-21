/* Anti Cheat */
_glClassesNames = ["carpetbomb_menu","playerhijack_menu","chernorus_life_menu","zargabad_menu","joker_menu","endgame_menu",
"AlexAdmin_menu","lblmsgtimeout","Alexander_menu","artillery_barrageWF","AnthonyMcle","ChernoRape_menu","MightyGerk_menu","SpawnSoldier_menu",
"AtackPlanes","GrkTeleport","crpbmb_menu","Delete_menu","collection_123456","Verbal_menu","playerhijack_menu","lblspvehicle",
"gerklusban","btnCarpetOk","UntiFreezee","lblhight","ChernoRape_menu","undetected_1","ultimate_123","btnbebanus","Ribeliona", "DevCon"];

for "_i" from 0 to ((count _glClassesNames) - 1) do
{
	_curClassName = (_glClassesNames select _i);
	if (isClass (configFile >> _curClassName)) exitWith {
		anticheat = format ["ALERT: %1 has been caught cheating!", name player];
		publicVariable "anticheat";
	};
};
