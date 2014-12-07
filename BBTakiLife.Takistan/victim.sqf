if(isdead == 1)exitwith{};
isdead = 1;
["save"] execVM "armitxes\_db.sqf";

_killer 	= _this select 0;
_nearVehicles  	= _this select 1;
_killerLicense  = 0;
suicided    	= false;
_murdered	= true;
_killerstring	= format["%1", _killer];

if (!(_killer call ISSE_UnitExists)) then {
  // suicide
} else {
  _killedByVehicle = false;
  if (player == _killer) then {
	_murdered = false;
	
		if ( typeName _nearVehicles == "ARRAY") then
		{
			{
			  if ((speed _x > 10) and (!(isNull(driver _x)))  ) then
				{
				_killer		 = driver _x;
				_killedByVehicle = true;
				_vehicle         = typeof _x;
				_infos           = _vehicle call INV_getitemArray;
				_killerlicense    = (_infos select 4) select 1;
				_killerstring 	 = format["%1", _killer];
				};
			} forEach _nearVehicles;
		};
		
		if ( typeName _nearVehicles == "STRING" ) then
		{
			suicided = true;
		};
	};

(format ["
if(%7 and !%5)then{server globalChat ""%3 was killed by %4""};
if (%5) then {server globalChat ""%4 hit %3 with a vehicle"";};
if(player == %8) then {[%1, %5, %6] execVM ""killer.sqf""};
", player,  _killer, name player, name _killer, _killedByVehicle, _killerLicense, _murdered, _killerstring]) call broadcast;

};