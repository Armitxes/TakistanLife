_action = _this select 0;
switch (_action) do {
	case "profession": {
		createDialog "professions";
		disableSerialization;
		_display = findDisplay 1602;
		{
			_listbox = (_display displayCtrl 1);
			_entry = _listbox lbAdd (_x select 0);
			_listbox lbSetData [_entry,str(_x)];
			_listbox ctrlAddEventHandler ["LBSelChanged","call fnc_prof_setDescr;"];
		} forEach profs;
	};
};