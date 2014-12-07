if(!(alive player))exitWith{}; //|| skipDmg
//if([player] call plr_isUnConscious) exitWith { player setDamage 1; [_shooter, _nvcls] execVM "victim.sqf"; };

_vehicle	= _this select 0;
_selection	= _this select 1;
_damage		= _this select 2;
_shooter	= _this select 3;
_ammo		= _this select 4;           
_nvcls		= nearestObjects [getpos _vehicle, ["LandVehicle"], 5];

if(player == _vehicle && (_ammo in ["B_12Gauge_74Slug","F_40mm_White",1,"B_9x19_SD","15Rnd_9x19_M9SD"])) exitWith {["hit", _shooter, _selection, _damage] execVM "stun.sqf";};

[_selection,_damage,_shooter, _nvcls] spawn {
  _selection	= _this select 0;
  _damage		= _this select 1;
  _shooter	= _this select 2;
  _nvcls		= _this select 3;

  /* DO NOT REMOVE! /Armi
  if(_selection == "") then { _selection = "body"; };
  if(_selection == "hands") exitWith { player setHit["Hands", 1]; };
  if(_selection == "legs") exitWith { player setHit["Legs", 1]; };

  if((alive player) && ((damage player) + _damage) >= 1 && (_selection != "head_hit")) then { 
    skipDmg = true;    
    if (vehicle player != player) then { player action ["eject", vehicle player]; sleep 2; };
    player playMove "AdthPercMstpSlowWrf_beating";
    del = player addAction ["Suicide","noscript.sqf",'player setDamage 1; player removeAction del;',1,false,true,"",'(animationstate player == "AdthPercMstpSlowWrf_beating")'];
    hint "You are unconscious. Better call a medic before it's too late."; 
    sleep 3; skipDmg = false;
    waitUntil {!alive player || (damage player) == 0};
  } else { player setHit [_selection, _damage]; };*/

  player setHit [_selection, _damage];
	if(_selection == "" and _damage >= 1 and !isnull _shooter)then{player setdamage 1};
	if(alive player)exitwith{};
	[_shooter, _nvcls] execVM "victim.sqf";
};

false