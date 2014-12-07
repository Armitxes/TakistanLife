Flare1="F_40mm_Green" createVehicle [(getPos flareX select 0),( getPos flareX select 1), 250];
Flare2="F_40mm_Green" createVehicle [(getPos flareX select 0),( getPos flareX select 1), 250];
player sideChat "All Clear!";
flarelaptop removeAction action3;
sleep 120;
action3 = flarelaptop addAction ["Fire All clear flare", "flare3.sqf"];
