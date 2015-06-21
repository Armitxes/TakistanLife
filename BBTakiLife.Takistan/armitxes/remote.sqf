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
	case "jailbus": {
		if(isUN && (PLAYERDATA select 2) > 0) then {
			_mans = nearestObjects [getMarkerPos "cpWest", ["Man"], 100];
			_mans = _mans + nearestObjects [getMarkerPos "cpEast", ["Man"], 100];

			_prisoners = [];
			{if(alive _x && (animationstate _x) == "civillying01") then { _prisoners = _prisoners + [_x]; };} forEach _mans;
			if ((count _prisoners) > 0) then {
				('server globalChat "A prisonbus is heading towards the border";') call toClients;
				
				sleep 120;
				{
					if(alive _x && (animationstate _x) == "civillying01") then {
						format['if(player == %2)then{ [%1] execVM "putinjail.sqf"; };', player, _x] call toClients;					
					}
				} forEach _prisoners;
			} else { server globalChat "No prisoners found"; };
		} else { server globalChat "Request Denied"; };
	};
};