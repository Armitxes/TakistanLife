_art = _this select 0;

if (_art == "use") then

{

_item   = _this select 1;
_anzahl = _this select 2;

if (!(createDialog "handydialog")) exitWith {hint "Dialog Error!";};
[2, true, false] call INV_DialogPlayers;
lbSetCurSel [99, 0];
ctrlSetText [4, format[localize "STRD_description_handy_cost", INV_smscost]];
buttonSetAction [3, "[""handy2"", ctrlText 1, call compile lbData [2, lbCurSel 2]] execVM ""handy.sqf""; closedialog 0;"];

};

if (_art == "handy2") then {
  _smstext         = _this select 1;
  _smsplayernumber = _this select 2;
  _smsplayer       = INV_PLAYERLIST select _smsplayernumber;
  
  if (_smstext == "") exitWith {hintSilent localize "STRS_inv_item_handy_leermsg";};
  if (not((format["%1", (_smsplayer)]) call ISSE_UnitExists)) exitWith {hintSilent localize "STRS_inv_item_handy_noplayer";};
  if (_dollarz < INV_smscost)  exitWith {hintSilent localize "STRS_inv_item_handy_keindollarz";};
  if ((_smstext call ISSE_str_Length) > 60)     exitWith {hintSilent localize "STRS_inv_item_handy_text_zu_lang";};
  ['dollarz', -(INV_smscost)] call INV_AddInventoryItem;
  hintSilent format [localize "STRS_inv_item_handy_gesendet", _smsplayer];
  
  format ['_mobile = ("handy" call INV_GetItemAmount);
  if ((%2 == player) and (_mobile > 0)) then {titletext [format [localize "STRS_inv_item_handy_nachricht", "%1", name %3], "plain"];};
  ', _smstext, _smsplayer, player] call broadcast;
};
