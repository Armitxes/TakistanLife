_action = _this select 0;
//["profession"] execVM "armitxes\dialogs\controller.sqf";
switch (_action) do {
	case "select": {
		disableSerialization;
		_display = findDisplay 1602;
		_listbox = (_display displayCtrl 1);
		_data = (call compile (_listbox lbData (lbCurSel 1)));
		closeDialog 1602;
		
		_cost = _data select 2;
		if (_cost < PLAYERDATA select 1) then {
			switch (_data select 0) do {
				case "Medic": {
					_medCount = 0;
					{ if((typeOf _x) in ["Dr_Hladik_EP1","USMC_LHD_Crew_Blue","Doctor"]) then { _medCount = _medCount + 1; }; } forEach playableUnits;
					if (isciv && _medCount < 4) then {
						[-_cost] call setMoney;
						["use","docUni"] execVM "armitxes\clothing.sqf";
					} else { server globalChat "There can't be more than 3 medics at once and you must be a civ. Try again later."; }; 
				};
				case "Judge": {
					_judCount = 0;
					{ if((typeOf _x) == "SchoolTeacher") then { _judCount = _judCount + 1; }; } forEach playableUnits;
					if (isciv && _judCount < 4) then {
						[-_cost] call setMoney;
						["use","civUni9"] execVM "armitxes\clothing.sqf";
						isjudge = true;
					} else { server globalChat "There can't be more than 1 judge and you must be a civ. Try again later."; }; 
				};
			}
		} else { hintSilent "You don't have enough money on your bank account to accept this profession"; }
	};
};