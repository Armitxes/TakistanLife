// "Function-Call" Script.
// invActions.sqf

// Add Item to Inventory
INV_AddInventoryItem = {
	private ["_c", "_Fitem", "_Famount", "_Finfos", "_Fgesamtgewicht"];
	_Fitem          = _this select 0;
	_Famount        = _this select 1;
	_Finfos         = _Fitem call INV_getitemArray;
	_Fgesamtgewicht = 0;
	_Fgesamtgewicht = ( (call INV_GetOwnWeight) + (_Famount * (_Finfos call INV_getitemTypeKg)) );
	if (_Famount > 0) then {
		if (_Fgesamtgewicht <= INV_Tragfaehigkeit) then {
			([_Fitem, _Famount, "INV_InventarArray"] call INV_AddItemStorage)
		} else {
			false
		};
	} else {
		([_Fitem, _Famount, "INV_InventarArray"] call INV_AddItemStorage)
	};
};


// Add Items to Storage
INV_AddItemStorage = {
	private ["_c", "_Fitem", "_Fmenge", "_Farrname", "_Farr", "_Farraynum", "_Fanzahl", "_Fextra", "_maxGewicht", "_curGewicht", "_addGewicht"];
	_Fitem      = _this select 0;
	_Fmenge     = _this select 1;
	_Farrname   = _this select 2;
	if (isNil(_Farrname)) then {_Farrname call INV_StorageLeeren};
	_Farr       = call compile _Farrname;
	_Farraynum  = -1;
	_Fanzahl    = 0;
	_maxGewicht = -1;
	_curGewicht = 0;
	_addGewicht = 0;

	if (count _this > 3) then {
		if (_Fextra != "") then {
			_Fextra     = _this select 3;
			_maxGewicht = ((_Fextra call INV_getitemOtherStuff) select 0);
			_curGewicht = _Farrname call INV_GetStorageWeight;
			_addGewicht = (_Fitem call INV_getitemTypeKg) * _Fmenge;
		};
	};

	if ( (_maxGewicht < 0) or (_maxGewicht >= (_curGewicht+_addGewicht)) ) then {
		for [{_i=0}, {_i < (count _Farr)}, {_i=_i+1}] do {
			if (((_Farr select _i) select 0) == _Fitem) exitWith {
				_Farraynum = _i;
				_Fanzahl   = ((_Farr select _i) select 1);
			};
		};
		if (_Fmenge > 0) then {
			if (_Farraynum == -1) then {
				call compile format ['%1 = %1 + [ [_Fitem, _Fmenge] ];', _Farrname];
				true
			} else {
				call compile format ['%1 SET [_Farraynum, [_Fitem, (_Fanzahl+_Fmenge)] ];', _Farrname];
				true
			};
		} else {
			if (_Farraynum == -1) then {
				false
			} else {
				if ((_Fanzahl+_Fmenge) < 0) then {
					false
				} else {
					call compile format ['%1 SET [_Farraynum, [_Fitem, (_Fanzahl+_Fmenge)] ];', _Farrname];
					true
				};
			};
		};
	} else {
		false
	};
};


// Calculate How Many Items are Stored.
INV_GetStorageAmount = {
	private ["_c", "_Result", "_arrname", "_Array", "_Itemname"];
	_Itemname = _this select 0;
	_arrname  = _this select 1;
	if (isNil(_arrname)) then {_arrname call INV_StorageLeeren};
	_Array    = call compile (_this select 1);
	_Result = 0;
	for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
		if (((_Array select _c) select 0) == _Itemname) exitWith {
			_Result = ((_Array select _c) select 1);
		};
	};

	_Result
};


// Storage (probably factories)
INV_ReturnAblage = {
	private ["_Result", "_arrname"];
	if (isNil(_this)) then {_this call INV_StorageLeeren};
	_Result = call compile _this;
	_Result};


// Find Quantity of Items
INV_getitemAmount = {([_this, "INV_InventarArray"] call INV_GetStorageAmount)};


