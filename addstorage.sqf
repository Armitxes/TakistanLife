private ["_maxweight"];

if (isNil "INV_StorageSperre") then {INV_StorageSperre = false;};
//if (INV_StorageSperre) exitWith {hintSilent localize "STRS_inv_storage_spam";};
INV_StorageSperre = true;
//sleep 1;
_art      = _this select 0;
_arrname  = _this select 1;
_menge    = _this select 2;
if (!(_menge call ISSE_str_isInteger)) exitWith {hintSilent localize "STRS_inv_no_valid_number"; INV_StorageSperre = false;};
_menge    = _menge call ISSE_str_StrToInt;
if (_menge <= 0) exitWith {INV_StorageSperre = false;};
_item     = _this select 3;
_infos    = _item call INV_getitemArray;
_public   = _this select 4;
_arr      = call compile _arrname;
_vclStore = false;
_vclClass = "";
_packed   = false;
_storageweight = 0;
_collide = 0;

if (count (_this select 5) > 0) then {
	_extra = _this select 5;

	if (_extra select 0 == "vcl") then {
		call compile format ["%1 = name player; PublicVariable ""%1"";", format["%1_storagelock", _extra select 2]];
		sleep 0.5;
		call compile format ['if !(%1 == name player) then {_collide = 1;};', format["%1_storagelock", _extra select 2]];

		_vclStore = true;
		_vclClass = _extra select 1;
		_maxweight = _vclClass call INV_getvehmaxkg;
	};
};

if (_art == "nehmen" && _collide != 1) then {
	_itemweight = (_infos call INV_getitemTypeKg)*_menge;
	_ownweight  = call INV_GetOwnWeight;

	if ((_ownweight + _itemweight) > INV_Tragfaehigkeit) then {
		_amount = (floor((INV_Tragfaehigkeit - _ownweight) / (_infos call INV_getitemTypeKg)));
		if (_amount <= 0) exitWith { hintSilent localize "STRS_inv_buyitems_maxgewicht"; };
	} else {
		if ([_item, -(_menge), _arrname] call INV_AddItemStorage) then {
			[_item, _menge] call INV_AddInventoryItem;
			hintSilent format[localize "STRS_inv_storage_took", (_menge call ISSE_str_IntToStr)];
			_packed = true;
		} else { hintSilent localize "STRS_inv_storage_toomuch"; };
	};
};

if (_art == "ablegen") then {

	if (_vclStore) then {
		_storageweight = ( (_arrname call INV_GetStorageWeight) + (_menge * (_infos call INV_getitemTypeKg)) );
	};

	if(_storageweight > _maxweight)exitwith{hintSilent "The vehicle's storage is full";};
	if ((time_bank_lockout > time) && (_item call INV_getitemKindOf == "dollarz")) exitWith {hintSilent "You are cannot drop/give money while in  bank  lockout";};

	if
	(
		(_arrname call INV_StorageIsFactory) and
		(
			(_item call INV_getitemKindOf != "ressource") and
			(_item call INV_getitemKindOf != "drug") and
			(_item call INV_getitemKindOf != "dollarz")
		)
	) exitWith { hintSilent localize "STRS_inv_storage_dropnotallowed"; };

	if (not([_item, -(_menge)] call INV_AddInventoryItem)) then {
		hintSilent localize "STRS_inv_storage_dropunablesomuch";
	} else {
		if ([_item, _menge, _arrname, _vclClass] call INV_AddItemStorage) then {
			hintSilent format[localize "STRS_inv_storage_dropped", (_menge call ISSE_str_IntToStr)];
			_packed = true;
		} else { hintSilent localize "STRS_inv_storage_cannotdropsomuch"; };
	};
};

if (_art == "delete") then

{

if ([_item, -(_menge), _arrname] call INV_AddItemStorage) then

	{

	hintSilent format[localize "STRS_inv_storage_deleted", (_menge call ISSE_str_IntToStr)];
	_packed = true;

	}
	else
	{

	hintSilent localize "STRS_inv_storage_toomuch";

	};

};

if (_art == "add") then

{

if
(
(_arrname call INV_StorageIsFactory) and
	(
	(_item call INV_getitemKindOf != "ressource") and
	(_item call INV_getitemKindOf != "drug") and
	(_item call INV_getitemKindOf != "dollarz")
	)
) exitWith

	{

	hintSilent localize "STRS_inv_storage_dropnotallowed";

	};

if ([_item, _menge, _arrname, _vclClass] call INV_AddItemStorage) then

	{

	hintSilent format[localize "STRS_inv_storage_dropped", (_menge call ISSE_str_IntToStr)];
	_packed = true;

	}
	else
	{

	hintSilent localize "STRS_inv_storage_cannotdropsomuch";

	};

};

if (_packed) then

	{

	if (_public == "public") then {publicVariable _arrname;};

	if (player == vehicle player) then

	{

	format ["%1 playmove ""AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"";", player] call toClients;

	};

waituntil {animationstate player != "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"};

};
INV_StorageSperre = false;
