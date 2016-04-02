_art  = ((_this select 3) select 0);
_dollarz = 'dollarz' call INV_GetItemAmount;

if (_art == "slave") exitWith

{

if (localslave >= maxslave) exitWith {role groupChat localize "STRS_slave_zuviele"};

if (_dollarz <= slave_cost) exitWith {role groupChat localize "STRS_slave_nomoney"};

['dollarz', -(slave_cost)] call INV_AddInventoryItem;

hintSilent format[localize "STRS_slave_gekauft", rolestring, (slave_cost call ISSE_str_IntToStr)];

_arbeiternummer   = localslavecounter;
localslavecounter = localslavecounter + 1;
localslave        = localslave + 1;
_slavenumber      = localslavecounter;
_slavename        = player;
_civ 		  = civslavearray select round random(count civslavearray - 1);

call compile format ['_slavename = "%3" createUnit [position player, group player, "%1slave%2 = this; this setVehicleVarName ""%1slave%2"";"]; _slavename = %1slave%2;_slavename setpos getpos player', rolestring, _slavenumber, _civ];
processInitCommands;

call compile format ["arbeitergeld%1 = 0;", _arbeiternummer];

_slavemoney = 0;
_exitvar = 0;
_a1 = 0;
_action = 0;

while {true} do

	{

	if (_exitvar == 1) exitWith {};

		{

		if ((player distance (_x select 0)) < (_x select 1)) then {call compile format ["arbeitergeld%1 = arbeitergeld%1 + slavemoneyprosekunde + round(random 750 - random 250);", _arbeiternummer];};

		} forEach slavearray;

	for [{_i=0}, {_i < 60}, {_i=_i+1}] do

		{

		if ( (not(alive _slavename)) or (not(alive player)))  exitWith {sleep 2; if(!isnull _slavename)then{hintSilent localize "STRS_slave_tot"}else{ hintSilent "A slave you owned has been set free! you are now wanted."; ["addWarrant",player,"Slavery",6000] execVM "warrant.sqf"; }; localslave = localslave - 1; deleteVehicle _slavename; _exitvar = 1;};

		if ((player distance _slavename >= 5 or (call compile format ["arbeitergeld%1 == 0", _arbeiternummer])) and _a1 == 1) then {player removeaction _action; _a1 = 0;};

		if (player distance _slavename < 5 and _a1 == 0 and (call compile format ["arbeitergeld%1 > 0", _arbeiternummer])) then {_action = player addaction [localize "STRS_slave_moneyaction", "slaves.sqf",["dollarz", _arbeiternummer]]; _a1 = 1;};

		if (!(iscop) and ((vehicle _slavename) DISTANCE copbase1 <= 250) and (alive _slavename)) then

			{

			hintSilent localize "STRS_arbeiter_in_copbase";
			if (not((vehicle _slavename) == _slavename)) then {_slavename action ["eject", (vehicle _slavename)];};
			_slavename setpos getmarkerpos "civarea";

			};

		sleep 1;

		};

	};

player removeaction _action;
sleep 15;
deletevehicle _slavename;

};

if (_art == "dollarz") exitWith

{

_arbeiternummer = (_this select 3) select 1;
_arbeitergeld   = call compile format ["arbeitergeld%1;", _arbeiternummer];


if (_arbeitergeld > 0) then

	{

	['dollarz', _arbeitergeld] call INV_AddInventoryItem;
	call compile format ["arbeitergeld%1 = 0;", _arbeiternummer];
	hintSilent format [localize "STRS_slave_geldabnahme_ja", (_arbeitergeld call ISSE_str_IntToStr)];

	}

else    {

	hintSilent localize "STRS_slave_geldabnahme_nein";

	};

};

