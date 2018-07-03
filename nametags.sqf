private ["_control2","_car","_faceTP", "_tag", "_vcls", "_stn", "_distTP", "_distCP", "_distSP"];

disableSerialization;

while {true} do {
	_dirV = vectorDir vehicle player;

	if (vehicle player == player) then {
		_tar = cursorTarget;
		if !(isNil "_tar") then {
			if (alive _tar && _tar isKindOf "Air") then {
				_airWarnings = _tar getVariable "airWarnings";

				if !(isNil "_airWarnings") then {
					if (_airWarnings select 0 > 2) then {
						titleRsc["Rtags", "PLAIN"];
						_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
						_control ctrlSetTextColor [1, 0, 0, 1];
						_control ctrlSetText "!- ORDER FOR FORCED TAKEDOWN -!";
					};
				};
			};
		};

		_objs = nearestObjects [position player,["Man", "Infostand_1_EP1", "Infostand_2_EP1", "RUBasicAmmunitionBox","UNBasicAmmunitionBox_EP1"],4] - [player];
		_vcls = nearestobjects [position player,["LandVehicle", "Air", "ship", "LocalBasicWeaponsBox"], 3];
		_atms = nearestObjects [position player,["Infostand_1_EP1", "Misc_cargo_cont_tiny"],4];

		if(count _vcls > 0 and INV_shortcuts) then {
			_car = _vcls select 0;
			_distCP = (_car distance player);

			if(typeof _car != "LocalBasicWeaponsBox" and !(isnull _car) and alive _car and vehicle player == player and _distCP < 3) then {
				titleRsc["Rtags", "PLAIN"];
				_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
				if (locked _car) then { _control ctrlSetText "Unlock (L)"; }
				else { _control ctrlSetText "Enter (E) | Trunk (T) | Lock (L)"; };
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
			_distTP = _tag distance player;

			if(_tag in shopusearray and _distTP < 3) then {
				_text = (_tag call INV_getshopArray) select 1;
				titleRsc["Rtags", "PLAIN"];
				_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
				if((iscop || isun) and _tag in drugsellarray)exitWith{_control ctrlSetText "Drug Search (E)";_control ctrlSetTextColor [0, 0, 1, 0.8];};
				_control ctrlSetText format["%1 (E)", _text];
				_control ctrlSetTextColor [1, 1, 1, 0.8];
			};

			if (_tag != player and _tag in playerarray and alive _tag) then {
				cutRsc["Rtags", "PLAIN"];
				_control2 = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64437;
				_control2 ctrlSetText format ["%1 (%2)", _tag, (name _tag)];
				_control2 ctrlSetFontHeight (0.04 - (_i*0.001));
			};

			if (_distTP < 3 and _tag in civarray and _tag != player and alive _tag) then {
				titleRsc["Rtags", "PLAIN"];
				_control = (uiNamespace getVariable 'TAGS_HUD') displayCtrl 64438;
				_control ctrlSetText "Search (E)";
			};
		};
	};
	sleep 0.1;
};
