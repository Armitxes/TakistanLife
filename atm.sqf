if (!(createDialog "bank")) exitWith {hint "Dialog Error!";};
_liste = [1, true, false] call INV_DialogPlayers;
if ((_liste select 1) >= 0) then {lbSetCurSel [1, (_liste select 1)];};
_dollarz = 'dollarz' call INV_GetItemAmount;
CtrlSetText [101, format [localize "STRS_bank_dialog_inventardollarz", (_dollarz call ISSE_str_IntToStr)]];
CtrlSetText [102, format [localize "STRS_bank_dialoge_accountdollarz",  ((PLAYERDATA select 1) call ISSE_str_IntToStr)]];
buttonSetAction [10, format["[call compile lbData [1, lbCurSel 1], ctrlText 2, ""deposit""]  execVM ""transact.sqf""; closedialog 0;"] ];
buttonSetAction [11, format["[ctrlText 6,                          0,          ""withdraw""] execVM ""transact.sqf""; closedialog 0;"] ];

while {ctrlVisible 1003} do

{

_dollarz   = 'dollarz' call INV_GetItemAmount;
_slider = ctrlText 2;
if (!(_slider call ISSE_str_isInteger)) then {_slider = 0;};
_slider = _slider call ISSE_str_StrToInt;
if (_slider < 0) then {_slider = 0;};

if (lbCurSel 1 == (_liste select 1)) then

	{

	CtrlSetText [4,""];
	CtrlSetText [5,""];

	}
	else
	{

	CtrlSetText [4, localize "STRS_bank_dialoge_tax"];
	CtrlSetText [5, format ["$%1", ((round((_slider*100)/(100-bank_steuer))) call ISSE_str_IntToStr)]];

	};

sleep 0.3;

};

