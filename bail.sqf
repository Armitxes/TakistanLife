_bail    = _this select 0;

if (!(_bail call ISSE_str_isInteger)) exitWith {hintSilent localize "STRS_inv_no_valid_number"};

_bail    = _bail call ISSE_str_StrToInt;

if (_bail < 2000) exitWith {};

_copplayernumber = playersNumber west;

_copbail = round(_bail/_copplayernumber);

_dollarz    = 'dollarz' call INV_GetItemAmount;

if (_dollarz > _bail) exitwith
{
  ['dollarz', -(_bail)] call INV_AddInventoryItem;
  hintSilent format [localize "STRS_bail_self", (_bail call ISSE_str_IntToStr)];
  bountyToPay = bountyToPay - (_bail / 4);
  format ["if (iscop) then {[""dollarz"", %2] call INV_AddInventoryItem; hintSilent format [localize ""STRS_bail_addbail"", %2, ""%3""];}; titletext [format[localize ""STRS_bail_payed"",%3, %1], ""plain""];", (_bail call ISSE_str_IntToStr), (_copbail call ISSE_str_IntToStr), rolenumber, player] call toClients;
};


if ((PLAYERDATA select 1) > _bail) exitWith

{

[-_bail] call setMoney;
hintSilent format [localize "STRS_bail_self", (_bail call ISSE_str_IntToStr)];
bountyToPay = bountyToPay - (_bail / 4);
format ["if (iscop) then {[""dollarz"", %2] call INV_AddInventoryItem; hintSilent format [localize ""STRS_bail_addbail"", %2, ""%3""];}; titletext [format[localize ""STRS_bail_payed"",%3, %1], ""plain""];", (_bail call ISSE_str_IntToStr), (_copbail call ISSE_str_IntToStr), rolenumber, player] call toClients;

};

hintSilent localize "STRS_bail_cantpay";
