_art = _this select 0;

if (_art == "use") then
{
  _item = _this select 1;
  _anzahl = _this select 2;
  
  if (!(createDialog "schluessel")) exitWith { hint "Dialog Error!"; };
  {
    if (not(isnull _x)) then {
      _index = lbAdd [1, format ["%1 (%2)", typeOf _x, _x]];
      lbSetData [1, _index, format ["%1", _x]];
    };
  } forEach INV_VehicleArray;
  buttonSetAction [2, "if ((lbCurSel 1) > -1) then { [""schluessel"",  (INV_VehicleArray select lbCurSel 1), lbCurSel 1] execVM ""keys.sqf""; }; closedialog 0;"];
  buttonSetAction [4, "if ((lbCurSel 1) > -1) then { [""dropschluessel"", (INV_VehicleArray select lbCurSel 1), lbCurSel 1] execVM ""keys.sqf""; }; closedialog 0; "];
  buttonSetAction [5, "if ((lbCurSel 1) > -1) then { [""schluesseluebergabe"", (INV_VehicleArray select lbCurSel 1), lbCurSel 1] execVM ""keys.sqf""; }; closedialog 0;"];
};

if (_art == "schluessel") then
{
  _vcl = _this select 1;
  _sel = _this select 2;
  if (player distance _vcl < 13) then
  {
    if (!(locked _vcl)) then
    {
      _vcl lock true;
	  titleText ["Vehicle locked", "PLAIN DOWN", 0.4];
    } else {
      _vcl lock false;
      titleText ["Vehicle unlocked", "PLAIN DOWN", 0.4];
    };
  } else { hintSilent localize "STRS_inv_items_vehiclelock_closer"; };
};

if (_art == "dropschluessel") then
 {
  _vcl = _this select 1;
  _sel = _this select 2;
  INV_VehicleArray = INV_VehicleArray - [_vcl];
  hintSilent localize "STRS_inv_items_weggeworfen";
};

if (_art == "schluesseluebergabe") then
 {
 _vcl = _this select 1;
 _sel = _this select 2;
 _spielernum = call compile INV_InventarGiveReceiver;
_spieler = INV_PLAYERSTRINGLIST select _spielernum;
 _playerobject = INV_PLAYERLIST select _spielernum;
   if (!(_spieler call ISSE_UnitExists))  exitWith {
hintSilent localize "STRS_inv_not_ingame";
};

 if (_playerobject == player)   exitWith {
hintSilent localize "STRS_inv_inventar_uebergabe_self";
};

   if (player distance _playerobject > 20)  exitWith {
hintSilent localize "STRS_inv_inventar_uebergabe_distance";
};

    format ["if (INV_ROLESTRING == ""%1"") then
 {
INV_VehicleArray = INV_VehicleArray + [%2];
 hintSilent localize ""STRS_inv_items_uebergabe_schluessel_success""};

", _spieler, _vcl] call broadcast;
  hintSilent localize "STRS_inv_items_uebergabe_schluessel_success_self";
};

