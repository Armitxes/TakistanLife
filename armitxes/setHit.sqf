_selection	= _this select 1;
_ammo		= _this select 4;

if((alive player)
  && !skipDmg
  /*&& _selection != ""*/) then {

  _vehicle	= _this select 0;
  _damage		= _this select 2;
  _shooter	= _this select 3;          
  //_nvcls = nearestObjects [getpos _vehicle, ["LandVehicle"], 5];
  _vcls = nearestobjects [getpos _vehicle, ["LandVehicle", "Air", "ship"],8];
  _vcl = _vcls select 0;
  
 
 if(([player] call plr_isUnConscious) && _selection != "") then { player setDamage 1; [_shooter, _vcls] execVM "victim.sqf"; } else {
    if(player == _vehicle && (_ammo in ["B_12Gauge_74Slug","F_40mm_White",1,"B_9x19_SD","15Rnd_9x19_M9SD"])) then {["hit", _shooter, _selection, _damage] execVM "stun.sqf";} else {   

      [_selection,_damage,_shooter, _vcls] spawn {
        _selection	= _this select 0;
        _damage		= _this select 1;
        _shooter	= _this select 2;
        _vcls		= _this select 3;
		_vcl		= _vcls select 0;
		
		
        
        if(alive player) then {
          switch (_selection) do {
            case "head_hit": { dmgHead = dmgHead + _damage; };
            case "body": { dmgBody = dmgBody + _damage; };
            case "hands": { dmgHands = dmgHands + _damage; player setHit ["hands",dmgHands]; };
            case "legs": { dmgLegs = dmgLegs + _damage; player setHit ["legs",dmgLegs]; };
          };
		if (!(isNil "_vcl")) then {
		if ((vehicle player != player) && (_shooter == _vcl) && (_damage > 0.1)) then { dmgBody = dmgBody + _damage};};


          if (dmgHead > 0.99 || dmgBody > 0.99) then {
            skipDmg = true;    
            if (vehicle player != player) then {			
			player action ["eject", vehicle player]; sleep 2; sleep 0.5; };
            
			player playMove "AdthPercMstpSlowWrf_beating"; 
            sleep 5;
            
            while { dialog } do { closeDialog 0; };
	    titleText ["You are unconscious", "WHITE OUT", 2];
            if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
            ctrlSetText [1,"You are unconscious, want to call a medic? Pressing no or closing this window will result in a suicide."];
            sleep 1;
            skipDmg = false; 
            waitUntil{!(ctrlVisible 1023) || !(alive player)};
          
            if(!(alive player) || Antwort > 2 || (animationState player) != "AdthPercMstpSlowWrf_beating") then { while { ctrlVisible 1023 } do { closeDialog 0; }; } else {
              if (Antwort == 1) then {
                _medCount = 0;
                {
                  if((typeOf _x) in ["Dr_Hladik_EP1","USMC_LHD_Crew_Blue","Doctor","Worker2"]) then { _medCount = _medCount + 1; }; 
                } forEach playableUnits;
            
                if (_medCount > 0) then {
                  Antwort = 3;
                  prioCall = true;
                  ["call_medic"] execVM "armitxes\phone.sqf";
                  systemChat "EMERGENCY CALL SENT";
                  waitUntil {!(alive player) || (animationState player) != "AdthPercMstpSlowWrf_beating"};
		  if (alive player) then { titleText ["A medic revived you", "WHITE IN", 2]; } else { titleText ["You were killed", "WHITE IN", 2]; };
                  Antwort = 2;
                } else {
                  systemChat "No medic online. You died.";
		  titleText ["You suicided", "WHITE IN", 2];
                  player setDamage 1;
                };
          	 } else { player setDamage 1; systemChat "You suicided"; }; 
            };
          };
        } else { player setHit [_selection, _damage]; };
		
      
      	if(!(alive player)) then { [_shooter, _vcls] execVM "victim.sqf"; };
      };
    };
  };
};


false