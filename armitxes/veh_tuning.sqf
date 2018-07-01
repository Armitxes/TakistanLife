_doAction = _this select 0;
_item     = _this select 1;
_vcl      = vehicle player;
_type     = typeof _vcl;

switch _doAction do {
  case 'use': {
    if (_vcl isKindof "Tank") exitwith {hintSilent "You cannot tune this vehicle"};
	if(vehicle player != player) then {
      _lvl = 1.009;
      
      if(
          (_vcl isKindOf "ArmoredSUV_PMC") ||
          (_vcl isKindOf "LandRover_Base") ||
          (_vcl isKindOf "SUV_Base_EP1") ||
		  (_vcl isKindOf "Truck")
      ) then { _lvl = 1.0055; };
      if(
          (_vcl isKindOf "HMMWV_Base")
      ) then { _lvl = 1.011; };    
      
      _vcl setVariable ["tuning",_lvl,true];
      [_item, -1] call INV_AddInventoryItem;
      hintSilent "Vehicle tuned";
    } else {hintSilent "Not in a vehicle";};
  };
};
