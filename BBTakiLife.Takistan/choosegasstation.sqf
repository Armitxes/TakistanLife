_item    = _this select 0;
_infos   = _item call INV_getitemArray;

_fuelsinv   = (fuelshop1 call INV_getshopArray) select 4;
_mineinv	= (oil_1 call INV_getshopArray) select 4;
_tuneinv 	= (tuning1 call INV_getshopArray) select 4;

if ([_item, _fuelsinv] call INV_iteminshop) exitwith

{

if (!(createDialog "distribute10")) exitWith {hint "Dialog Error!"};

//===================== FUEL SHOP 1====================================

_shopnum      = fuelshop1 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [3, format["FuelShop1 for $%1", _preis]];
buttonSetAction [3, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

//===================== FUEL SHOP 2====================================

_shopnum      = fuelshop2 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [4, format["FuelShop2 for $%1", _preis]];
buttonSetAction [4, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

//=====================FUEL SHOP 3====================================

_shopnum      = fuelshop3 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [5, format["FuelShop3 for $%1", _preis]];
buttonSetAction [5, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

//=====================FUEL SHOP 4====================================

_shopnum      = fuelshop4 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [6, format["FuelShop4 for $%1", _preis]];
buttonSetAction [6, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];



//=====================FUEL SHOP 5====================================

_shopnum      = fuelshop5 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [7, format["FuelShop5 for $%1", _preis]];
buttonSetAction [7, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];



//=====================FUEL SHOP 6====================================

_shopnum      = fuelshop6 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [8, format["FuelShop6 for $%1", _preis]];
buttonSetAction [8, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];



//=====================FUEL SHOP 7====================================

_shopnum      = fuelshop7 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [9, format["FuelShop7 for $%1", _preis]];
buttonSetAction [9, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];



//=====================FUEL SHOP 8====================================

_shopnum      = fuelshop8 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [10, format["FuelShop8 for $%1", _preis]];
buttonSetAction [10, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

//=====================FUEL SHOP 9====================================

_shopnum      = fuelshop9 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [10, format["FuelShop8 for $%1", _preis]];
buttonSetAction [10, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

//=====================FUEL SHOP 10====================================

_shopnum      = fuelshop10 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [10, format["FuelShop8 for $%1", _preis]];
buttonSetAction [10, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];
};

if ([_item, _mineinv] call INV_iteminshop) exitwith

{

if (!(createDialog "distribute1")) exitWith {hint "Dialog Error!"};

//=====================MINING TOOLS====================================

_shopnum      = Oil_1 call INV_getshopnum;
_stock        = [_item, _shopnum] call INV_getstock;
_maxstock     = [_item, _shopnum] call INV_getmaxstock;
_preisOhneTax = (_infos call INV_getitemBuyCost)*1;
_preis        = (_infos call INV_getitemCostWithTax)*1;
_demand       = _preis*0.5*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

ctrlSetText [3, format["MiningTools for $%1", _preis]];
buttonSetAction [3, format['[%1,"%2",%3,%4,%5] execVM "exportitem.sqf";', _preis, _item, _stock, _maxstock, _shopnum]];

};


hintSilent "No shops will buy the selected item.";
