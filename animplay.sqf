// animplay.sqf

if ((_this select 0) == -1) exitWith {hintSilent localize "STRS_anim_noselect"};
if(vehicle player != player) exitWith {hint "You must be on foot"};
_animnumber       = _this select 0;
_animScriptName   = _this select 1; 
_animCode 		  = _this select 2;
_animname         = ((ANIM_AllAnimationArray select _animnumber) select 0);
_animart          = ((ANIM_AllAnimationArray select _animnumber) select 2);
_withWeapon       = ((ANIM_AllAnimationArray select _animnumber) select 4);
_callScript       = ((ANIM_AllAnimationArray select _animnumber) select 5);
_hasweapon  = false;
if ( count((weapons player) - ["Binocular"] - ["NVGoggles"]) > 0) then {_hasweapon = true;};
if ((not(_hasweapon)) and (_withWeapon == 1)) exitWith {hintSilent localize "STRS_anim_nur_mit_waffe";};
if ((_hasweapon) and (_withWeapon == 0)) exitWith {hintSilent localize "STRS_anim_nur_ohne_waffe";};
if (_callScript != "") exitWith {[_animnumber, _animScriptName] execVM _callScript;};

if (_animart == "anim") then 
{					
	if (vehicle player == player) then 
	{
	
		(format ["%1 switchmove ""%2"";", player, _animname]) call toClients;
	};
	
	} 
	else 
	{
		
		(format ["%1 playMoveNow ""%2"";", player, _animname]) call toClients;
		
	};
	
if (_animart == "playMoveNow") then 
{
		if (vehicle player == player) then 
	{
	
		(format ["%1 playMoveNow ""%2"";", player, _animname]) call toClients;
	};
	
