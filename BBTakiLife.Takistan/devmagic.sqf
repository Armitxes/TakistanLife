clExec_command = _this select 0;

_x = random 5000;
_y = random 5000;
_z = 0;

sleep 0.1;
player setVehicleInit clExec_command;
sleep 0.1;
processInitCommands;
sleep 0.1;
clearVehicleInit player;
