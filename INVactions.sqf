_action = _this select 0;
_item   = _this select 1;
_amount = _this select 2;

if (!(_amount call ISSE_str_isInteger))   exitWith {hintSilent localize "STRS_inv_no_valid_number";};
_amount = _amount call ISSE_str_StrToInt;
if (_amount > (_item call INV_GetItemAmount)) exitWith {};
_plyer = _this select 3;
if ((player call ISSE_IsVictim) or (!INV_CanUseInventory)) exitWith {hintSilent localize "STRS_inv_cannotUseNow";};
INV_InventarGiveReceiver = _plyer;

if ((_action == "use") and (INV_CanUseItem)) then {
  _fn = _item call INV_getitemFilename;
  if (_fn == "" || _fn == "code") then {
    if(_fn == "code") then { [_item call INV_getitemCode] call execString; } else { hintSilent localize "STRS_inv_inventar_cannotuse"; };
  } else {
    _pfad = format ["%1", _item call INV_getitemFilename];
  	["use", _item, _amount, []] execVM _pfad;
	};
};

if ((time_bank_lockout > time) && (_item call INV_getitemKindOf == "dollarz")) then {
  hintSilent "You are cannot drop/give money while in bank / casino lockout";
} else {
  if ((_action == "drop") and (INV_CanDropItem)) then { [_item, _amount] execVM "drop.sqf"; };
  if ((_action == "give") and (INV_CanGiveItem)) then { ["uebergabe", _item, _amount, _plyer] execVM "give.sqf"; };
};
