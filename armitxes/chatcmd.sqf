_cmd = _this select 0;

switch (_cmd) do {
	case "/log admin": { ["show","admin"] execVM "armitxes\logs.sqf"; };
	case "/log crimes": { ["show","crimes"] execVM "armitxes\logs.sqf"; };
	case "/log finances": { ["show","finances"] execVM "armitxes\logs.sqf"; };
	case "/log police": { ["show","police"] execVM "armitxes\logs.sqf"; };
	case "/log other": { ["show","other"] execVM "armitxes\logs.sqf"; };
	case "/stock weapons": {
		lguninv = (gunshop1 call INV_getshopArray) select 4;

		if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
		disableSerialization;

		{
			lmaxstock = [_x, 14] call INV_getmaxstock;
			if (lmaxstock != -1) then {
				lstock = [_x, 14] call INV_getstock;
				lbAdd [1,(format ["%1: %2/%3", _x, lstock, lmaxstock])];
			};
		} forEach lguninv;
	};
	default { systemChat "Unknown command"; };
};