// Change Amount of Items
INV_SetStorageAmount = {
	private ["_c", "_Result", "_Itemname", "_Array", "_Arrayname", "_Anzahl"];
	_Result    = false;
	_Itemname  = _this select 0;
	_Anzahl    = _this select 1;
	_Arrayname = _this select 2;
	if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
	_Array = call compile (_Arrayname);
	for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
		if (((_Array select _c) select 0) == (_this select 0)) exitWith {
			call compile format ["(%1 select %2) SET [1, %3];", _Arrayname, _c, _Anzahl];
			_Result = true;
		};
	};

	if ( (!(_Result)) and (_Anzahl != 0) ) then {
		_Result = [_Itemname, _Anzahl, _Arrayname] call INV_AddItemStorage;
	};

	_Result
};


// Change Amount of Items
INV_SetItemAmount = {
	([(_this select 0), (_this select 1), "INV_InventarArray"] call INV_SetStorageAmount)};
	INV_InventarLeeren = {
		private ["_FremoveItemInfos"];
		{
			if ((_x select 0) call INV_getitemLooseable) then {[(_x select 0), 0] call INV_SetItemAmount;};
		}
		forEach INV_InventarArray;
	};


// Check for a Type of Item in Storage
INV_StorageHasKindOf = {
					private ["_c", "_Itemart", "_Arrayname", "_Array", "_re"];
					_Arrayname = _this select 0;
					_Itemart   = _this select 1;
					_re         = false;
					if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
					_Array = call compile (_Arrayname);
					for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
						if (  ( (((_Array select _c) select 0) call INV_getitemKindOf)  == _Itemart ) and (((_Array select _c) select 1) > 0)  ) exitWith {
							_re = true;
						};
					};
					_re
};


// Remove One Type of Item From Storage
INV_StorageRemoveKindOf = {
	private ["_c", "_Itemart", "_Arrayname", "_Array"];
	_Arrayname = _this select 0;
	_Itemart   = _this select 1;
	if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
	_Array = call compile (_Arrayname);
	for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
		if ( (((_Array select _c) select 0) call INV_getitemKindOf)  == _Itemart ) then {
			call compile format ["(%1 select %2) SET [1, 0];", _Arrayname, _c];
		};
	};
	true
};


// Unknown
INV_StorageLeeren = {
	call compile format ["%1 = [];", _this];};


// Check Stored Item Weight
INV_GetStorageWeight = {
	private ["_c", "_Gewichtinfos", "_Feigengewicht", "_Arrayname", "_Array"];
	_Fgewicht     = 0;
	_Gewichtinfos = 0;
	_Arrayname    = _this;
	_Array        = [];
	if ((typeName _this) == "STRING") then {
		if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
		_Array = call compile (_Arrayname);
	} else {
		_Array = _Arrayname;
	};
	for [{_c=0}, {_c < (count _Array)}, {_c=_c+1}] do {
		_Fgewicht = _Fgewicht + ( ((_Array select _c) select 1) * (((_Array select _c) select 0) call INV_getitemTypeKg) );
	};
	_Fgewicht
};


// Get Current Weight
INV_GetOwnWeight = {("INV_InventarArray" call INV_GetStorageWeight)};


// Check if you are Allowed This Item
INV_CheckIllegalStorage = {
	private ["_c", "_Arrayname", "_Array", "_re"];
	_Arrayname = _this;		_re        = false;
	if (isNil(_Arrayname)) then {_Arrayname call INV_StorageLeeren};
	_Array = call compile (_Arrayname);
	{
		if
		( ((_x select 1) > 0) and ((_x select 0) call INV_getitemIsIllegal) ) exitWith {
			_re = true;
		};
	}
	forEach _Array;
	_re
};


