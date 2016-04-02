plr_heal = {
  _plr = _this select 0;
  
  if((player distance _plr < 4) || player == _plr) then {
    if(!alive _plr || !(_plr_isWounded)) exitWith { hint "There's nothing that I could do.."; };
    isheal = true;
	player playMove "AinvPknlMstpSnonWrflDnon_medic";
    ["Treating wounds..."] call msg_pd; sleep ((damage _plr)*15+7);
    (format["if (player == %1) then {dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;};",_plr]) call toClients;
    _plr setDamage 0;
    ["Treatment successful!"] call msg_pd;
	isheal = false;
    player playMove "AinvPknlMstpSnonWrflDnon_medicEnd";
    [_this select 1] call execString;  
  };
};

plr_isWounded = {
  _plr = _this select 0;
  if(
    (damage _plr) > 0 ||
    (handShit _plr) > 0 || 
    !(canStand _plr) || 
    !(canMove _plr)
  ) 
  then { true } else { false };
};

plr_isUnConscious = {
  _plr = _this select 0;
  if
  (
    (alive _plr) &&
    (animationstate _plr == "AdthPercMstpSlowWrf_beating") &&
    (_plr isKindOf "Man")
  ) then { true } else { false };
};