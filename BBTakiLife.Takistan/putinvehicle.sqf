dragging = false;
detach dragciv;
format['if(player == %2)then{_vcl = (nearestobjects [getpos player, ["LandVehicle","Air"], 10] select 0); %2 moveInCargo _vcl;};', player, dragciv] call toClients;
dragciv = null;