// Remove Items that Cannot Exist
INV_RemoveIllegalStorage = {
	private ["_c", "_Arrayname", "_Array", "_re"];
	_vcl       = _this select 0;
	_Arrayname = _this select 1;
	_re        = false;
	drugsvalue = 0;

	if ([_arrayname, "illegal"] call INV_StorageHasKindOf) then

	{

	_array = call compile format["%1", _arrayname];

	for [{_i=0}, {_i < (count _Array)}, {_i=_i+1}] do

		{

		_item   = ((_Array select _i) select 0);
		_infos  = _item call INV_getitemArray;};

	[_arrayname, "illegal"] call INV_StorageRemoveKindOf;
	_re        = true;
	(format ["if (player == %2) then {hintSilent ""%1 had Illegal Items in its trunk, you removed them.""};", _vcl, player]) call broadcast;

	}
	else
	{

	hintSilent "No illegal items found.";

	};

_re

};


// Remove Illegal Items
INV_EntferneIllegales = {
   private["_illegalinfos", "_illwArray", "_illmags"];
   _Fhasnvgoogles  = 0;
   if (player hasWeapon "NVGoggles") then {_Fhasnvgoogles = 1; };
   _Fhasbinoculars = 0;
   if (player hasWeapon "Binocular") then {_Fhasbinoculars = 1;};
   REMOVEALLWEAPONS player;
   player REMOVEMAGAZINES "Handgrenade";
   player REMOVEMAGAZINES "Pipebomb";
   player REMOVEMAGAZINES "Mine";
   ["INV_InventarArray", "weapon"] call INV_StorageRemoveKindOf;
   ["INV_InventarArray", "Magazin"] call INV_StorageRemoveKindOf;
	pistolHolster = "";
	primHolster = "";
   If (_Fhasnvgoogles == 1)  then {player addWeapon "NVGoggles";};
   If (_Fhasbinoculars == 1) then {player addWeapon "Binocular";};
   {
      if ( ((_x select 0) call INV_getitemAmount) > 0) then
      {
         if ((_x select 0) call INV_getitemIsIllegal) then {[(_x select 0), 0] call INV_SetItemAmount;};
      };
   }
   forEach INV_InventarArray;
};


// Check if Storage is a Factory
INV_StorageIsFactory = {
	private ["_result"];
	_result = false;
	for [{_i=0}, {_i < (count INV_ItemFabriken)}, {_i=_i+1}] do {
		if (((INV_ItemFabriken select _i) select 7) == _this) exitWith {
			_result = true;
		};
	};
	_result
};

// Function Object Taxes
INV_GetObjectSteuer = {
	private ["_c", "_result"];
	_result = 0;
	for "_c" from 0 to (count INV_ItemTypenArray - 1) do {
		if (((INV_ItemTypenArray select _c) select 0) == _this) exitWith {
			_result = ((INV_ItemTypenArray select _c) select 2);
		};
	};
	_result
};


// Fuction Add Percent (Taxes)
INV_AddProzent = {
	private ["_wert", "_prozent", "_result"];
	_wert    = _this select 0;
	_prozent = _this select 1;
	_runden  = true;
	if (count _this > 2) then {_runden = _this select 2};
	if (_runden) then {
		_result  = round (  _wert + ((_wert / 100) * _prozent) );
	} else {
		_result  = (  _wert + ((_wert / 100) * _prozent)  );
	};
	_result
};

// Find Player Weapon Type, is either 1,2 or 3. See in INV_AlleWaffenObjekte, select 4 then select 0. Handgun is "1", rifle "2", explosives "3".
INV_GetWeaponTyp = {
	private ["_Fresult"];
	_Fresult = -1;
	{
		if (((_x select 2) select 0) == _this) then {
			_Fresult = ((_x select 4) select 0);
		};
	}
	forEach AlleMissionsObjekte;
	_Fresult
};


// Get Kind of Vehicle
INV_GetFahrzeugTyp = {
	private ["_Fresult"];
	_Fresult = -1;
	{
		if (((_x select 2) select 0) == _this) then {
			_Fresult = ((_x select 4) select 0);
		};
	}
	forEach AlleMissionsObjekte;
	_Fresult
};

// Check if Player is Armed
INV_isArmed = {if (count (weapons player - nonlethalweapons) > 0) then {true}else{false}};

// Check if unit is Armed
INV_unitArmed = {if (count (weapons _this - nonlethalweapons) > 0) then {true}else{false}};

