_art = _this select 0;

if (_art == "use") then
{
	_item = _this select 1;
	_class = _item call INV_getitemClassName;
	_plrPos = getPosASL player;
	_r = true;

	switch (_item) do {
		case "seccam": {
			if (iscop || isun) then {
				_obj = _class createVehicle [0, 0, 0];
				_obj setDir getDir player;
				_obj setPosASL _plrPos;
				[_obj,((_plrPos select 2) + 2.2)] call setHeightASL;
				
				_l = 0; if (isun) then { _l = 1; };
				_arr = cameras select _l; _arr = _arr + [_obj];
				cameras set [_l, _arr]; publicVariable "cameras";
			};
		};
		case "Spikestrip": {
			_obj = _class createVehicle [0, 0, 0];
			_obj setDir getDir player;
			_obj setPosASL _plrPos;
			_obj setDammage 1;
		};
		case "hackkit": {
			_r = false;
			_obj = nearestObject [player,"Misc_Videoprojektor"];
			if (player distance _obj < 3) then {
				if (damage _obj < 0.7) then {
					hintSilent "Jamming camera..."; 
					player playMove "AinvPknlMstpSlayWrflDnon_medic"; sleep 10;
					waitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
					_obj setDamage 0.8; hintSilent "Camera jammed!";
				} else { hintSilent "Camera already jammed"; };
			} else {
				_obj = nearestObject [player,"Infostand_2_EP1"];
				if(player distance _obj < 3) then {
					_rob = _obj getVariable "lastRob";
					if (!isNil "_rob") then {
						if (time > _rob + 1800) then {
							_obj setVariable ["lastRob",time,true];
							hintSilent "Hacking terminal..."; 
							player playMove "AinvPknlMstpSlayWrflDnon_medic"; sleep 10;
							waitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
							["dollarz",5000] call INV_addInventoryItem;
							["addWarrant",player,"Robbery",3000] execVM "warrant.sqf";
							(format ['hintSilent "Someone robbed %1!"',_obj]) call toClients;
						} else { hintSilent "Someone was faster than I.."; };
					} else { hintSilent "Hacking this terminal is to complicated!"; };
				} else { hintSilent "Nothing to hack here"; };
			};
		};
	};
	
	if (_r) then { [_item, -1] call INV_AddInventoryItem; };
};