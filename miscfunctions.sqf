reveal =

{

_objs = nearestobjects[getpos player, ["man", "allvehicles"], 300];

{_x reveal _this;_x dotarget _this;} foreach _objs;

};

bash =

{

_damage = damage player;

[player, 10, 0] call setPitchBank;
sleep 0.01;
[player, -5, 0] call setPitchBank;

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [10];
"dynamicBlur" ppEffectCommit 0;
waitUntil {ppEffectCommitted "dynamicBlur"};
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit (0.4 + _damage);
waitUntil {ppEffectCommitted "dynamicBlur"};

};

isprone =

{

if(
animationstate player == "amovppnemrunsnonwnondf" or
animationstate player == "amovppnemstpsnonwnondnon" or
animationstate player == "amovppnemstpsraswrfldnon" or
animationstate player == "amovppnemsprslowwrfldf"
) then {true}else{false};

};

targethit =

{

private "_c";
_tg = _this select 0;
_t  = _this select 1;

waituntil {_tg animationphase "terc" == 0};

for [{_c=0}, {_c < _t}, {_c=_c+0.5}] do

	{

	if(_tg animationphase "terc" > 0)exitwith{_c=10; hits = hits + 1};
	sleep 0.5;

	};

if(_tg animationphase "terc" > 0 and _c < 10)exitwith{popped = popped + 1; hits = hits + 1};
_tg animate["terc",1];
popped = popped + 1;

};

TeleToMainbaseFunc = {
if (not((vehicle player) == player)) then
 {
player Action ["eject", vehicle player];
};

   if (iscop) then
 {
    player setpos (getmarkerpos "respawn_west");
 } else {
   player setpos (getmarkerpos "hospitaltent");
 };

 hintSilent localize "STRS_verbotene_zone_teleport";
};

DialogSpielerListe = 
{
  private ["_Fart", "_Fid", "_Fname", "_Fingame", "_Findex", "_Flistlen", "_Feigenenum"];
  _Fart = _this select 0;
  _Fid = _this select 1;
  _Fname = _this select 2;
  _Fingame = _this select 3;
  _Findex = 0;
  _Flistlen = 0;
  _Feigenenum = -1;
  
  for [{_c=0}, {_c < (count playerstringarray)}, {_c=_c+1}] do 
  {
    _Fspieler = playerstringarray select _c;
    if ( ((_Fart == 0) or ((_Fart == 1) and (_c > civscount)) or ((_Fart == 2) and (_c < civscount))) and ((_Fingame) or (_Fspieler call ISSE_UnitExists)) ) then
    {
      if (_Fname) then
      { _Findex = lbAdd [_Fid, format ["%1 - (%2)", _Fspieler, name (call compile _Fspieler)]]; } 
      else { _Findex = lbAdd [_Fid, _Fspieler]; };
      lbSetData [_Fid, _Findex, format["%1", _c]];
      if (_Fspieler == rolestring) then
      { _Feigenenum = _Flistlen; };
    
      _Flistlen = _Flistlen + 1;
    };
  };
  
  [_Flistlen, _Feigenenum]
};

GangList = 
{
	private ["_i","_Fid"];
    _Fid = _this select 0;

for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do {
	    _gangarray = gangsarray select _i;
	    _index = lbAdd [_Fid, format ["%1", (_gangarray select 0)]];
	    lbSetData [_Fid, _index, format ["%1",(_gangarray select 0)]];
	 
	};
};

fnc_getWarrant = {
private ["_idCiv","_i"];
_idCiv = _this select 0 ;
_warrant = [];
for [{_i=0}, {_i < (count warrantarray)}, {_i=_i+1}] do
  {
    _singleWarrant = warrantarray select _i;
    _pIdCiv  = _singleWarrant select 0;
	

if(_idCiv == _pIdCiv) then {
	_warrant = [_singlewarrant,_i];

	};
   };
 
 _warrant; 
 };
 
 fnc_removeWarrant = {
 private ["_pos"];
 _pos = _this select 0;
 
 warrantarray set [_pos,-1]; 
 warrantarray = warrantarray - [-1];
 };

