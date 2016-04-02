_cmd = _this select 0;

switch (_cmd) do {
	case "/log admin": { ["show","admin"] execVM "armitxes\logs.sqf"; };
	case "/log crimes": { ["show","crimes"] execVM "armitxes\logs.sqf"; };
	case "/log finances": { ["show","finances"] execVM "armitxes\logs.sqf"; };
	case "/log police": { ["show","police"] execVM "armitxes\logs.sqf"; };
	case "/log other": { ["show","other"] execVM "armitxes\logs.sqf"; };
	default { systemChat "Unknown command"; };
};