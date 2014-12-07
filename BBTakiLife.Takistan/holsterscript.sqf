 _art = _this select 0;

if (_art == "use") then

{

_item   = _this select 1;
_anzahl = _this select 2;

if (_item == "pistole") then

	{

	["animation", "unholsterPistol"] execVM "holsterscript.sqf";

	 };

if (_item == "gewehr")  then

	{

	["animation", "unholsterRifle"]  execVM "holsterscript.sqf";

	};

};

if (_art == "animation") then

	{

	_animScriptName     = _this select 1;
	if (isNil "INV_changeweapon_active") then {INV_changeweapon_active = 0;};
	if (INV_changeweapon_active == 1) exitWith {player groupChat localize "STRS_inv_item_waffe_noholster";};
	INV_changeweapon_active = 1;
	if (player == vehicle player) then {(format ["%1 switchmove ""normal"";", player]) call broadcast;
	sleep 0.5;

	};

if (isNil "INV_InventarPistole") then {INV_InventarPistole = "";};
if (isNil "INV_InventarRifle")   then {INV_InventarRifle   = "";};
if (('pistole' call INV_GetItemAmount) == 0) then {INV_InventarPistole = "";};
if (('gewehr'  call INV_GetItemAmount) == 0) then {INV_InventarRifle   = "";};
_HandWeapon = "";
_invWeapon  = "";

if ((_animScriptName == "HolsterPistol") or (_animScriptName == "unholsterPistol")) then

	{

		{

		if ((_x call INV_GetWeaponTyp) == 1) then {_HandWeapon = _x;};

		} forEach (weapons player);

	_invWeapon = INV_InventarPistole;

	}
	else
	{

		{

		if ((_x call INV_GetWeaponTyp) == 2) then {_HandWeapon = _x;};

		} forEach (weapons player);

	_invWeapon = INV_InventarRifle;

	};

if ((_animScriptName == "HolsterPistol") or (_animScriptName == "HolsterRifle")) then

	{

	if (_HandWeapon == "") exitWith {player groupChat localize "STRS_inv_item_waffe_noweapon";};
	player RemoveWeapon _HandWeapon;
	sleep 4;
	if (_invWeapon != "") then {player AddWeapon _invWeapon;player groupChat localize "STRS_inv_item_waffe_weaponHiddenAlready";

	}
	else
	{

	player groupChat localize "STRS_inv_item_waffe_weaponHidden";

	};

if (_animScriptName == "HolsterPistol") then

	{

	['pistole', 1] call INV_SetItemAmount;
	INV_InventarPistole = _HandWeapon;

	}
	else
	{

	['gewehr', 1] call INV_SetItemAmount;
	INV_InventarRifle = _HandWeapon;

	};

};

if ((_animScriptName == "unholsterPistol") or (_animScriptName == "unholsterRifle")) then

	{

	if (_invWeapon == "") exitWith {};
	if (_HandWeapon != "") then

		{

		player RemoveWeapon _invWeapon;
		sleep 4;
		player groupChat localize "STRS_inv_item_waffe_weaponHiddenAlready";

		}
		else
		{

		player groupChat localize "STRS_inv_item_waffe_weaponTakenout";

		};

	if (_animScriptName == "unholsterPistol") then

		{

		player AddWeapon INV_InventarPistole;
		INV_InventarPistole = _HandWeapon;

		if (not(INV_InventarPistole == "")) then

			{

			['pistole', 1] call INV_SetItemAmount;

			}
			else
			{

			['pistole', 0] call INV_SetItemAmount;

			};

		}
		else
		{

		player AddWeapon INV_InventarRifle;
		INV_InventarRifle = _HandWeapon;
		if (not(INV_InventarRifle == "")) then {['gewehr', 1] call INV_SetItemAmount;} else {['gewehr', 0] call INV_SetItemAmount;};

		};

	};

sleep 4;
INV_changeweapon_active = 0;

};

