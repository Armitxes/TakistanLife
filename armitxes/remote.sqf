_doAction = _this select 0;

if(typeName _doAction != "STRING") then {
	if(typeName (_this select 3) == "ARRAY") then {
		_doAction=(_this select 3) select 0;
	} else {_doAction=_this select 3;};
};

switch (_doAction) do
{
	case "door": {
		_obj = _this select 1;
		_cords = _this select 2;
		_obj setPosASL [(_cords select 0),(_cords select 1),-5];
		server globalChat "Security: Door open";
		sleep 8;
		_obj setPosASL [(_cords select 0),(_cords select 1),(_cords select 2)];
		server globalChat "Security: Door closed";
	};
	case "prisonDoor": {
		_obj = _this select 1;
		_hacked = _obj getVariable "hacked";
		if (isNil "_hacked") then { _hacked = -300; };

		if (iscop || isun || _hacked+300 > time) then {
			_cords = _this select 2;
			_time = _this select 3;
			if (isNil "_time") then { _time = 8; };
			_obj setPosASL [(_cords select 0),(_cords select 1),-5];
			server globalChat "Security: Door open";
			sleep _time;
			_obj setPosASL [(_cords select 0),(_cords select 1),(_cords select 2)];
			server globalChat "Security: Door closed";
		} else { titleText ["Wrong access code", "PLAIN DOWN", 0.1]; };
	};
	case "unCP": {
		if (isun) then {
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
		if(isUN) then {
			_mans = nearestObjects [getMarkerPos "cpWest", ["Man"], 100];
			_mans = _mans + nearestObjects [getMarkerPos "cpEast", ["Man"], 100];

			_prisoners = [];
			{if(alive _x && (animationState _x) in animRestrained) then { _prisoners = _prisoners + [_x]; };} forEach _mans;
			if ((count _prisoners) > 0) then {
				('server globalChat "A prisonbus is heading towards the border";') call toClients;

				sleep 120;
				{
					if(alive _x && (animationState _x) in animRestrained) then {
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
	case "camera": {
		if(iscop || isun) then {
			camCoords = nil;

			_l = 0; if (isun) then { _l = 1; };
			_cams = (cameras select _l);
			_mrks = [];

			for [{_i=0}, {_i<(count _cams)}, {_i=_i+1}] do {
				_curCam = _cams select _i;
				_markerName = format ["camMarker%1",_i];
				_marker = createMarkerLocal [_markerName, position _curCam];
				_markerName setMarkerShapeLocal "ICON";
				_markerName setMarkerTypeLocal "mil_circle";
				_markerName setMarkerTextLocal "CAM";
				_mrks = _mrks + [_markerName];
			};

			openMap [true,true];
			onMapSingleClick "camCoords = _pos;";
			waitUntil {!isNil "camCoords"};
			openMap [false,false];

			_camDist = 100000;
			_camObj = nil;
			for [{_i=0}, {_i<(count _cams)}, {_i=_i+1}] do {
				_curCam = _cams select _i;

				_dist = _curCam distance camCoords;
				if (_dist < _camDist) then {
					_camObj = _curCam;
					_camDist = _dist;
				};
			};

			{ deleteMarkerLocal _x; } forEach _mrks;

			if ((camCoords distance _camObj) < 400) then {
				if(damage _camObj < 0.7) then {
					_camera = "camera" camCreate (getPosATL _camObj);
					if (!(createDialog "MainCamDialog")) exitWith {hint "Dialog Error!";};
					[0,0,0,["camcontrol",_camera,[10,30]]] execVM "copcams.sqf";
					_camera cameraEffect ["internal", "back"];
					_camera camSetPos (getPosATL _camObj);
					_camera setDir ((getDir _camObj)+180);
					_camera camSetFov 0.700;
					_camera camPreload 5;
					_camera camCommit 0;
				} else { hintSilent "Something is wrong with this camera!"; };
			};
		};
	};
};
