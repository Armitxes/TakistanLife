_art  = _this select 0;
_shop = _this select 1;


if (_art == "Start") exitwith
{
if (!(createDialog "distribute6")) exitwith {hint "Dialog Error!"};
ctrlSetText [7, format["Select Shop To Check Stocks"]];
ctrlSetText [3, format["Car Shop 1"]];
buttonSetAction [3, format['["Check",13] execVM "checkstocks.sqf";']];
ctrlSetText [4, format["Car Shop 2"]];
buttonSetAction [4, format['["Check",14] execVM "checkstocks.sqf";']];
ctrlSetText [5, format["Car Shop 3"]];
buttonSetAction [5, format['["Check",15] execVM "checkstocks.sqf";']];
ctrlSetText [6, format["Car Shop 4"]];
buttonSetAction [6, format['["Check",16] execVM "checkstocks.sqf";']];
ctrlSetText [7, format["Truck Shop 1"]];
buttonSetAction [7, format['["Check",17] execVM "checkstocks.sqf";']];
ctrlSetText [8, format["Truck Shop 2"]];
buttonSetAction [8, format['["Check",18] execVM "checkstocks.sqf";']];
};

if (_art == "VehicleStart") exitwith
{
if (!(createDialog "distribute4")) exitwith {hint "Dialog Error!"};
ctrlSetText [7, format["Select Shop To Check Stocks"]];
ctrlSetText [3, format["Car Shop 1"]];
buttonSetAction [3, format['["Check",13] execVM "checkstocks.sqf";']];
ctrlSetText [4, format["Car Shop 2"]];
buttonSetAction [4, format['["Check",14] execVM "checkstocks.sqf";']];
ctrlSetText [5, format["Car Shop 3"]];
buttonSetAction [5, format['["Check",16] execVM "checkstocks.sqf";']];
ctrlSetText [6, format["Truck Shop"]];
buttonSetAction [6, format['["Check",17] execVM "checkstocks.sqf";']];
};

if (_art == "GasStart") exitwith
{
if (!(createDialog "distribute4")) exitwith {hint "Dialog Error!"};
ctrlSetText [7, format["Select Shop To Check Stocks"]];
ctrlSetText [3, format["Gas Station 1"]];
buttonSetAction [3, format['["Check",0] execVM "checkstocks.sqf";']];
ctrlSetText [4, format["Gas Station 2"]];
buttonSetAction [4, format['["Check",1] execVM "checkstocks.sqf";']];
ctrlSetText [5, format["Gas Station 3"]];
buttonSetAction [5, format['["Check",2] execVM "checkstocks.sqf";']];
ctrlSetText [6, format["Gas Station 4"]];
buttonSetAction [6, format['["Check",3] execVM "checkstocks.sqf";']];
};

if (_art == "ShopStart") exitwith
{
if (!(createDialog "distribute4")) exitwith {hint "Dialog Error!"};
ctrlSetText [7, format["Select Shop To Check Stocks"]];
ctrlSetText [3, format["Shop 1"]];
buttonSetAction [3, format['["Check",4] execVM "checkstocks.sqf";']];
ctrlSetText [4, format["Shop 2"]];
buttonSetAction [4, format['["Check",5] execVM "checkstocks.sqf";']];
ctrlSetText [5, format["Shop 3"]];
buttonSetAction [5, format['["Check",6] execVM "checkstocks.sqf";']];
ctrlSetText [6, format["Shop 3"]];
buttonSetAction [6, format['["Check",7] execVM "checkstocks.sqf";']];
};

if (_art == "Check") Exitwith

{
if (!(createDialog "CheckDialog")) then {hint "Dialog Error!"};

INV_ActiveShopNumber    = _shop;
_itemarray   = ((INV_ItemShops select INV_ActiveShopNumber) select 4);

for [{_i=0}, {_i < (count _itemarray)}, {_i=_i+1}] do

{

_item         = _itemarray select _i;
_infos        = _item call INV_getitemArray;
_stock        = [_item, INV_ActiveShopNumber] call INV_getstock;
_preisOhneTax = _infos call INV_getitemBuyCost;
_preis        = _infos call INV_getitemSteuer;
_name         = (_infos call INV_getitemName);

if(_stock != -1) then

	{

	_maxstock     = [_item, INV_ActiveShopNumber] call INV_getmaxstock;
	_demand       = _preis*0.25*(_stock-(_maxstock*0.5))/(0.5*_maxstock);
	_preis        = round((_preisOhneTax*(_preis/_preisOhneTax)) - _demand);

	};

if (_stock != -1) then

	{

	if (_infos call INV_getitemType == "item") then

		{

		_index = lbAdd [1, format ["%1 (%2kg, Stock: %3)", _name, (_infos call INV_getitemTypeKg), _stock] ];

		}
		else
		{

		_index = lbAdd [1, format ["%1 (Stock: %2)", _name, _stock]];

		};

	}
	else
	{

	if (_infos call INV_getitemType == "item") then

		{

		_index = lbAdd [1, format ["%1 (%2kg)", _name, (_infos call INV_getitemTypeKg)] ];

		}
		else
		{

		_index = lbAdd [1, format ["%1", _name] ];

		};

	};

lbSetData [1, _index, format ["%1", _item] ];

};
};