//Function Item Taxes
INV_getitemSteuer= {
	private ["_type", "_item", "_result"];
	_type = _this call INV_getitemType;
	_cost = _this call INV_getitemBuyCost;
	[_cost, (_type call INV_GetObjectSteuer)] call INV_AddProzent;
};

// Check if Player Owns Licence
INV_HasLicense = {
	if ((_this == "") or (_this in INV_LizenzOwner)) then {
		true
	} else {
		false
	};
};

// Get Name of Licence
INV_GetLicenseName = {
	private ["_c"];
	for "_c" from 0 to (count INV_Lizenzen - 1) do {
		if (((INV_Lizenzen select _c) select 0) == _this) exitWith {
			((INV_Lizenzen select _c) select 2)
		};
	};
};

// Unknown
INV_GetScriptFromClass_Mag = {
	private ["_c", "_result"];
	_result = "";
	for "_c" from 0 to (count AlleMissionsObjekte - 1) do {
		if ((((INV_AlleMagazinObjekte select _c) select 2) select 0) == _this) exitWith {
			_result = ((INV_AlleMagazinObjekte select _c) select 0);
		};
	};
	_result
};


// Unknown
INV_GetScriptFromClass_Weap = {
	private ["_c", "_result"];
	_result = "";
	for "_c" from 0 to (count AlleMissionsObjekte - 1) do {
		if ((((INV_AlleWaffenObjekte select _c) select 2) select 0) == _this) exitWith {
			_result = ((INV_AlleWaffenObjekte select _c) select 0);
		};
	};
	_result
};


// Get item Array
INV_getitemArray = {
	private ["_c", "_Fobjarray"];
	_Fobjarray = [];
	if ((typeName _this) == "STRING") then {
		for "_c" from 0 to (count AlleMissionsObjekte - 1) do {
			if (((AlleMissionsObjekte select _c) select 0) == _this) then {
				_Fobjarray = AlleMissionsObjekte select _c;
			};
		};
	};
	if ((typeName _this) == "ARRAY") then {
		_Fobjarray = _this;
	};

	_Fobjarray
};

// Get shop array

INV_getshopArray = {
	private ["_c", "_Fshoparray"];
	_Fshoparray = [];
	if ((typeName _this) == "OBJECT") then {
		for "_c" from 0 to (count INV_itemshops - 1) do {
			if (((INV_itemshops select _c) select 0) == _this) then {
				_Fshoparray = INV_itemshops select _c;
			};
		};
	};
	if ((typeName _this) == "ARRAY") then {
		_Fshoparray = _this;
	};
	_Fshoparray
};

// Get shop number

INV_getshopnum = {
	private ["_c", "_Fshopnum"];
	_Fshopnum = [];
	if ((typeName _this) == "OBJECT") then {
		for [{_c=0}, {_c < (count INV_itemshops)}, {_c=_c+1}] do {
			if (((INV_itemshops select _c) select 0) == _this) then {
				_Fshopnum = _c;
			};
		};
	};

	_Fshopnum
};

// Get shopitem number

INV_getshopitemnum = {

private ["_c", "_Fshopitemnum"];
_Fshopitemnum = [];
_item = _this select 0;
_shopinv = _this select 1;

if ((typeName _item) == "STRING") then

	{

	for [{_c=0}, {_c < (count _shopinv)}, {_c=_c+1}] do

		{

		if ((_shopinv select _c) == _item) then

			{

			_Fshopitemnum = _c;

			};

		};

	};

_Fshopitemnum

};

// check if item is in a shop

INV_iteminshop = {
	private ["_c", "_Fiteminshop"];
	_Fiteminshop = [];
	_item = _this select 0;
	_shopinv = _this select 1;
	if ((typeName _item) == "STRING") then {
		for [{_c=0}, {_c < (count _shopinv)}, {_c=_c+1}] do {
			if ((_shopinv select _c) == _item) then {
				_Fiteminshop = true;
			};
		};
	};

if((typeName _Fiteminshop) == "ARRAY")then{_Fiteminshop = false};

	_Fiteminshop
};

