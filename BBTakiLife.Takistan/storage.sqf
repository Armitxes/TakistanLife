if (!(createDialog "itemkaufdialog")) exitWith {hint "Dialog Error!";};
if (isNil "INV_StorageDialoge") then {INV_StorageDialoge = 0;} else {INV_StorageDialoge = INV_StorageDialoge + 1;};
private ["_veh"];
_this     = _this select 3;
_arrname  = _this select 0;
_public   = _this select 1;
_arr      = call compile _arrname;
_extra    = [];
_vclStore = false;
_vclClass = "";

CtrlSetText [91,localize "STRS_inv_fabrik_dialogheader1"];
CtrlSetText [92,localize "STRS_inv_fabrik_dialogheader2"];
//sleep 0.1;
_weight   = _arrname call INV_GetStorageWeight;

if (count _this > 2) then

{

_extra = _this select 2;

if (count _extra > 0) then

	{

	if (_extra select 0 == "vcl") then

		{

		_vclStore = true;
		_vclClass = _extra select 1;
		_maxweight = _vclClass call INV_getvehmaxkg;
		CtrlSetText [765,format ["Storage: %1/%2", _weight, _maxweight]];

		};

	};

};

for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do

{

_item   = ((_arr select _i) select 0);
_anzahl = ((_arr select _i) select 1);
_infos  = _item call INV_getitemArray;

if (_anzahl > 0) then

	{

	_index  = lbAdd [1, (format ["%1 (%2x, %3kg)", (_infos call INV_getitemName), (_anzahl call ISSE_str_IntToStr), (_infos call INV_getitemTypeKg)])];
	lbSetData [1, _index, (format ["%1", _item])];

	};

};

for [{_i=0}, {_i < (count INV_InventarArray)}, {_i=_i+1}] do

{

_item   = ((INV_InventarArray select _i) select 0);
_anzahl = (_item call INV_GetItemAmount);
_infos  = _item call INV_getitemArray;

if ( (_anzahl > 0) and (_infos call INV_getitemDropable) ) then

	{

	_index = lbAdd [101, (format ["%1 (%2kg, %3x)", (_infos call INV_getitemName), (_infos call INV_getitemTypeKg), (_anzahl call ISSE_str_IntToStr)])];
	lbSetData [101, _index, (format ["%1", _item])];

	};

};

buttonSetAction [3,   format['if ((lbCurSel 1) >= 0) then {["nehmen",  "%1", ctrlText 2, (lbData [1, (lbCurSel 1)]),"%3", %2] execVM "addstorage.sqf"; closedialog 0; [0,0,0,["%1", "%3", %2]] execVM "storage.sqf";};', _arrname, _extra, _public] ];
buttonSetAction [103, format['if ((lbCurSel 101) >= 0) then {["ablegen", "%1", ctrlText 102, (lbData [101, (lbCurSel 101)]), "%3", %2] execVM "addstorage.sqf"; closedialog 0; [0,0,0,["%1", "%3", %2]] execVM "storage.sqf";};', _arrname, _extra, _public] ];

while {ctrlVisible 1015} DO

{

_cursel = (lbCurSel 1);

if (_cursel >= 0) then

	{

	_item   = lbData [1, (lbCurSel 1)];
        _anzahl = ((_arr select _cursel) select 1);
	_infos  = _item call INV_getitemArray;
	_slider = ctrlText 2;
	if (!(_slider call ISSE_str_isInteger)) then {_slider = 0;};
	_slider      = _slider call ISSE_str_StrToInt;
	if (_slider < 0) then {_slider = 0;};
	CtrlSettext [3,  format [localize "STRS_inv_storagedialog_take", (_slider call ISSE_str_IntToStr), ((_slider*(_infos call INV_getitemTypeKg)) call ISSE_str_IntToStr)]];

	}
	else
	{

	CtrlSettext [3,  "/"];};
	_cursel = (lbCurSel 101);

	if (_cursel >= 0) then

		{

		_item   = lbData [101, (lbCurSel 101)];
		_anzahl = _item call INV_GetItemAmount;
		_infos  = _item call INV_getitemArray;
		_slider = ctrlText 102;
                if (!(_slider call ISSE_str_isInteger)) then {_slider = "0";};
		_slider = _slider call ISSE_str_StrToInt;
		if (_slider < 0) then {_slider = 0;};
		CtrlSettext [103,  format [localize "STRS_inv_storagedialog_drop", (_slider call ISSE_str_IntToStr), ((_slider*(_infos call INV_getitemTypeKg)) call ISSE_str_IntToStr)]];

		}
		else
		{

		CtrlSettext [103,  "/"];

		};

	sleep 0.3;
	if (INV_StorageDialoge > 1) exitWith {};

};

INV_StorageDialoge = INV_StorageDialoge - 1;