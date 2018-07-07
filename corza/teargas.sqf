if ((side player) == civilian) then {

while{true} do {
 
	titlecut [" ","BLACK IN", 1];
 
waituntil
{
	((nearestObject [getpos player, "SmokeShell"]) distance player < 11);
};

	titleCut ["*** TEAR GAS ***", "BLACK FADED", 3];
	sleep 3;
};
};