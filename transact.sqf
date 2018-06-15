_art  = _this select 2;
_dollarz = 'dollarz' call INV_GetItemAmount;

if (_art == "deposit") then {
  if (atmscriptrunning == 1) exitwith {hintSilent "script already running"};
  atmscriptrunning = 1;
  _transfer      = _this select 0;
  _transfermoney = _this select 1;
  if (!(_transfermoney call ISSE_str_isInteger)) exitWith {hintSilent localize "STRS_bank_no_valid_number";};
  _transfermoney = _transfermoney call ISSE_str_StrToInt;
  if (_transfermoney <= 0) exitWith {};
  _steuern       = round((_transfermoney*100)/(100-bank_steuer));
  _targetString  = call compile (INV_PLAYERSTRINGLIST select _transfer);

  if (_targetString == player) exitWith {
    if (_dollarz < _transfermoney) then {
			["add","finances","You cannot transfer that much money!",true] execVM "armitxes\logs.sqf";
		} else {
			["add","finances",format ["$%1 transferred to your own account", (_transfermoney call ISSE_str_IntToStr)],false] execVM "armitxes\logs.sqf";
			[_transfermoney] call setMoney;
			['dollarz', -(_transfermoney)] call INV_AddInventoryItem;
		};
	};

  if (not((INV_PLAYERSTRINGLIST select _transfer) call ISSE_UnitExists)) exitWith {hintSilent localize "STRS_bank_player_not_ingame";};

	if ((PLAYERDATA select 1) < _steuern) then {
		["add","finances","You don't have enough money on your account",true] execVM "armitxes\logs.sqf";
	} else {
		[-_steuern] call setMoney;
		INV_SteuernGezahlt = (INV_SteuernGezahlt + (_steuern - _transfermoney));
		(format ["if (INV_ROLESTRING == ""%1"") then {[%2] call setMoney; hintSilent format[localize ""STRS_bank_account_getmoney"", %2, %3];};", _targetString, (_transfermoney call ISSE_str_IntToStr), player]) call toClients;
		hintSilent format[localize "STRS_bank_deposit_yes", (_transfermoney call ISSE_str_IntToStr), (bank_steuer call ISSE_str_IntToStr), (_steuern call ISSE_str_IntToStr)];
	};
};

if (_art == "withdraw") then {
	if (atmscriptrunning == 1) exitwith {hintSilent "script already running"};
	atmscriptrunning = 1;
	_withdraw = _this select 0;
	if (!(_withdraw call ISSE_str_isInteger)) exitWith {hintSilent localize "STRS_bank_no_valid_number";};
	_withdraw = _withdraw call ISSE_str_StrToInt;
	if (_withdraw <= 0) exitWith {};

	if ((PLAYERDATA select 1) >= _withdraw) then {
		[-_withdraw] call setMoney;
		['dollarz', (_withdraw)] call INV_AddInventoryItem;
		["add","finances",format ["%1 withdrawn from your account", (_withdraw call ISSE_str_IntToStr)],false] execVM "armitxes\logs.sqf";
	} else {["add","finances","You don't have enough money on your account",true] execVM "armitxes\logs.sqf";};
};

sleep 2;
atmscriptrunning = 0;
