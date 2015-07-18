INV_PLAYERLIST	        = _this select 0;
INV_PLAYERSTRINGLIST    = _this select 1;
INV_CANDOILLEGAL        = _this select 2;
INV_ROLESTRING          = format["%1", player];
INV_SaveVclArray        = true;
INV_VehicleArray        = [];
INV_ServerVclArray      = [];
INV_shortcuts           = true;
INV_JIP = true; publicVariable "INV_JIP";
_handler = [] execVM "INVfunctions.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "createfunctions.sqf";
waitUntil {scriptDone _handler};
if (!isDedicated) then {
	_handler = [] execVM "carparks.sqf";
	waitUntil {scriptDone _handler};	
};
_handler = [] execVM "masterarray.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "shops.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "vclarrsave.sqf";

if (!isDedicated) then { _handler = [] execVM "shopfarmfaclicenseactions.sqf"; };