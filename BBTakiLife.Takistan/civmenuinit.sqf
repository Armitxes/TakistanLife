_civmenuciv  = civmenuciv; // Ziel
_civmenu_civ = civmenu_civ;  // Auslöser
_art         = _this select 0;
_dollarz        = 'dollarz' call INV_GetItemAmount;
//_civ			= compile _civmenu_civ

if ((player distance _civmenuciv >= 25) or (!(alive _civmenuciv))) exitWith { player groupChat format[localize "STRS_civmenu_distance"]; };


switch (_art) do {
  case 1: { (format ["if (player == %1) then {[""drugs"", %2] execVM ""civmenu.sqf"";};", _civmenuciv, player]) call toClients; };
  case 2: {
   //if(!(_civmenuciv call ISSE_IsVictim) || !([civmenu_civ] call plr_isUnConscious)) exitwith{hint localize "STRS_inventory_checknohands"};
    (format ["if (player == %1) then {[""disarm""] execVM ""civmenu.sqf"";};", _civmenuciv]) call toClients;
    player groupChat format [localize "STRS_civmenu_disarm", _civmenu_civ];
  };
  case 3: {
    _dauer = round(_this select 1);
    format ["if (player == %1) then {[""arrest"", %2] execVM ""civmenu.sqf"";};", _civmenu_civ, player] call toClients;
    player groupChat format[localize "STRS_civmenu_arrested", _civmenu_civ];
  };
  case 4: {
    _strafe = _this select 1;
    if (!(_strafe call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_inv_no_valid_number";};
    _strafe = _strafe call ISSE_str_StrToInt;  if (_strafe <= 0) exitWith {};
    (format ["if (player == %1) then {[""ticket"", %2, %3] execVM ""civmenu.sqf"";}; server globalchat format[localize ""STRS_civmenu_ticket_globalchat"", name %1, %2, name %3];", _civmenuciv, (_strafe call ISSE_str_IntToStr), player]) call toClients;
  };
  case 5: {
    (format ["%1 setdamage 0; if (%1 == player) then { dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0; player Groupchat localize ""STRS_civmenucheck_youarehealed"";};", _civmenuciv]) call toClients;
    player groupChat format [localize "STRS_civmenu_heal", _civmenu_civ];  
  };
  case 6: {
    if(!(_civmenuciv call ISSE_IsVictim))exitwith{hint localize "STRS_inventory_checknohands"};
    (format ["if (player == %1) then {[""inventcheck"", %1] execVM ""civmenu.sqf"";}", _civmenuciv]) call toClients;  
  };
  case 8: { (format ["if (player == %1) then {[""licencheck"", %1] execVM ""civmenu.sqf"";}", _civmenuciv]) call toClients; };
  case 20: {
    if(!(_civmenuciv call ISSE_IsVictim))exitwith{hint localize "STRS_inventory_checknohands"};
    (format ["if (%1 == player) then {[""stealmoney"",%2] execVM ""civmenu.sqf"";};",_civmenuciv,player]) call toClients;
  };
  case 40: {
    if(animationstate civmenuciv == "civillying01")then
  	{
  	  dragging = true;
  	  dragciv = _civmenuciv;
      civmenuciv attachTo [player,[0,0.5,0]];
    };
  };
};                                              