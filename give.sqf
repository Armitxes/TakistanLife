_art         = _this select 0;
_item        = _this select 1;
_menge       = _this select 2;
_itemanzeige = (_item call INV_getitemName);

if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};

if (_art == "uebergabe") then

{

_spielernum   = call compile (_this select 3);
_spieler      = INV_PLAYERSTRINGLIST select _spielernum;
_playerobject = call compile _spieler;
_closeplayers = nearestobjects [getpos player, ["LandVehicle", "Air", "Man"], 20];

if (!(_playerobject call ISSE_UnitExists))                exitWith {hintSilent localize "STRS_inv_not_ingame";};

if (_playerobject == player)                         exitWith {hintSilent localize "STRS_inv_inventar_uebergabe_self";};
//call compile format['if (%1 == player) exitWith {hintSilent localize "STRS_inv_inventar_uebergabe_self";};', _spieler];

if (!(_playerobject in _closeplayers) and (player distance _playerobject > 20))              exitWith {hintSilent localize "STRS_inv_inventar_uebergabe_distance";};
//if (!(_spieler in _closeplayers) and (player distance _playerobject > 20))              exitWith {hintSilent localize "STRS_inv_inventar_uebergabe_distance";};

if (!(_item call INV_getitemGiveable))               exitWith {hintSilent localize "STRS_inv_inventar_uebergabe_verbot";};
if (!([_item, -(_menge)] call INV_AddInventoryItem)) exitWith {hintSilent localize "STRS_inv_inventar_uebergabe_zuwenig";};

format ["if (player == %1) then {[""bekommen"", ""%2"", %3, %4] execVM ""give.sqf"";};", _playerobject, _item, _menge, player] call broadcast;
//format ["if (player == %1) then {[""bekommen"", ""%2"", %3, %4] execVM ""give.sqf"";};", _spieler, _item, _menge, player] call broadcast;

hintSilent format [localize "STRS_inv_inventar_uebergabe_success_self", name _playerobject, (_menge call ISSE_str_IntToStr), _itemanzeige];
//hintSilent format [localize "STRS_inv_inventar_uebergabe_success_self", name (call compile _spieler), (_menge call ISSE_str_IntToStr), _itemanzeige];

};

if (_art == "bekommen") then

{

_spieler = _this select 3;

if ([_item, _menge] call INV_AddInventoryItem) then

	{

	hintSilent format[localize "STRS_inv_inventar_gotfromotherplayer", (_menge call ISSE_str_IntToStr), _itemanzeige, name _spieler];

	}
	else
	{

	format ["if (player == %1) then {[""%2"", %3] call INV_AddInventoryItem;};", _spieler, _item, _menge] call broadcast;

	};

};
