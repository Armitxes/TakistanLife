veh_repair = {
  _veh = _this select 0;
  if(player != vehicle player) exitWith { hint "Leave the vehicle to repair it!"; }; 
  if(player distance _veh < 5) then {   
    _dam = damage _veh;
    if(_dam >= 1) exitWith { hint "This vehicle needs no repair or can't be repaired anymore"; };
    _veh lock true; player playMove "AinvPknlMstpSnonWrflDnon_medic";
    ["Repairing vehicle..."] call msg_pd; sleep (_dam * 15 + 7);
    if(player != vehicle player) exitWith { hint "You canceled the car repair"; };
    _veh setDamage 0; ["Vehicle repaired"] call msg_pd;
    player playMove "AinvPknlMstpSnonWrflDnon_medicEnd";
    [_this select 1] call execString;
  };
};

veh_refuel = {
  _veh = _this select 0;                                  
  if(player != vehicle player) exitWith { hint "Leave the vehicle to refuel it!"; };
  if(player distance _veh < 5) then {   
    _fuel = fuel _veh;
    if(_fuel > 0.95) exitWith { hint "This vehicle needs no refuel"; };
    _veh lock true; player playMove "AinvPknlMstpSnonWrflDnon_medic";
    ["Refuelling vehicle..."] call msg_pd; sleep ((1-_fuel) * 10 + 7); _veh setFuel 1; ["Vehicle Refuelled"] call msg_pd;
    player playMove "AinvPknlMstpSnonWrflDnon_medicEnd";
    [_this select 1] call execString;
  };
};

veh_desWheels = {
  _veh = _this select 0;   
  _veh setHit ["wheel_1_1_steering", 1];
  _veh sethit ["wheel_2_1_steering", 1];
  _veh setHit ["wheel_1_2_steering", 1];
  _veh setHit ["wheel_2_2_steering", 1];
};