// script by EddieV223
_selection = (_this select 3)select 0;

if(_selection == "unflip") then
{

	_vcl = (nearestobjects [getpos player, ["LandVehicle"], 10] select 0);
	//if (_vcl == "") exitwith {player groupchat "No vehicles in range";};
	if (_vcl in INV_VehicleArray) then
	{

	if ((count crew _vcl) > 0) exitWith {player groupChat "The vehicle is not empty!";};


	player groupchat "turning your vehicle over, wait 20s within 10meters.";
	sleep 10;

	if (player distance _vcl < 10) then
		{
		_vcl setvectorup [0.001,0.001,1];
		player groupchat "Your vehicle has been reset";
		}
		else
		{
		player groupchat "Try again, stay within 10m";
		};
	}
	else
	{
	player groupchat "You need the keys to unflip a vehicle";
	};
};

//eddiev223