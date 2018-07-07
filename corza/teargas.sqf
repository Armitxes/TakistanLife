if ((side player) == civilian) then {

while{true} do {
 
	titlecut [" ","BLACK IN", 1];
 
waituntil
{
	((nearestObject [getpos player, "G_40mm_Smoke"]) distance player < 14);
};

	titleCut ["*** TEAR GAS ***", "BLACK FADED", 1];
	sleep 1;
};
};