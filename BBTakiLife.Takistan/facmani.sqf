if (!(createDialog "factory_manifacture")) exitWith {hint "Dialog Error!";};

_facNum     = ((_this select 3) select 0);
_facArray   = INV_ItemFabriken select _facNum;
_facItems   = _facArray select 5;
_facStorage = _facArray select 7;
_queue 	    = _facArray select 8;
_workers    = call compile format['%1workers', _queue];
_index = lbAdd [1, localize "STRS_inv_fac_dia_herstellen"];
lbSetData [1, _index, ""];

{

_eta = round((_x call INV_getitemBuyCost)*.0150);
if(_eta > maxmanitime)then{_eta = maxmanitime};
if(_workers > 0)then{_eta = round(_eta/(_workers/5))};
if(_eta > maxmanitime)then{_eta = maxmanitime};

_index = lbAdd [1, format["%1 ($%2, %3 mins)", (_x call INV_getitemName), (_x call INV_getitemBuyCost)*0.5, round(_eta/60)]];
lbSetData [1, _index, _x];

} forEach _facItems;

buttonSetAction [3, format["if ((lbCurSel 1) >= 0) then {[(lbData [1, (lbCurSel 1)]), %1, ""mani""] execVM ""createfacitem.sqf"";};", _facNum] ];
buttonSetAction [4, format["if ((lbCurSel 1) >= 0) then {[(lbData [1, (lbCurSel 1)]), %1, ""create""] execVM ""createfacitem.sqf"";};", _facNum] ];
buttonSetAction [5, format["if ((lbCurSel 1) >= 0) then {[(lbData [1, (lbCurSel 1)]), %1, ""export""] execVM ""createfacitem.sqf"";};", _facNum] ];
buttonSetAction [1337, format["if ((lbCurSel 1) >= 0) then {[(lbData [1, (lbCurSel 1)]), %1, ""cancel""] execVM ""createfacitem.sqf"";};", _facNum] ];

while {ctrlVisible 1030 or ctrlVisible 5} do

{

_item     = lbData [1, (lbCurSel 1)];
_selected = (lbCurSel 1);
lbClear 2;

if (_item != "") then

	{

	call compile format["favail = %1avail; fprod = %1prod; feta = %1eta; fpend = %1pend;", _item];
	if(favail < 1)then{ctrlEnable [4, false];ctrlEnable [5, false]}else{ctrlEnable [4, true];ctrlEnable [5, true]};
	lbAdd [2, format["Available: %1", favail]];
	lbAdd [2, format["Pending: %1", fpend]];
	lbAdd [2, format["In production: %1", fprod]];
	lbAdd [2, format["ETA: %1 seconds", round feta]];

	};

sleep 0.2;

};