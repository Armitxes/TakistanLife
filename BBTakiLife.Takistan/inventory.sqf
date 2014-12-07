if (!(createDialog "inventar")) exitWith {hint "Dialog Error!";};

_itemcounter = 0;

for [{_i=0}, {_i < (count INV_InventarArray)}, {_i=_i+1}] do

{

_item   = ((INV_InventarArray select _i) select 0);
_anzahl = (_item call INV_GetItemAmount);

if (_anzahl > 0) then

	{

	_index = lbAdd [1, format ["%1", (_item call INV_getitemName)]];
	lbSetData [1, _index, _item];
	_itemcounter = _itemcounter + 1;
	};

};

if (_itemcounter == 0) exitWith {player groupChat localize "STRS_inv_inventardialog_empty";};

for [{_c=0}, {_c < (count INV_PLAYERSTRINGLIST)}, {_c=_c+1}] do

{

_spieler = INV_PLAYERSTRINGLIST select _c;

if (_spieler call ISSE_UnitExists) then

	{

	_index = lbAdd [99, format ["%1 - (%2)", _spieler, name (call compile _spieler)]];
	lbSetData [99, _index, format["%1", _c]];

	};

};

lbSetCurSel [99, 0];
lbSetCurSel [1, 0];
buttonSetAction [3,format["[""use"",  lbData [1, (lbCurSel 1)], ctrlText 501, lbData [99, (lbCurSel 99)]] execVM ""INVactions.sqf""; closedialog 0;"] ];
buttonSetAction [4,format["[""drop"", lbData [1, (lbCurSel 1)], ctrlText 501, lbData [99, (lbCurSel 99)]] execVM ""INVactions.sqf""; closedialog 0;"] ];
buttonSetAction [246,format["[""give"", lbData [1, (lbCurSel 1)], ctrlText 501, lbData [99, (lbCurSel 99)]] execVM ""INVactions.sqf""; closedialog 0;"] ];

while {ctrlVisible 1001} do

{

_item   = lbData [1, (lbCurSel 1)];
_anzahl = _item  call INV_GetItemAmount;
_array  = _item call INV_getitemArray;

ctrlSetText [62,  format ["%1", (_anzahl call ISSE_str_IntToStr)]];
ctrlSetText [52,  format ["%1", _array call INV_getitemName]];
ctrlSetText [72,  format ["%1", _array call INV_getitemDescription1]];
ctrlSetText [7,   format ["%1", _array call INV_getitemDescription2]];
ctrlSetText [202, format ["%1/%2", (_array call INV_getitemTypeKg), (((_array call INV_getitemTypeKg)*(_anzahl)) call ISSE_str_IntToStr)]];

sleep 0.1;

};
