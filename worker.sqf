_art  = ((_this select 3) select 0);
_dollarz = 'dollarz' call INV_GetItemAmount;

if (_art == "holen") exitWith

{
_huren_cost = 1000;
if (localhuren >= 5) exitWith {role groupChat localize "STRS_arbeiter_zuviele";};
if (_dollarz <= _huren_cost)    exitWith {role groupChat localize "STRS_arbeiter_nomoney";};
['dollarz', -(_huren_cost)] call INV_AddInventoryItem;
hintSilent format[localize "STRS_arbeiter_gekauft", rolestring, (_huren_cost call ISSE_str_IntToStr)];
_arbeiternummer   = localhurencounter;
localhurencounter = localhurencounter + 1;
localhuren        = localhuren + 1;
_hoenumber        = localhurencounter;
_civ 		  = civworkerarray select round random(count civworkerarray - 1);

call compile format ['"%3" createUnit [getpos player, group player, "%1hure%2 = this;this setVehicleVarName ""%1hure%2"";this addEventHandler [""killed"", {[(_this select 1), %1] execVM ""workerkilled.sqf"";}];"];
', rolestring, _hoenumber, _civ];
processInitCommands;

_hoename = call compile format['%1hure%2', rolestring, _hoenumber];

while {true} do

	{

	_w1=0;
	_w2=0;
	_w3=0;

	if(!alive player) then

		{

		waituntil {alive player};
		[_hoename] join (group player);

		};

	if (!(alive _hoename))  exitWith

		{

		if(_hoename in wp1unitarray)then{wp1unitarray = wp1unitarray - [_hoename ]; publicvariable "wp1unitarray";};
		if(_hoename in wp2unitarray)then{wp2unitarray = wp2unitarray - [_hoename ]; publicvariable "wp2unitarray";};
		if(_hoename in wp3unitarray)then{wp3unitarray = wp3unitarray - [_hoename ]; publicvariable "wp3unitarray";};
		hintSilent localize "STRS_arbeiter_tot";
		localhuren = localhuren - 1;
		_hoename SETDAMAGE 1;
		sleep 5;
		deletevehicle _hoename;

		};

		{

		if ((_hoename distance (_x select 0)) < (_x select 1)) then

			{

			if((_x select 0) == workplace1 and count wp1unitarray < wpcapacity and !(_hoename in wp1unitarray))then{wp1unitarray = wp1unitarray + [_hoename ]; publicvariable "wp1unitarray";};
			if((_x select 0) == workplace2 and count wp2unitarray < wpcapacity and !(_hoename in wp2unitarray))then{wp2unitarray = wp2unitarray + [_hoename ]; publicvariable "wp2unitarray";};
			if((_x select 0) == workplace3 and count wp3unitarray < wpcapacity and !(_hoename in wp3unitarray))then{wp3unitarray = wp3unitarray + [_hoename ]; publicvariable "wp3unitarray";};

			}
			else
			{

			if((_x select 0) == workplace1 and _hoename in wp1unitarray)then{wp1unitarray = wp1unitarray - [_hoename ]; publicvariable "wp1unitarray";};
			if((_x select 0) == workplace2 and _hoename in wp2unitarray)then{wp2unitarray = wp2unitarray - [_hoename ]; publicvariable "wp2unitarray";};
			if((_x select 0) == workplace3 and _hoename in wp3unitarray)then{wp3unitarray = wp3unitarray - [_hoename ]; publicvariable "wp3unitarray";};

			};

		} forEach workplacearray;

	if((_hoename in wp1unitarray) or (_hoename in wp2unitarray) or (_hoename in wp3unitarray))then{timeinworkplace = timeinworkplace + 500/add_workplace};

	if(_hoename call INV_unitArmed) then

		{

		hintSilent "You cannot arm workers!";
		removeallweapons _hoename;

		};

	sleep 1;

	};

};

