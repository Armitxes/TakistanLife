private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

if(isstunned || (([player] call plr_isUnConscious) && _key != 50)) exitWith
{
	if(_key == 50)then{_handled = true};
	if(_key == 11)then{_handled = true};
	_handled
};

switch _key do
{
  case 1: {
    ["save"] execVM "armitxes\_db.sqf";
  };
  // W key
  case 17: {
    _vcl = vehicle player;
    if((_vcl == player) || ((speed _vcl) >= 140))exitwith{};
    _lvl = 1;
    if(ismedic) then { _lvl = 1.01; } else { _lvl = _vcl getvariable "tuning"; };
    if(isEngineOn _vcl and !isnil "_lvl") then {
  		_vel = velocity _vcl;
    	_vcl setVelocity [(_vel select 0) * _lvl, (_vel select 1) * _lvl, (_vel select 2) * _lvl]
		};  
  };
};

_handled;