INV_getstock = {
  _item    = _this select 0;
  _shopnum = (_this select 1);
  _shoparr = INV_itemshops select _shopnum;
  _shopinv = _shoparr select 4;
  _itemnum = [_item, _shopinv] call INV_getshopitemnum;

  if(typename (INV_itemmaxstocks select _shopnum) != "ARRAY")exitwith{-1};
  (INV_itemstocks select _shopnum) select _itemnum
};

INV_getmaxstock = {
  _item 	 = _this select 0;
  _shopnum = (_this select 1);
  _shoparr = INV_itemshops select _shopnum;
  _shopinv = _shoparr select 4;
  _itemnum = [_item, _shopinv] call INV_getshopitemnum;

  if(typename (INV_itemmaxstocks select _shopnum) != "ARRAY")exitwith{-1};

  (INV_itemmaxstocks select _shopnum) select _itemnum
};

INV_itemstocksupdate = {

_item     = _this select 0;
_stock    = _this select 1;
_shopnum  = _this select 2;
_shoparr  = INV_itemshops select _shopnum;
_shopinv  = (_shoparr select 4);
_itemnum  = [_item, _shopinv] call INV_getshopitemnum;

(INV_itemstocks select _shopnum) SET [_itemnum, _stock];

};

INV_findunit = {

_name   = _this select 0;
_arr    = _this select 1;
_unit   = objnull;

for "_i" from 0 to (count _arr) do

	{

	_obj = _arr select _i;
	if(isNil "_obj") exitWith{};
	if(!isNull _obj and name _obj == _name)exitwith{_unit = _obj};

	};

_unit

};


// Get Object Details
INV_getitemScriptName = { ((_this call INV_getitemArray) select 0)};
INV_getitemType = {((_this call INV_getitemArray) select 1) select 0};
INV_getitemKindOf = { ((_this call INV_getitemArray) select 1) select 1	 };
INV_getitemClassName = { ((_this call INV_getitemArray) select 2) select 0 };
INV_getitemName = {((_this call INV_getitemArray) select 2) select 1};
INV_getitemBuyCost = {((_this call INV_getitemArray) select 3) select 0 };
INV_getitemSellCost = { ((_this call INV_getitemArray) select 3) select 1 };
INV_getitemTypeKg = { ((_this call INV_getitemArray) select 4) select 0; };
INV_getvehmaxkg = { ((_this call INV_getitemArray) select 4) select 3 };
INV_getitemLicense = { ((_this call INV_getitemArray) select 4) select 1 };
INV_getitemLicense2 = { ((_this call INV_getitemArray) select 4) select 2};
INV_getitemOtherStuff = { ((_this call INV_getitemArray) select 5) };
INV_getitemDescription1 = { ((_this call INV_getitemArray) select 6) };
INV_getitemDescription2 = { ((_this call INV_getitemArray) select 7) };
INV_getitemMaterials = { ((_this call INV_getitemArray) select 8) };
INV_getitemCostWithTax  = { ((_this call INV_getitemArray) call INV_getitemSteuer) };
INV_getitemGiveable = { ((_this call INV_getitemArray) select 5) select 0 };
INV_getitemDropable = { ((_this call INV_getitemArray) select 5) select 1 };
INV_getitemLooseable = { ((_this call INV_getitemArray) select 5) select 2 };
INV_getitemIsIllegal = { ((_this call INV_getitemArray) select 5) select 3 };
INV_getitemFilename = { ((_this call INV_getitemArray) select 5) select 4 };
INV_getitemCode = { ((_this call INV_getitemArray) select 5) select 5 };
INV_getVehicleCanCarry = { ((_this call INV_getitemArray) select 5) select 0 };


// By Armi
INV_getItemID = {
	_id = -1;
	if ((typeName _this) == "STRING") then {
		for "_c" from 0 to (count INV_Lizenzen - 1) do {
			if (((INV_Lizenzen select _c) select 0) == _this) then { _id = _c; };
		};
	};
	_id
};

INV_getPistol = {
  {
    _t = _x call INV_GetWeaponTyp;
    if (_t == 1) exitWith {
      _x
    };
  } forEach ((weapons _this) - nonlethalweapons);
};
