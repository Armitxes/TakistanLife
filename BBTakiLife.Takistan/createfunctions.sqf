INV_DialogPlayers =
{

  private ["_c", "_Fid", "_Fname", "_Fingame", "_Findex", "_Flistlen", "_Feigenenum"];
  _Fid        = _this select 0;
  _Fname      = _this select 1;
  _Fingame    = _this select 2;
  _Findex     = 0;
  _Flistlen   = 0;
  _Feigenenum = -1;

  for [{_c=0}, {_c < (count INV_PLAYERSTRINGLIST)}, {_c=_c+1}] do {
    
    _Fspieler = INV_PLAYERSTRINGLIST select _c;
    if ( ((_Fingame) or (_Fspieler call ISSE_UnitExists)) ) then {

		if (_Fname) then

			{

			_Findex = lbAdd [_Fid, format ["%1 - (%2)", _Fspieler, name (call compile _Fspieler)]];

			}
			else
			{

			_Findex = lbAdd [_Fid, _Fspieler];

			};

			lbSetData [_Fid, _Findex, format["%1", _c]];
			if (_Fspieler == INV_ROLESTRING) then {_Feigenenum = _Flistlen;};
			_Flistlen = _Flistlen + 1;

		};

	};

[_Flistlen, _Feigenenum]

};

INV_CreateVehicle =
{
  private ["_classname","_itemname","_position","_dir"];
  _classname = _this select 0;
  _logic	   = _this select 1;
  _itemname	   = _this select 2;
  

  call compile format ['

newvehicle = _classname createVehicle %4;
if !(isplayer _logic) then
{
	newvehicle setpos %4;
};
newvehicle setdir %5;
newvehicle setVariable ["owner",getPlayerUID player,true];
newvehicle setVehicleInit "
this setVehicleVarName ""vehicle_%1_%2"";
vehicle_%1_%2 = this;
clearWeaponCargo this;
clearMagazineCargo this;
newvehicle lock true;  
";
processInitCommands;      
INV_VehicleArray = INV_VehicleArray + [vehicle_%1_%2];
"INV_ServerVclArray = INV_ServerVclArray + [vehicle_%1_%2];if (""%3"" != """") then {[""CreatedVehicle"", vehicle_%1_%2, typeOf vehicle_%1_%2, %4] execVM ""%3"";};" call broadcast;
', player, round(time), INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];

hintsilent format ["%1",_itemname];

// Attack helicopter re-armament
if (_classname == "AW159_Lynx_BAF") then {
  //newvehicle removeWeapon "laserdesignator_mounted";
  newvehicle removeMagazinesTurret ["1200Rnd_20mm_M621",[-1]];
  newvehicle removeMagazinesTurret ["12Rnd_CRV7",[-1]];
};
if (_classname == "Ka60_PMC") then {
	hint "Reconfiguring helicopter armament...";
	newvehicle removeweapon "57mmLauncher";
	newvehicle removeweapon "FFARLauncher_14";
	newvehicle removeweapon "VikhrLauncher";
	newvehicle removeweapon "80mmLauncher";
	newvehicle removeweapon "2A42";
};
if (_classname == "AH6J_EP1") then {

	hint "Reconfiguring helicopter armament...";
	newvehicle removeweapon "FFARLauncher_14";
	newvehicle addweapon "CMFlareLauncher";
	newvehicle addmagazine "60Rnd_CMFlareMagazine";
};
if (_classname == "UH1Y") then {
	hint "Reconfiguring helicopter armament...";
	newvehicle removeweapon "FFARLauncher_14";	
};
if (_classname == "An2_TK_EP1") then {
  newvehicle addWeapon "M230";
  newvehicle addMagazine "1200Rnd_30x113mm_M789_HEDP";
  newvehicle addMagazine "1200Rnd_30x113mm_M789_HEDP";
  newvehicle addMagazine "1200Rnd_30x113mm_M789_HEDP";
};
if (_itemname == "AH6X_EP1_COP") then {
newvehicle setVehicleInit 'this setObjectTexture [0, "images\PoliceHeli.paa"]'; processInitCommands;};
if (_classname == "SUV_TK_CIV_EP1") then {
	if (_itemname == "SUV_TK_CIV_EP1_COP") then {
newvehicle setVehicleInit 'this setObjectTexture [0, "images\copsuv.paa"]'; processInitCommands; };
	if (_itemname == "SUV_TK_CIV_EP1_SCO") then {
newvehicle setVehicleInit 'this setObjectTexture [0, "images\scosuv.paa"]'; processInitCommands; };};
if (_itemname == "SUV_RED") then {
	newvehicle setVehicleInit 'this setObjectTexture [0, "images\RedSuv.paa"]'; processInitCommands; };
if (_itemname == "SUV_BLUE") then {
	newvehicle setVehicleInit 'this setObjectTexture [0, "images\BlueSuv.paa"]'; processInitCommands; };
if (_itemname == "SUV_WHITE") then {
	newvehicle setVehicleInit 'this setObjectTexture [0, "images\WhiteSuv.paa"]'; processInitCommands; };
	
if (_classname == "SUV_UN_EP1") then { newvehicle setVehicleInit 'this setObjectTexture [0, "images\unsuv.paa"]'; processInitCommands; };
if (_classname == "VolhaLimo_TK_CIV_EP1") then { newvehicle setVehicleInit 'this setObjectTexture [0, "images\copvolha.paa"]'; processInitCommands; };
if (_classname == "ArmoredSUV_PMC") then
{
	newvehicle setVehicleInit '
this animate["HideGun_01",1]; 
this animate["HideGun_02",1];
this animate["HideGun_03",1];
this animate["HideGun_04",1]; 
this animate["CloseCover1",1]; 
this animate["CloseCover2",1];';processInitcommands;
newvehicle removeweapon "M134";
};
};

INV_CreateWeapon = {
  private["_class", "_menge", "_crate"];
  _class = _this select 0;
  _menge = _this select 1;
  _crate = _this select 2;
  _crate setDamage 0;
  
  _crate setvehicleinit format["
  this addweaponCargo [""%1"",%2];
  ", _class, _menge];
  processInitCommands;
};

INV_CreateMag =

{

private["_class", "_menge", "_crate"];
_class = _this select 0;
_menge = _this select 1;
_crate = _this select 2;
_crate setDamage 0;

_crate setvehicleinit format["
this addmagazineCargo [""%1"",%2];
", _class, _menge];
processInitCommands;

};

INV_CreateBackpack =

{

private["_class", "_menge", "_crate"];
_class = _this select 0;
_menge = _this select 1;
_crate = _this select 2;
_crate setDamage 0;

_crate setvehicleinit format["
this addbackpackCargo [""%1"",%2];
", _class, _menge];
processInitCommands;

};

INV_CreateItem =

{

private["_class", "_menge", "_stor"];
_class = _this select 0;
_menge = _this select 1;
_stor  = _this select 2;
[_class, _menge, _stor] call INV_AddItemStorage;

};
