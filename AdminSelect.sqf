// Made By TomNyeTheScGuy.........
AdminSelect = lbCurSel 2119;

switch (AdminSelect) do
{
    case 0: //Player Controls
	{
		execVM "kick.sqf";
	};
    case 1: //Vehicle Spawns
	{
		execVM "vitems.sqf";
	};
    case 2: //God
	{
    _start = createDialog "GodMenu";
    #define GodMenu 14098
  };
};
