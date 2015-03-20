if ((_this select 0) == "") exitWith {player groupChat localize "STRS_inv_no_selection";};
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
  if ((PLAYERDATA select 1) < _cost) exitWith { player groupChat "You don't have enough money in your bankaccount"; };
  [-(_cost)] call setMoney;
  call compile format['%1 = %1 + [_item]; %2pend = %2pend + 1;', _queue, _item];
  player groupChat "Added to the production line";
};

if(_type == "create")then

{

if(fvspam)exitWith{};
if(favail < 1)exitWith{player groupchat "There are no vehicles of this type available"};
if(count (nearestobjects [getpos _spawn,["Ship","car","motorcycle","truck"], 3]) > 0)exitwith{player groupchat "there is a vehicle blocking the spawn!";};
call compile format['favail = %1avail; %1avail = %1avail - 1;', _item];

if (_itemart == "Item")     then {player groupchat "creating...";closeDialog 0;fvspam=true;sleep 1;[_item, 1, _ablage] spawn INV_CreateItem;fvspam=false};
if (_itemart == "waffe")    then {player groupchat "creating...";closeDialog 0;fvspam=true;sleep 1;[(_infos call INV_getitemClassName), 1, _crate] spawn INV_CreateWeapon;fvspam=false};
if (_itemart == "magazin")  then {player groupchat "creating...";closeDialog 0;fvspam=true;sleep 1;[(_infos call INV_getitemClassName), 1, _crate] spawn INV_CreateMag;fvspam=false};
if (_itemart == "Fahrzeug") then {
player groupchat "creating...";closeDialog 0;fvspam=true;sleep 5;[_classname, _spawn, _item] spawn INV_CreateVehicle;fvspam=false};

player groupchat "item created!";

};

if(_type == "export")then
{

if (_itemart == "magazin")exitwith{player groupchat "you cannot export this item!"};
  if(fvspam)exitwith{};
  if(favail < 1)exitwith{player groupchat "There are no items/vehicles of this type available"};
 

  if (_itemart == "Fahrzeug") then {closedialog 0;[_item] execVM "choosecity.sqf";};
  if (_itemart == "waffe") then {closedialog 0;[_item] execVM "choosegunshop.sqf";};
  _itemType     = _infos call INV_getitemKindOf;
  if (_itemType == "service") then {closedialog 0;[_item] execVM "choosegasstation.sqf";};
  if (_itemType == "Shop") then {closedialog 0;[_item] execVM "chooseshop.sqf";};
  if (_itemType == "carobjects") then {closedialog 0;[_item] execVM "choosetuning.sqf";};
};