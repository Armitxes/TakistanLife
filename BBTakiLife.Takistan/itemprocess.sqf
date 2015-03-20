if(!isciv)exitWith{player groupchat "only civilians can do this!"};
if (processactivescript == 1) exitwith {player groupchat "script already active"};
processactivescript = 1;

_this 	 = _this select 3;
_item1	 = _this select 0;
_item2	 = _this select 1;
_req	 = _this select 2;
_license = _this select 3;
_nitem1  = _item1 call INV_GetItemAmount;
_multi = floor(_nitem1/_req);
_total = _req*_multi;
if (_nitem1 < _req) then {player groupchat "you do not have enough resources to process!"}
	else {
[_item1, -(_total)] call INV_AddInventoryItem;
[_item2, _multi, "INV_InventarArray"] call INV_CreateItem;

_name1   = _item1 call INV_getitemName;
_name2   = _item2 call INV_getitemName;

player groupchat format["%1 %2 was processed into %3 %4!", _total, _name1, _multi, _name2];};
sleep 3;
processactivescript = 0;