Isse_AddCrimeLogEntry = {
private ["_logtime", "_logdate", "_logtext", "_logart", "_logplayer", "_zusatzinfo"];
  _logart = _this select 0;
   _logplayer = format["%1", _this select 1];
  _zusatzinfo = "";
 if (count _this > 2) then
 {
_zusatzinfo = _this select 2};

    _logtime = time;
 _logdate = date;
    _logtext = "";
 switch (_logart) do {
  case "Bank": {
_logtext = format[localize "STRS_functions_crimelog_msg1", _zusatzinfo];
};

   case "Stole": {
_logtext = format[localize "STRS_functions_crimelog_msg2"];
};

  case "KilledCiv": {
_logtext = format[localize "STRS_functions_crimelog_msg3", _zusatzinfo];
};

    case "KilledCop": {
_logtext = format[localize "STRS_functions_crimelog_msg4", _zusatzinfo];
};

  case "KilledWorker": {
_logtext = format[localize "STRS_functions_crimelog_msg13", _zusatzinfo];
};

  case "PrisonIn": {
_logtext = format[localize "STRS_functions_crimelog_msg5"];
};

    case "PrisonOut": {
_logtext = format[localize "STRS_functions_crimelog_msg6"];
};

case "PrisonEsc": {
_logtext = format[localize "STRS_functions_crimelog_msg7"];
};

    case "Died": {
_logtext = format[localize "STRS_functions_crimelog_msg8"];
};

    case "Ticket": {
_logtext = format[localize "STRS_functions_crimelog_msg9", _zusatzinfo];
};

 case "Bomb": {
_logtext = format[localize "STRS_functions_crimelog_msg10"];
};

case "slave": {
_logtext = format[localize "STRS_functions_crimelog_msg11"];
};

 case "Speed": {
_logtext = format[localize "STRS_functions_crimelog_msg12"];
};

case "StoleVcl": {
_logtext = format[localize "STRS_functions_crimelog_msg13", _zusatzinfo];
};

case "AttemptedStoleVcl": {
_logtext = format[localize "STRS_functions_crimelog_msg14", _zusatzinfo];
};

case "Assassin": {
_logtext = format[localize "STRS_functions_crimelog_msg15"];
};

};

  CopLog = CopLog + [ [_logplayer, _logtext, _logdate, _logtime] ];
};

Bomb_Vehicle = {
  if (count _this > 1) then
 {
 if (not(isNull (_this select 1))) then
 {
  _obj = _this select 1;
    if (((getPos _obj) select 2) > 5) then
 {
_obj setDamage 1;
   } else {
 "Bo_GBU12_LGB" createVehicle (_this select 0);
  _obj setDamage 1;
};

   };

    } else {
 "Bo_GBU12_LGB" createVehicle (_this select 0);
    };

  if (count _this > 2) then
 {
 format ["if ((random 100) < 10) then
 {
hint format[localize ""STRS_vehiclebomb_public_explode"", %1];
};

", player, longrolenumber] call broadcast;
 };

};

GetRandomObjectName = {
 private ["_name"];
   if (isNil("GespawnteObjekteCounter")) then
 {
GespawnteObjekteCounter = 0;
};

_name = format["SpawnedObject_%1_%2_%3", round(time), rolenumber, GespawnteObjekteCounter];
GespawnteObjekteCounter = GespawnteObjekteCounter + 1;
_name};

CreateObjectClient = {
 private ["_classname", "_position", "_dir", "_obj", "_extraInit", "_objname"];
 _classname = _this select 0;
   _pos = _this select 1;
   _dir = _this select 2;
 _extraInit = _this select 3;
  _objname = (call GetRandomObjectName);
_obj = dummyobj;
 call compile format['   %4 = "%1" CreateVehicle %2;
 %4 setVehicleInit ''this setVehicleVarName "%4";
 %4 = this;
 this setDir %3;
 call compile ''''%5'''';
'';
  ', _classname, _pos, round(_dir), _objname, _extraInit];
    processInitCommands;
   _objname};

SayDirectSpeach = {
 private ["_text", "_dis"];
   _text = _this select 0;
    _art = _this select 1;
    if (not ((_text == "") or (_text == " ")) ) then
 {
    _text = format["%1 shouts: %2", player, _text];
  if (_art == "direct") then
 {
_dis = 50;
    format ["if ((player distance %1) < %3) then
 {
titleText[""%2"", ""PLAIN""];
};

", player, _text, _dis] call toClients;
 };

};

};