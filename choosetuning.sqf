_item    = _this select 0;
_infos   = _item call INV_getitemArray;

_tuneinv 	= (tuning1 call INV_getshopArray) select 4;

if ([_item, _tuneinv] call INV_iteminshop) exitwith

{

if (!(createDialog "distribute3")) exitWith {hint "Dialog Error!"};

//=====================TUNING 1====================================

_shopnum      = Tuning1 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [3, format["Tuning1 for $%1", _preis]];
buttonSetAction [3, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

//=====================TUNING 2====================================

_shopnum      = Tuning2 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [4, format["Tuning2 for $%1", _preis]];
buttonSetAction [4, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

//=====================TUNING 3====================================

_shopnum      = Tuning3 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [5, format["Tuning3 for $%1", _preis]];
buttonSetAction [5, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

};


hintSilent "No shops will buy the selected item.";
