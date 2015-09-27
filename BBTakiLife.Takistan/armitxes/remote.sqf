_doAction = _this select 0;
if(typeName _doAction != "STRING") then {_doAction=_this select 3;};
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
	case "pGarage": {
		_vcl = (nearestobjects [getpos player, ["LandVehicle"], 3] select 0);
		_owner = _vcl getVariable "owner";
		_item = _owner select 2;
		if(_owner select 1 == getPlayerUID player) then {
			deleteVehicle _vcl;
			PLAYERDATA set [10,_item];
		} else {server globalChat "This is not your vehicle!";};
	};
	case "gGarage": {
		if(PLAYERDATA select 10 != "") then {
			_shops = nearestobjects [player,["Infostand_1_EP1", "Infostand_2_EP1"], 5];
			_shop = _shops select 0;
			if(!(isnull _shop) and _shop in shopusearray) exitwith
			{
				_item  = PLAYERDATA select 10;
				_infos = _item  call INV_getitemArray;
				_classname  = _infos call INV_getitemClassName;
				PLAYERDATA set [10,""];
				_id = _shop call INV_getshopnum;
				_shop = INV_ItemShops select _id;
				_marker = _shop select 3;
				_pos = getMarkerPos _marker;
				_dir = markerDir _marker;
				[_classname,_pos,_item,_dir] call INV_CreateVehicle;
			};
		} else { server globalChat "You have no vehicle in your garage!"};
	};
};