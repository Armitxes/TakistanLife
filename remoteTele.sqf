closeDialog 50001;

hint "Click on the map to Teleport!";
openMap [true, false];
onMapSingleClick "onMapSingleClick """";(vehicle player) setpos [_pos select 0, _pos select 1, 0];";


