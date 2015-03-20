_vcl = _this select 0;
_art = _this select 1;

if(_art == "impound") then
{
  if ((count crew _vcl) > 0) exitWith {player groupChat "The vehicle is not empty!"};
  if(_vcl distance impoundarea2 < 30)exitwith{player groupchat "the vehicle is already impounded!"};
  if(_vcl iskindof "air")exitwith{player groupchat "you cannot impound this vehicle!"};
  if(typeof _vcl == "SearchLight_US_EP1") exitwith {player groupchat "you cannot impound objects!"};

  _dollarz = 200;
  format['hint format[localize "STRS_inventar_impound_gesehen", "%1", "(%2)", %3]', name player, player, _vcl] call toClients;
  
  if (_vcl isKindOf "Motorcycle") then { _dollarz = 100; deleteVehicle _vcl; } else {
    _vcl setdamage 0;
    _vcl engineOn false;
    _vcl setvehiclelock "locked";
    _vcl setpos [(getPos impoundarea1 select 0)-(random 50)+(random 50), (getPos impoundarea1 select 1)-(random 50)+(random 50), getPos impoundarea1 select 2];
  };

  ['dollarz', _dollarz] call INV_AddInventoryItem;
  player groupChat localize "STRS_inventar_impound_success";
  player groupChat format["The government of Takistan sent you $%1 for cleaning the streets of Takistan!",_dollarz];
};

if (_art == "buy") then {
  _dollarz = "dollarz" call INV_getitemamount;
  _fine = 250;
  if (_vcl isKindOf "Motorcycle") then { _fine = 75; };  
  if(_dollarz < _fine)exitWith{player groupchat "You do not have enough money"};
  ["dollarz", -_fine] call INV_AddInventoryItem;
  
  _vcl = call compile format["%1", _vcl];
  _impounds = [impoundarea2,ccarspawn,uncarspawn];
  _closestDis = 100000;
  _closestImpound = "";
  
  {
    _dist = player distance _x;
    if (_closestDis > _dist) then {
      _closestDis = _dist;
      _closestImpound = _x;
    };
  } forEach (_impounds);

  _vcl setpos getpos _closestImpound;
  _vcl setdir getdir _closestImpound;

  player groupChat "You payed the fine and retrieved your vehicle!";
};





