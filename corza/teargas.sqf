if ((side player) == civilian) then {

while{true} do {
 
	titlecut [" ","BLACK IN", 1];
 
waituntil
{
	((nearestObject [getpos player, "G_40mm_Smoke"]) distance player < 14);
};
	
	(vehicle player) switchCamera "INTERNAL";
	addcamshake [100, 1, 100];
	titleCut ["*** TEAR GAS ***", "PLAIN", 1];
	sleep 1;
};
};