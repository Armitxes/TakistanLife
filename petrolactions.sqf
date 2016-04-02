_a1 = 0;
_v1 = 0;
_f1 = 0;

{_x setFuelCargo 0} foreach (nearestobjects [getpos copbase1,["Land_Ind_FuelStation_Feed_Ep1"], 6000]);

while {true} DO

{

for [{_i=0}, {_i < (count TankstellenArray)}, {_i=_i+1}] do

	{

	_flag = (TankstellenArray select _i);
	_vcl  = vehicle player;
	if (_vcl != player and driver _vcl == player and (vehicle player distance _flag <= 18) and (_a1 == 0)) then

		{

		action_tankstelle = vehicle player addAction [format [localize "STRS_addAction_buy_gas", TankenCost],"petrolrefuel.sqf"];
		_a1 = 1;
		_v1 = vehicle player;
		_f1 = _i;

		};

	if (((vehicle player == player) or (vehicle player distance _flag > 15)) and (_f1 == _i) and (_a1 == 1)) then

		{

		_v1 removeAction action_tankstelle;
		_a1 = 0;

		};

	};

sleep 3;

};