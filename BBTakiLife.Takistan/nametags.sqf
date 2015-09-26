private ["_control2","_car","_faceTP", "_tag", "_vcls", "_stn", "_distTP", "_distCP", "_distSP"];

disableSerialization;

while {true} do {
	for [{_i=1}, {_i < 25}, {_i=_i+2}] do {
		_range 	= _i;
		_dirV = vectorDir vehicle player;
		_pos = player modelToWorld [0,0,0];
		_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
	
		if (vehicle player == player) then {
			_objs = nearestObjects [_posFind,["Man", "Infostand_1_EP1", "Infostand_2_EP1", "Misc_cargo_cont_tiny", "RUBasicAmmunitionBox","UNBasicAmmunitionBox_EP1"],1];
			_vcls = nearestobjects [_posFind,["LandVehicle", "Air", "ship", "LocalBasicWeaponsBox"], 3];
			_atms = nearestObjects [_posFind,["Infostand_1_EP1", "Misc_cargo_cont_tiny"],2];

			if(count _vcls > 0 and INV_shortcuts) then {
				_car = _vcls select 0;
				_distCP = (_car distance player);
				
				if(typeof _car != "LocalBasicWeaponsBox" and !(isnull _car) and alive _car and !(locked _car) and vehicle player == player and _distCP < 3) then {
					titleRsc["Rtags", "PLAIN"];
					_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
					_control ctrlSetText "Enter (E)";
				};
				if((_car in INV_VehicleArray) and typeof _car == "LocalBasicWeaponsBox" and !(isnull _car) and vehicle player == player and _distCP < 3) then {
					titleRsc["Rtags", "PLAIN"];
					_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
					_control ctrlSetText "Trunk (T)";
				};
			};
			if(count _atms > 0 and INV_shortcuts) then {
				_atm = _atms select 0;
				_distTP = (_atm distance player);
				
				if(_atm in bankflagarray and _distTP < 3) then {
					titleRsc["Rtags", "PLAIN"];
					_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
					_control ctrlSetText "ATM (E)";
				};
			};

			if(count _objs > 0 and INV_shortcuts) then {
				_tag = _objs select 0;
				_distTP = (_tag distance player);
	
				if(_tag in shopusearray and _distTP < 3) then {
					_text = (_tag call INV_getshopArray) select 1;
					titleRsc["Rtags", "PLAIN"];
					_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
					if((iscop || isun) and _tag in drugsellarray)exitWith{_control ctrlSetText "Drug Search (E)";_control ctrlSetTextColor [0, 0, 1, 0.8]};
					_control ctrlSetText format["%1 (E)", _text];
					_control ctrlSetTextColor [1, 1, 1, 0.8];
				};
	
				if (_distTP < 3 and _tag in civarray and _tag != player and alive _tag) then {
					titleRsc["Rtags", "PLAIN"];
					_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
					_control ctrlSetText "Search (E)";
				};
			};
		};
	};
	sleep 0.1;
};