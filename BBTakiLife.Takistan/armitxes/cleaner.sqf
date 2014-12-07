if((count allGroups) >= 100) then {
  { if (!alive _x) then { deleteVehicle _x; }; } forEach (nearestObjects [[6453,8127,0],["Man"], 8000]);
  { deleteGroup _x; } forEach allGroups;
  sleep 1;
  ("{ deleteGroup _x; } forEach allGroups; hint ""Birdslots are being removed..."";") call toClients;  
} else { hint "No Birdslots detected"; };