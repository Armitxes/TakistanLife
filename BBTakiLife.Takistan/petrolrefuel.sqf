_fuel = fuel (vehicle player);
_fuelstartposition = getpos(vehicle player);
_exitvar = 0;

if (_fuel >= 0.99) exitWith

{

hintSilent localize "STRS_gasstation_bereits_getankt";

};

while {((fuel (vehicle player)) < 0.99)} do

{

player removeaction action_tankstelle;

if(TankenCost < maxpetroluse)then{TankenCost = TankenCost + petroluse};
if (tankencost <=10) then {oildemand = 1};
if (tankencost > 10 && tankencost <=20) then {oildemand = 1.1;};
if (tankencost > 20 && tankencost <=30) then {oildemand = 1.2;};
if (tankencost > 30 && tankencost <=40) then {oildemand = 1.3;};
if (tankencost > 40 && tankencost <=60) then {oildemand = 1.4;};
if (tankencost > 60 && tankencost <=80) then {oildemand = 1.5;};

_tankvehicle = vehicle player;

if (not(['dollarz', -(TankenCost)] call INV_AddInventoryItem)) exitWith

	{

	hintSilent localize "STRS_gasstation_tanken_money";
	_exitvar = 1;

	};

if (_tankvehicle == player) exitWith

	{

	hintSilent localize "STRS_gasstation_tanken_vclleft";
	_exitvar = 1;

	};

if (vehicle player distance _fuelstartposition > 6) exitWith

	{

	hintSilent localize "STRS_gasstation_tanken_vclmoved";
	_exitvar = 1;

	};

_tankvehicle setFuel ((fuel _tankvehicle)+0.1);
titleText [ format[localize "STRS_gasstation_tanken_zwischenmsg",round(fuel _tankvehicle * 100)], "PLAIN DOWN"];

sleep 1;

};

publicvariable "tankencost";
sleep 0.1;
publicvariable "oildemand";

if (_exitvar == 1) exitWith {};

hintSilent localize "STRS_gasstation_tanken_finished";