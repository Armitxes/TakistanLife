_art = _this select 0;

if (_art == "fired") then {
	_ammo   = _this select 1;
	_wep	= _this select 2;
	_bullet = nearestObject  [getpos player, _ammo];
	
	if((player distance copbase1) < 150 || player distance (getMarkerPos "UNstat") < 150 || player distance (getMarkerPos "civspawn") < 50 || player distance (getMarkerPos "civspawn2") < 50) exitWith {
		deletevehicle _bullet;
		if(firestrikes == 0) exitWith { removeAllWeapons player; firestrikes = 3; };
		firestrikes = firestrikes - 1;
		hint format["WARNING %1: DO NOT FIRE INSIDE THE BASE! %2/%3 chances left.", name player, firestrikes, totalstrikes];
	};
};


if (_art == "hit") then {
	_shooter   = _this select 1;
	_selection = _this select 2;
	_damage    = _this select 3;
	
	//Selections
	_plrParts = ["head_hit","body","hands","legs","Melee"];
	if(isstunned || !(_selection in _plrParts))exitWith{};
	isstunned = true;
	StunActiveTime = StunActiveTime + StunTimePerHit;
	
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [10];
	"dynamicBlur" ppEffectCommit 0;
	waitUntil {ppEffectCommitted "dynamicBlur"};
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit StunActiveTime;
	
	if(_selection != "Melee")then{(format["server globalchat ""%1 was stunned by %2"";", name player, name _shooter]) call toClients;};
	
	if((vehicle player) == player) then {
		if(!(call isprone)) then { 
			(format ["%1 switchmove ""%2"";", player, "adthpercmstpslowwrfldnon_4"]) call toClients;
		} else {
			(format ["%1 switchmove ""%2"";", player, "adthppnemstpsraswpstdnon_2"]) call toClients;
		};
	};
	
	while{StunActiveTime > 0} do {
		if(StunActiveTime > MaxStunTime)then{StunActiveTime = MaxStunTime};
		StunActiveTime = StunActiveTime - 1; 
		sleep 1; 
	};
	StunActiveTime = 0;
	
	if (!(animationState player in animRestrained)) then {   
		isstunned = false;
		if(player call ISSE_IsVictim)then{(format ["%1 switchmove ""%2"";", player, "amovppnemstpsnonwnondnon"]) call toClients};
	};
};