if ((_this select 0) == "") exitWith {hintSilent localize "STRS_inv_no_selection";};
_item        = _this select 0;
_fabriknum   = _this select 1;
_type        = _this select 2;
_queue       = (INV_ItemFabriken select _fabriknum) select 8;
_ablage      = (INV_ItemFabriken select _fabriknum) select 7;
_spawn       = (INV_ItemFabriken select _fabriknum) select 4;
_crate       = (INV_ItemFabriken select _fabriknum) select 3;
_name        = (INV_ItemFabriken select _fabriknum) select 2;
_infos       = _item call INV_getitemArray;
_classname   = _infos call INV_getitemClassName;
_cost	     = (_infos call INV_getitemBuyCost)*0.5;
_itemart     = _infos call INV_getitemType;

if(_type == "mani")then{
  if ((PLAYERDATA select 1) < _cost) exitWith { hintSilent "You don't have enough money in your bankaccount"; };
  [-(_cost)] call setMoney;
  call compile format['%1 = %1 + [_item]; %2pend = %2pend + 1;', _queue, _item];
  hintSilent "Added to the production line";
};

if(_type == "create")then

{

if(fvspam)exitWith{};
if(favail < 1)exitWith{hintSilent "There are no vehicles of this type available"};
if(count (nearestobjects [getpos _spawn,["Ship","car","motorcycle","truck"], 3]) > 0)exitwith{hintSilent "there is a vehicle blocking the spawn!";};
call compile format['favail = %1avail; %1avail = %1avail - 1;', _item];

if (_itemart == "Item")     then {hintSilent "creating...";closeDialog 0;fvspam=true;sleep 1;[_item, 1, _ablage] spawn INV_CreateItem;fvspam=false};
if (_itemart == "waffe")    then {hintSilent "creating...";closeDialog 0;fvspam=true;sleep 1;[(_infos call INV_getitemClassName), 1, _crate] spawn INV_CreateWeapon;fvspam=false};
if (_itemart == "magazin")  then {hintSilent "creating...";closeDialog 0;fvspam=true;sleep 1;[(_infos call INV_getitemClassName), 1, _crate] spawn INV_CreateMag;fvspam=false};
if (_itemart == "Fahrzeug") then {
  _pos=0;_dir=0;
  if (typeName _spawn == "STRING") then {_pos=getMarkerPos _spawn;_dir=markerDir _spawn;} else {_pos=getpos _spawn;_dir=getDir _spawn;};
  hintSilent "creating...";closeDialog 0;fvspam=true;sleep 5;[_classname, _pos, _item, _dir] spawn INV_CreateVehicle;fvspam=false
};

hintSilent "item created!";

};

if(_type == "export")then
{

if (_itemart == "magazin")exitwith{hintSilent "you cannot export this item!"};
  if(fvspam)exitwith{};
  if(favail < 1)exitwith{hintSilent "There are no items/vehicles of this type available"};
 

  if (_itemart == "Fahrzeug") then {closedialog 0;[_item] execVM "choosecity.sqf";};
  if (_itemart == "waffe") then {closedialog 0;[_item] execVM "choosegunshop.sqf";};
  _itemType     = _infos call INV_getitemKindOf;
  if (_itemType == "service") then {closedialog 0;[_item] execVM "choosegasstation.sqf";};
  if (_itemType == "Shop") then {closedialog 0;[_item] execVM "chooseshop.sqf";};
  if (_itemType == "carobjects") then {closedialog 0;[_item] execVM "choosetuning.sqf";};
};