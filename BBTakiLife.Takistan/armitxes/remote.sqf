_doAction = _this select 0;

switch (_doAction) do
{ 
  case "door": {
    _obj = _this select 1;
    _cords = (getPosASL _obj);
    if((_cords select 2) <= -1) exitWith { server globalChat "Security: Aborted. Door already open.";};
    _obj setPosASL [(_cords select 0),(_cords select 1),-5];
    server globalChat "Security: Door open";
    sleep 8;
    _obj setPosASL [(_cords select 0),(_cords select 1),(_cords select 2)];
    server globalChat "Security: Door closed";
  };
  case "unCP": {
    if (isun && ((PLAYERDATA select 4) == 2)) then {
      _mrk = _this select 1;
      if ((markerText _mrk) == "OPEN") then { 
        _mrk setMarkerText "CLOSED";
        _mrk setMarkerColor "ColorRed";
        ('server globalChat "United Nations: A Checkpoint has been closed."') call broadcast;
        
        {
          _x animate ["bargate",1];
          _x setDamage 0;
        } forEach (nearestObjects [getMarkerPos _mrk, ["ZavoraAnim"], 100]); 
      } else {
        _mrk setMarkerText "OPEN";
        _mrk setMarkerColor "ColorGreen";
        ('server globalChat "United Nations: A Checkpoint has been opened."') call broadcast;      
      };
    } else { server globalChat "Access Denied"; };
  };
};