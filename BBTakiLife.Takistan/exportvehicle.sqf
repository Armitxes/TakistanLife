if(fvspam)exitwith{};
_preis      = _this select 0;
_item       = _this select 1;
_stock      = _this select 2;
_maxstock   = _this select 3;
_shopnum    = _this select 4;

fvspam=true;

if(_stock >= _maxstock)exitwith{hintSilent "the shop has reached its maximum stock for this vehicle";sleep 0.1;fvspam=false;};

call compile format['favail = %1avail; %1avail = %1avail - 1;', _item];
['dollarz', _preis] call INV_AddInventoryItem;
hintSilent format["The vehicle has been exported for $%1!", _preis];
format['["%1", (%2 + 1), %3] call INV_itemstocksupdate;', _item, _stock, _shopnum] call broadcast;
closedialog 0;
sleep 0.1;
fvspam=false;