_this = _this select 3;
_art   = (_this select 0);
_num   = (_this select 1);
_dollarz  = 'dollarz' call INV_GetItemAmount;

if (_art == "immobilie") then

{

_cost = ((BuyAbleBuildingsArray select _num) select 3);
_name = ((BuyAbleBuildingsArray select _num) select 0);

if (_name in BuildingsOwnerArray) exitWith {hintSilent localize "STRS_alreadygotshop";};
if (_dollarz < _cost)                exitWith {hintSilent localize "STRS_kein_dollarz";};
['dollarz', -(_cost)] call INV_AddInventoryItem;
hintSilent format[localize "STRS_gotshop", rolestring, (_cost call ISSE_str_IntToStr)];
BuildingsOwnerArray = BuildingsOwnerArray + [_name];

};

