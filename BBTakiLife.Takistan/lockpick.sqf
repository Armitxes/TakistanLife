_art = _this select 0;

if (_art == "use") then {
	_item   = _this select 1;
	_anzahl = _this select 2;
	_vcls    = nearestObjects [getPos player,["LandVehicle", "Air", "ship"],7];
	_closevcl     = _vcls select 0;

	if (!(isNull(_closevcl))) then {
		if (call fnc_isBusy) exitWith {};
		if (_closeVcl isKindOf "Air") exitWith {titleText ["You cannot lockpick this vehicle!", "PLAIN DOWN", 0.3];};
		if (_closeVcl in INV_VehicleArray) then {
			titleText [localize "STRS_inventar_lockpick_already", "PLAIN DOWN", 0.3];
		} else {
			_w = [8,"Lockpicking...","AinvPknlMstpSnonWrflDnon_medic","AinvPknlMstpSnonWrflDnon_medicEnd"] spawn fnc_timer;
			waitUntil { scriptDone _w; };

			if ((random 100) < 41) then {
				INV_VehicleArray = INV_VehicleArray + [_closeVcl];
				_closeVcl setVariable ["owners",(_closeVcl getVariable "owners")+[getPlayerUID player],true];
				titleText [localize "STRS_inventar_lockpick_success", "PLAIN DOWN", 0.3];
			} else { titleText [localize "STRS_inventar_lockpick_noluck", "PLAIN DOWN", 0.3]; };

			[_item, -1] call INV_AddInventoryItem;
		};
	} else { titleText [localize "STRS_inventar_lockpick_zuweit", "PLAIN DOWN", 0.3]; };
};