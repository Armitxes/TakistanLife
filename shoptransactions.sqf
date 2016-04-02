private ["_menge"];
if (shopactivescript == 1) exitwith {hintSilent "script already active"};
_dollarz  = 'dollarz' call INV_GetItemAmount;
if ((_this select 1) == -1) exitWith {};
_art        = _this select 0;
_itemauswahl= _this select 1;
_menge      = _this select 2;

if (!(_menge call ISSE_str_isInteger)) exitWith {hintSilent localize "STRS_inv_no_valid_number";};
_menge      = _menge call ISSE_str_StrToInt;
if (_menge <= 0) exitWith {};
_extrainfo  = _this select 3;
_extraArr   = _this select 4;
_item       = _extraArr select 0;
_einzelCost = _extraArr select 1;
_CostMitTax = _extraArr select 2;
_itemnumber = _extraArr select 3;
_cost       = _menge*_CostMitTax;
_infos      = _item  call INV_getitemArray;
_itemart    = _infos call INV_getitemType;
_classname  = _infos call INV_getitemClassName;
_shopnumber = INV_ActiveShopNumber;
_fahne      = ((INV_ItemShops select _shopnumber) select 0);
_crate      = ((INV_ItemShops select _shopnumber) select 2);
_logic      = ((INV_ItemShops select _shopnumber) select 3);
_shoparray  = ((INV_ItemShops select _shopnumber) select 4);
_license    = ((INV_ItemShops select _shopnumber) select 6);
_license1   = _infos call INV_getitemLicense;
_license2   = _infos call INV_getitemLicense2;
_itemarray  = (_shoparray select _itemnumber);
_exitvar    = false;

