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
  //_targetString  = INV_PLAYERLIST select _transfer;
  _targetString  = call compile (INV_PLAYERSTRINGLIST select _transfer);

  // if (INV_PLAYERLIST select _transfer == player) exitWith
  if (_targetString == player) exitWith {
    if (_dollarz < _transfermoney) then {
      hintSilent format[localize "STRS_bank_deposit_self_no", (_transfermoney call ISSE_str_IntToStr)];
		} else {
		  hint "You are unable to deposit your own money! You are only able to transfer money via the phone!";
		};
	};

  if (not((INV_PLAYERSTRINGLIST select _transfer) call ISSE_UnitExists)) exitWith {hintSilent localize "STRS_bank_player_not_ingame";};

  if ((PLAYERDATA select 1) < _steuern) then {
    hintSilent format[localize "STRS_bank_no_money", (_transfermoney call ISSE_str_IntToStr), (bank_steuer call ISSE_str_IntToStr)];
	} else {
    [-_steuern] call setMoney;
    INV_SteuernGezahlt = (INV_SteuernGezahlt + (_steuern - _transfermoney));
    (format ["if (INV_ROLESTRING == ""%1"") then {[%2] call setMoney; hintSilent format[localize ""STRS_bank_account_getmoney"", %2, %3];};", _targetString, (_transfermoney call ISSE_str_IntToStr), player]) call toClients;
	};
};

if (_art == "withdraw") then {
  if (atmscriptrunning == 1) exitwith {hintSilent "script already running"};
  atmscriptrunning = 1;
  _withdraw = _this select 0;
  if (!(_withdraw call ISSE_str_isInteger)) exitWith {hintSilent localize "STRS_bank_no_valid_number";};
  _withdraw = _withdraw call ISSE_str_StrToInt;
  if (_withdraw <= 0) exitWith {};

  if ((PLAYERDATA select 1) >= _withdraw) then
	{
	hint "You are unable to withdraw money from your phone! Go to a local ATM!"
	};
};

sleep 2;
atmscriptrunning = 0;