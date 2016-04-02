_this = _this select 3;
_art  = _this select 0;
_dollarz = 'dollarz' call INV_GetItemAmount;

if (_art == "ClientWahlc") then
{
  if (isNil("WahlChief")) then {WahlChief = false;};
  
  if (WahlChief) exitWith {hintSilent "You just voted.";};
  _spielernum = call compile (_this select 1);
  _waehlernum = (rolenumber-1);
  _WahlArrayc = server getVariable "CCVote";
  
  for [{_i=0}, {_i < count(_WahlArrayc)}, {_i=_i+1}] do
  {
    _arr = (_WahlArrayc select _i);
    if (_waehlernum in _arr) exitWith {_arr = _arr - [_waehlernum];	_WahlArrayc SET [_i, _arr];};
  };
  
  _WahlArrayc SET [_spielernum, ((_WahlArrayc select _spielernum)+ [_waehlernum])];
  
  server setVariable ["CCVote",_WahlArrayc,true];
  hintSilent format[localize "STRS_chief_votedfor", (playerstringarray select _spielernum)];
  WahlChief = true;
  sleep 15;
  WahlChief = false;
};