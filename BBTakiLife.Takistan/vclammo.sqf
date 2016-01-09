_art = _this select 0;

if (_art != "use") exitwith {};


_item   	= _this select 1;
_anzahl 	= _this select 2;
_rocket = ["12Rnd_CRV7","14Rnd_FFAR","1200Rnd_20mm_M621"];

_vcl    	= vehicle player;

if (player == _vcl) exitWith {player groupChat localize "STRS_inv_item_vclammo_novehicle";};

_role		= assignedVehicleRole player;
_path		= _role select 1;

//if (isNil "_path") exitwith {player groupchat "You cannot rearm in this seat!"};

_weapons	= (vehicle player) weaponsTurret _path;
if ((count _weapons) <= 0) exitwith {player groupchat "This seat has no weapons!"};

{
	_mag = ((getArray (configFile >> "cfgWeapons" >> _x >> "Magazines")) select 0);
if (_mag in _rocket) exitwith {player groupchat "You cannot rearm this weapon"};
	_vcl addMagazineTurret[_mag, _path];
} forEach _weapons;


player groupChat localize "STRS_inv_item_vclammo_rearmed";
[_item, -1] call INV_AddInventoryItem;