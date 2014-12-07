switch (_this select 3) do {
  case 0: {
    if((primaryWeapon player) != "") then {
      primHolster = primaryWeapon player;
      player removeWeapon primHolster;
    } else {
      if (primHolster != "") then {
        player addWeapon primHolster;        
        primHolster = "";
      };
    };
  };
  case 1: {
    _pistol = player call INV_getPistol;
    if(!isNil("_pistol")) then {
      pistolHolster = _pistol;
      player removeWeapon _pistol;
    } else {
      if (pistolHolster != "") then {
        player addWeapon pistolHolster;
        pistolHolster = "";
      };
    };
  };
};