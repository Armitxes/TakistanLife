_doAction = _this select 0;
_idCiv = _this select 1;
_reason = _this select 2;
_bounty = _this select 3;
_exists = false;

if(0 < (count warrantarray)) then
{
  for [{_i=0}, {_i <= (count warrantarray)}, {_i=_i+1}] do
  {
    _singleWarrant = warrantarray select _i;
    _pIdCiv  = _singleWarrant select 0;
    _pReason = _singleWarrant select 1;
    _pBounty = _singleWarrant select 2;

    if((isNil "_pIdCiv") || (isNil "_pReason")) then
    {
      warrantarray set [_i,-1];
      warrantarray = warrantarray - [-1];
    };

    if(_idCiv == _pIdCiv) exitWith
    {
      _exists = true;
      if(!(_doAction == "deleteWarrant") && ((_pBounty + _bounty) >= 18000)) exitWith
      {
        warrantarray set [_i, [_idCiv, _pReason, 18000]];
        PLAYERDATA set [7,18000];
        _exists = true;
      };

      if(_doAction == "addWarrant") exitWith
      {
        warrantarray set [_i, [_idCiv, (_reason + ", " + _pReason), (_pBounty + _bounty)]];
        PLAYERDATA set [7,(_pBounty + _bounty)];
      };

      if(_doAction == "deleteWarrant") exitWith
      {
        _exists = true;
        bountyToPay = 0;
        warrantarray set [_i,-1];
        warrantarray = warrantarray - [-1];
        PLAYERDATA set [7,0];
      };
    };
  };
};

if(!(_exists) && (_doAction != "deleteWarrant")) then {
  newWarrant = [_idCiv, _reason, _bounty];
  warrantarray = warrantarray + [newWarrant];
};

publicVariable "warrantarray";
