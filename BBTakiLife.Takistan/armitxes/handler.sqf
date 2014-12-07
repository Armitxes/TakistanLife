"PLAYERDATA" addPublicVariableEventHandler {
  PLAYERDATA = call (compile PLAYERDATA);
  if ((count PLAYERDATA) == 9) then {
    lastArray = str(PLAYERDATA);
    
    INV_LizenzOwner = [];
    { INV_LizenzOwner = INV_LizenzOwner + [(INV_Lizenzen select _x) select 0]; } forEach (PLAYERDATA select 6);    
    extrapay = 0;
    
    chatAbbr = "[Guest ";
    
    _rank = (PLAYERDATA select 2);
    switch (_rank) do {
      case 1: { chatAbbr = "[BB "; };
      case 4: { chatAbbr = "[BBs "; };
      case 5: { chatAbbr = "[BBv "; };
      case 230: { chatAbbr = "[DEV "; };
      case 245: { chatAbbr = "[Director "; };
      case 250: { chatAbbr = "[HR "; };
      case 255: { chatAbbr = "[Owner "; };
      default {
        if(_rank <= 240 && _rank >= 238) then {
            chatAbbr = "[Admin ";
        } else {
          if(_rank <= 220 && _rank >= 218) then {
            chatAbbr = "[MOD ";
        } else {
          if(_rank <= 100 && _rank >= 98) then {
            chatAbbr = "[Support ";
        };};};
      };
    };
    
    switch (PLAYERDATA select 3) do {
      case 1: { extrapay = 150; };
      case 2: { extrapay = 350; };
      case 3: { extrapay = 750; };
      case 4: { extrapay = 1050; };
    };
    
    INV_Fabrikowner = [];
    _z = 0;
    {
      _fac = (INV_ItemFabriken select _z);
      if (_x > 0) then { 
        INV_Fabrikowner = INV_Fabrikowner + [_fac select 1];
        call compile format ["%1workers = %2;",(_fac select 8),_x];
      } else { call compile format ["%1workers = %2;",(_fac select 8),0]; };
      _z=_z+1; 
    } forEach (PLAYERDATA select 8);
    
    waitUntil {(alive player)}; 
    _rnk = (PLAYERDATA select 5);
    switch (playerSide) do {
      case WEST: {
        iscop = true;
        if((PLAYERDATA select 4) == 1) then {
          if(_rnk > 99 && _rnk < 103) then { ["use","copUni2"] execVM "armitxes\clothing.sqf"; };
         };        
      };
      case CIVILIAN:  { isciv = true; };
      case resistance: {
        isun = true;
        if((PLAYERDATA select 4) == 2) then {
          switch (_rnk) do {
            case 3: { ["use","unUni2"] execVM "armitxes\clothing.sqf"; };
            case 4: { ["use","unUni2"] execVM "armitxes\clothing.sqf"; };
            case 10: { ["use","unUni2"] execVM "armitxes\clothing.sqf"; };
            case 20: { ["use","unUni3"] execVM "armitxes\clothing.sqf"; };
            case 50: { ["use","unUni3"] execVM "armitxes\clothing.sqf"; };
          };
        };
      };
    };
  };
  submitLoad = nil;
  closeDialog 5000;
  JIP_Stats_Ready = true;
};