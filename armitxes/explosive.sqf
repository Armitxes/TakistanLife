if(typeName (_this select 0) == "STRING") then {
  _name = (_this select 1);
  if(_name == "C4") then {
    player playMove "";
    
    if(!(isNil "bombAttachment")) then {    
      switch (typeName bombAttachment) do {
        case "OBJECT": {
          if(bombAttachment isKindOf "AllVehicles") then {
            bombAttachment setVariable ["bombActive",nil,true];           
          } else {
            _bombs = nearestObjects [bombAttachment, ["Explosive"], 200];
            if(count _bombs > 0) then { deleteVehicle (_bombs select 0); };           
          };
        };
        case "ARRAY": {
          _bombs = nearestObjects [bombAttachment, ["Explosive"], 200];
          if(count _bombs > 0) then { deleteVehicle (_bombs select 0); };     
        };
      };
      bombAttachment = nil;
    };
    
    player playMove "AinvPknlMstpSnonWrflDnon_medicEnd";
    ["C4",-1] call INV_AddInventoryItem;
        
    _veh = (nearestObjects [player, ["Car","Tank","Air"], 5]);
    if(count _veh > 0) then {
      bombAttachment = _veh select 0;
      bombAttachment setVariable ["bombActive",name player,true];
      server globalChat "C4 attached to Vehicle";
    } else {
      _veh = (nearestBuilding player);
      if((player distance _veh) < 10) then {
        bombAttachment = _veh;
        _pos = (position player);
        _cb = "Explosive" createVehicle _pos;
        _cb setPos [_pos select 0, _pos select 1, 0.2];
        _cb setVariable ["bombowner",name player,true];
        server globalChat "C4 attached to Building";
      } else {
        bombAttachment = (position player);
        _cb = "Explosive" createVehicle bombAttachment;
        _cb setPos bombAttachment;
        _cb setVariable ["bombowner",name player,true];
        server globalChat "C4 attached to Ground";
      };
    };
  };
} else {
  if(_this select 3 == "defuse") exitWith {
    _bombs = nearestObjects [player, ["Explosive"], 200];
    _owner = (_bombs select 0) getVariable "bombowner";
    if(count _bombs > 0) then { deleteVehicle (_bombs select 0); };
    server globalChat (format ["C4 defused. Forensics found the fingerprints of %1 on the explosive",_owner]);  
  };
  if(_this select 3 == "explode") exitWith {
    if(!(isNil "bombAttachment") && !(animationState player in animRestrained) && !(player call ISSE_IsVictim)) then {    
      _bombs = nearestObjects [bombAttachment, ["Explosive"], 100];
      switch (typeName bombAttachment) do {
        case "OBJECT": {
          if(bombAttachment isKindOf "AllVehicles") then {
            _owner = bombAttachment getVariable "bombActive";
            if(!isNil "_owner") then { bombAttachment setDamage 1; "BO_GBU12_LGB" createVehicle (getPos bombAttachment); };           
          } else {
            if(count _bombs > 0) then { bombAttachment setDamage 1; deleteVehicle (_bombs select 0); };           
          };
        };
        case "ARRAY": {
          if(count _bombs > 0) then { "BO_GBU12_LGB" createVehicle bombAttachment; deleteVehicle (_bombs select 0); };     
        };
      };
      bombAttachment = nil;
    };
  };
};                                                                                                           