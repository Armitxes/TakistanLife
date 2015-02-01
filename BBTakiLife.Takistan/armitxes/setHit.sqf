_selection	= _this select 1;
_ammo		= _this select 4;
if((alive player)
  && !skipDmg
  && _selection != ""
  && _ammo != "") then {

  _vehicle	= _this select 0;
  _damage		= _this select 2;
  _shooter	= _this select 3;          
  _nvcls		= nearestObjects [getpos _vehicle, ["LandVehicle"], 5];

  if([player] call plr_isUnConscious) then { player setDamage 1; [_shooter, _nvcls] execVM "victim.sqf"; } else {
    if(player == _vehicle && (_ammo in ["B_12Gauge_74Slug","F_40mm_White",1,"B_9x19_SD","15Rnd_9x19_M9SD"])) then {["hit", _shooter, _selection, _damage] execVM "stun.sqf";} else {   

      [_selection,_damage,_shooter, _nvcls] spawn {
        _selection	= _this select 0;
        _damage		= _this select 1;
        _shooter	= _this select 2;
        _nvcls		= _this select 3;
        
        if(alive player) then {
          switch (_selection) do {
            case "head_hit": { dmgHead = dmgHead + _damage; };
            case "body": { dmgBody = dmgBody + _damage; };
            case "hands": { dmgHands = dmgHands + _damage; };
            case "legs": { dmgLegs = dmgLegs + _damage; };
          };
          
          player setHit ["hands",dmgHands]; player setHit ["legs",dmgLegs];
          
          if (dmgHead > 0.99 || dmgBody > 0.99) then {
            skipDmg = true;    
            if (vehicle player != player) then { player action ["eject", vehicle player]; sleep 2; sleep 0.5; };
            player playMove "AdthPercMstpSlowWrf_beating"; 
            sleep 5;
            
            while { dialog } do { closeDialog 0; };
            if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
            ctrlSetText [1,"You are unconscious, want to call a medic? Pressing no or closing this window will result in a suicide."];
            sleep 1;
            skipDmg = false; 
            waitUntil{(not(ctrlVisible 1023)) || !(alive player)};
          
            if(!alive player) then { while { ctrlVisible 1023 } do { closeDialog 0; }; } else {
              if (Antwort == 1) then {
                _medCount = 0;
                {
                  if((typeOf _x) in ["Dr_Hladik_EP1","USMC_LHD_Crew_Blue","Doctor"]) then { _medCount = _medCount + 1; }; 
                } forEach playableUnits;
            
                if (_medCount > 0) then {
                  prioCall = true;
                  ["call_medic"] execVM "armitxes\phone.sqf";
                  systemChat "EMERGENCY CALL SENT";
                } else {
                  systemChat "No medic online. You died.";
                  player setDamage 1;
                };
          	 } else { player setDamage 1; systemChat "You suicided"; };
              Antwort = 2;
            };
          };
        } else { player setHit [_selection, _damage]; };
      
      	if(!(alive player)) then { [_shooter, _nvcls] execVM "victim.sqf"; };
      };
    };
  };
};

false