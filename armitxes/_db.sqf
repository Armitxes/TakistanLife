_art = (_this select 0);

if (_art == "load") exitWith { submitLoad = player; publicVariableServer "submitLoad"; };
if (_art == "save") exitWith {
  if(lastArray == str(PLAYERDATA)) exitWith { };
  _lics = [];
  {
    _id = (_x call INV_getItemID);
    if ((_id > -1) && !(_id in _lics)) then { _lics = _lics + [_id]; };
  } forEach INV_LizenzOwner;

  submitSave = format [
    '%1,%2,%3,%4,%5,%6',
    (PLAYERDATA select 0),
    (PLAYERDATA select 1),
    _lics,
    (PLAYERDATA select 7),
    (PLAYERDATA select 8),
    (PLAYERDATA select 10)
  ];
  publicVariableServer "submitSave";
  lastArray = str(PLAYERDATA);
};
