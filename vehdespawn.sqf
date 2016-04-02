_art = _this select 0;

if (_art == "CreatedVehicle") then

{

["respawn", (_this select 1), -1, 120, ""] execVM "vehdespawn.sqf";

};

if ((_art == "respawn") and (isServer)) then

{

_vcl        = _this select 1;
_spawnzeit  = _this select 2;
_deletewait = _this select 3;
_vclname    = _this select 4;
_vcltype    = typeOf(_vcl);
_spawnpos   = getpos(_vcl);
_spawndir   = getdir(_vcl);
_idlepos    = _spawnpos;
_exit       = false;
_idle       = 0;
_vcl lock true;

while {alive _vcl and !isnull _vcl} do

	{

	if (_idle >= (INV_inactive_vcl_maxtime*60) and !(_vcl iskindof "air")) then

		{

		for [{_i=0}, {_i < (count INV_PLAYERSTRINGLIST)}, {_i=_i+1}] do

			{

			if ((INV_PLAYERSTRINGLIST select _i) call ISSE_UnitExists) then

				{

				if (((INV_PLAYERLIST select _i) in _vcl) or ((INV_PLAYERLIST select _i) distance _vcl < 50)) then {_idle = (_idle - INV_inactive_vcl_maxtime*10);};

				};

			};

		if (_idle > (INV_inactive_vcl_maxtime*60)) then {_exit = true;};

		};

	if (_exit) exitWith {};

	sleep 10;

	if ( (((_vcl distance _spawnpos) > 20) or (locked _vcl)) and (_vcl distance _idlepos < 150) and (count(crew _vcl) == 0) ) then

		{

		_idle = _idle + 10;

		}
		else
		{

		_idlepos = (getpos _vcl);
		_idle = 0;

		};

	};

if(isnull _vcl)exitwith{};

if (!alive _vcl) then {sleep _deletewait;};
call compile format ["if (!(isNil ""%1"")) then {%1 = []; PublicVariable ""%1"";};", format["%1_storage", _vcl]];
_vcl setVehicleInit "";
call compile format["%1 = nil;", _vcl];
deleteVehicle _vcl;

};