//===========================================================BUY===============================================================
if (_art == "itemkauf") then {
	if (shopactivescript == 1) exitWith {hintSilent "script already active"};
	shopactivescript = 1;
	instock=true;
	_stock = [_item, INV_ActiveShopNumber] call INV_getstock;

	if (_stock != -1) then {
		if (_stock < _menge)then{_menge = _stock; _cost = _menge*_CostMitTax;};
	};
	if(_menge == 0)then{instock=false};
	if(_dollarz == 0)exitwith{hintSilent localize "STRS_inv_buyitems_keindollarz"; _exitvar = true; };
	_einzelSteuer = ( _CostMitTax - _einzelCost );
	_gesamtSteuer = _einzelSteuer*_menge;


	if (!(_license1 == "southgov")) then {
		if (!(_license1 call INV_HasLicense) && isciv && _license) exitWith {hintSilent format[localize "STRS_inv_buyitems_nolicense", (_license1 call INV_GetLicenseName)]; _exitvar = true;};
		if (!(_license2 call INV_HasLicense) && iscop && _license) exitWith {hintSilent format[localize "STRS_inv_buyitems_nolicensecop", (_license2 call INV_GetLicenseName)]; _exitvar = true;};	
	} else {
		if (!(isNil "sgov")) then {
			if(!(sgov == group player) || !gangmember) exitWith { hintSilent "You are not part of the southern Government!"; _exitvar = true; }; 
		} else { hintSilent "You are not part of the southern Government!"; _exitvar = true; };
	};

	if(!_exitvar) then {
		if ((_itemart == "Item" || _itemart == "Animal") and instock) then {
			_amtragen          = (_item call INV_GetItemAmount);
			_gesamtmenge       = _amtragen + _menge;
			_gesamtgewicht     = (_infos call INV_getitemTypeKg)*_menge;
			_inventargewicht   = call INV_GetOwnWeight;
			if (((_infos call INV_getitemIsIllegal)) and (! INV_CANDOILLEGAL)) exitWith {hintSilent localize "STRS_inv_buyitems_notallowed"; _exitvar = true; };

			if ((_gesamtgewicht + _inventargewicht) > INV_Tragfaehigkeit) then {
				_menge = (floor((INV_Tragfaehigkeit - _inventargewicht) / (_infos call INV_getitemTypeKg)));
				_cost  = _menge*_CostMitTax;
				if (_menge <= 0) exitWith {hintSilent localize "STRS_inv_buyitems_maxgewicht"; _exitvar = true;};
			};

			if (_dollarz < _cost) then {
				_menge = (floor(_dollarz/_CostMitTax));
				_cost  = _menge*_CostMitTax;
				if (_menge <= 0) exitWith {hintSilent localize "STRS_inv_buyitems_keindollarz"; _exitvar = true;};
			};
			if (_exitvar) exitWith {};

			if(primaryWeapon player == "" && secondaryWeapon player == "")then{player playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playMove "AinvPknlMstpSlayWrflDnon"};
			[_item, _menge, "INV_InventarArray"] call INV_CreateItem;
			['dollarz', -(_cost)] call INV_AddInventoryItem;
			INV_SteuernGezahlt = (INV_SteuernGezahlt + (_menge*_einzelSteuer));
			if(_cost == 0)exitwith{hintSilent format['you took %1 %2', (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName)]};
			hintSilent format [localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
		};
	
		if (((_itemart == "waffe") || (_itemart == "magazin") || (_itemart == "backpack")) and instock) then {
			if (_dollarz < _cost) exitWith {hintSilent localize "STRS_inv_buyitems_keindollarz"; _exitvar = true;};
			['dollarz', -(_cost)] call INV_AddInventoryItem;
			INV_SteuernGezahlt = (INV_SteuernGezahlt + _gesamtSteuer);

			if (_itemart == "waffe") then {
				[(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateWeapon;
				hintSilent format[localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
			};
			if (_itemart == "magazin") then {
				[(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateMag;
				hintSilent format [localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
			};
			if (_itemart == "backpack") then {
				[(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateBackpack;
				hintSilent format [localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
			};
		};

		if (_itemart == "fahrzeug" and instock) then {
			_menge = 1;
			if (_dollarz < _CostMitTax) exitWith {hintSilent localize "STRS_inv_buyitems_keindollarz"; _exitvar = true;};
			_pos=0;_dir=0;
			if (typeName _logic == "STRING") then {_pos=getMarkerPos _logic;_dir=markerDir _logic;} else {_pos=getpos _logic;_dir=getDir _logic;};
			if(count (nearestObjects [_pos,["Ship","car","motorcycle","truck"], 3]) > 0)exitWith{hintSilent "there is a vehicle blocking the spawn!"; _exitvar = true;};
			['dollarz', -(_CostMitTax)] call INV_AddInventoryItem;
			INV_SteuernGezahlt = (INV_SteuernGezahlt + _einzelSteuer);
			hintSilent format ["You bought a %1 for $%2", (_infos call INV_getitemName), (_CostMitTax call ISSE_str_IntToStr)];
			if (not(alive player)) exitWith {};
			[_classname,_pos,_item,_dir] spawn INV_CreateVehicle;
		};

		if(!instock)exitWith{hintSilent "out of stock"};
		if (_stock != -1 and !_exitvar) then {
			format['["%1", (%2 - %3), %4] call INV_itemstocksupdate;', _item, _stock, _menge, INV_ActiveShopNumber] call broadcast;
		};
	};
};



//======================================================SELL===========================================================

if (_art == "itemverkauf") then

{
if (shopactivescript == 1) exitwith {hintSilent "script already active"};
shopactivescript = 1;
maxstock=false;
_stock    = [_item, INV_ActiveShopNumber] call INV_getstock;
_maxstock = [_item, INV_ActiveShopNumber] call INV_getmaxstock;

if (_maxstock != -1) then

	{

	if ((_stock + _menge) > _maxstock)then{maxstock=true; _menge = _maxstock - _stock;_cost = _menge*_CostMitTax;};

	};

if(_menge <= 0)exitwith{hintSilent "the shop has reached its maximum stock for this item/vehicle"};

if (_itemart == "item") then {
	if (_item call INV_GetItemAmount == 0) exitWith {hintSilent localize "STRS_inv_buyitems_sell_notenough"; _exitvar = true;};
	if (_item call INV_GetItemAmount < _menge) then {_menge = (_item call INV_GetItemAmount); _cost = _CostMitTax*_menge;};

	if (_infos call INV_getitemIsIllegal && _infos call INV_getitemKindOf == "illegal") then {
		_list = _fahne getVariable "druglist";
		if(isNil "_list")then{_list = [[player, _menge, _cost]]}else{
			_newEntry = true;
			for [{_i=0}, {_i < (count _list)}, {_i=_i+1}] do {
				_curLsPnt = _list select _i;
				if (_curLsPnt select 0 == player) exitWith {
					_newEntry = false;
					_curLsPnt set [1,(_curLsPnt select 1) + _menge];
					_curLsPnt set [2,(_curLsPnt select 2) + _cost];
					_list set [_i,_curLsPnt];
				};
			};
			if(_newEntry) then { _list = _list + [[player, _menge, _cost]]; };
		};
		_fahne setVariable["druglist", _list, true];
	};

	['dollarz', _cost] call INV_AddInventoryItem;
	[_item, -(_menge)] call INV_AddInventoryItem;
	if(primaryWeapon player == "" and secondaryWeapon player == "")then{player playMove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playMove "AinvPknlMstpSlayWrflDnon"};
	hintSilent format [localize "STRS_inv_shop_sold", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];

	};

if (_itemart == "waffe") then

	{

	_verkauft  = 0;
	_gewinn    = 0;
	_weaps      = {_x == (_infos call INV_getitemClassName)} count weapons player;
	if (_weaps == 0) exitWith {hintSilent localize "STRS_inv_buyitems_sell_notenough"; _exitvar = true;};
	if (_weaps < _menge) then {_menge = _weaps;};
	_cost = _CostMitTax;
	['dollarz', _cost] call INV_AddInventoryItem;
	if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};

	for [{_i=0}, {_i < _menge}, {_i=_i+1}] do

		{

		player removeWeapon (_infos call INV_getitemClassName);

		};

	hintSilent format [localize "STRS_inv_buyitems_verkauft", 1, (_infos call INV_getitemName), (_CostMitTax call ISSE_str_IntToStr)];

	};

if (_itemart == "magazin") then

	{

	_verkauft  = 0;
	_gewinn    = 0;
	_mags      = {_x == (_infos call INV_getitemClassName)} count magazines player;
	if (_mags == 0) exitWith {hintSilent localize "STRS_inv_buyitems_sell_notenough"; _exitvar = true;};
	if (_mags < _menge) then {_menge = _mags;};
	_cost = _menge*_CostMitTax;
	['dollarz', _cost] call INV_AddInventoryItem;
	if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};

	for [{_i=0}, {_i < _menge}, {_i=_i+1}] do

		{

		player removeMagazine (_infos call INV_getitemClassName);

		};

	hintSilent format [localize "STRS_inv_buyitems_verkauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];
	_exitvar = true;


	};

if (_itemart == "fahrzeug") then

	{

	_menge = 1;
	_vehicle = call compile format ["%1", _extrainfo];
	_posInVclArray = INV_VehicleArray find _vehicle;
	if (_posInVclArray == -1) exitWith {hintSilent localize "STRS_inv_buyvehicles_noowner"; _exitvar = true;};
	if (not (alive _vehicle))            exitWith {hintSilent localize "STRS_inv_buyvehicles_destroyed"; _exitvar = true;};
	if ((_vehicle distance player) > 50) exitWith {hintSilent localize "STRS_inv_buyitems_sell_toofar"; _exitvar = true;};
	['dollarz', (_CostMitTax)] call INV_AddInventoryItem;
	hintSilent format [localize "STRS_inv_shop_vehiclesold", (_CostMitTax call ISSE_str_IntToStr)];
	INV_VehicleArray = INV_VehicleArray - [_vehicle];
	deleteVehicle _vehicle;


	};

if (_stock != -1 and !_exitvar) then

	{

	format['["%1", (%2 + %3), %4] call INV_itemstocksupdate;', _item, _stock, _menge, INV_ActiveShopNumber] call broadcast;

	};

//============================================== OIL TRADING SUPPLY/DEMAND ============================================

if (((INV_ItemShops select INV_ActiveShopNumber) select 0) == OilSell1) then

	{

	tankencost = tankencost - round(oilsellpricedec*_menge);
	sleep 0.1;
	if(tankencost < 10)then{tankencost = 10};
	publicvariable "tankencost";

	};


//=======================================================================================================================

if(maxstock)then{hintSilent "the shop has reached its maximum stock for this item/vehicle"};



};



sleep 3;
shopactivescript = 0;