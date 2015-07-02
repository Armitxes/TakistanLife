_action = _this select 0;
if(typeName _action != "STRING") then {_action=_this select 3;};

_initPlayerInteraction = {
	private ["_playerbox","_entry"];
	(_dsp displayCtrl 1) ctrlSetText (_this select 0);
	_playerbox = (_dsp displayCtrl 2);

	disableSerialisatzion;
	_dsp = findDisplay 1606;
	switch(_this select 1) do {
		case "all": {
			_entry = _playerbox lbAdd "all";
			_playerbox lbSetData [_entry,"all"];
			{if(alive _x) then {
				_entry = _playerbox lbAdd (name _x);
				_playerbox lbSetData [_entry,str(_x)];
			}} forEach playableUnits;
		};
		case "allplayers": {
			{if(alive _x) then {
				_entry = _playerbox lbAdd (name _x);
				_playerbox lbSetData [_entry,str(_x)];
			}} forEach playableUnits;
		};
		case "police": {
			{if(alive _x && (side _x) == west) then {
				_entry = _playerbox lbAdd (name _x);
				_playerbox lbSetData [_entry,str(_x)];
			}} forEach playableUnits;
		};
		case "un": {
			{if(alive _x && (side _x) == resistance) then {
				_entry = _playerbox lbAdd (name _x);
				_playerbox lbSetData [_entry,str(_x)];
			}} forEach playableUnits;
		};
		case "civilian": {
			{if(alive _x && (side _x) == civilian) then {
				_entry = _playerbox lbAdd (name _x);
				_playerbox lbSetData [_entry,str(_x)];
			}} forEach playableUnits;
		};
	};
};

switch (_action) do {
	case "sergeant": {
		createDialog "sergeantmenu";
		["police"] call _initPlayerInteraction;
		_listbox = (_dsp displayCtrl 3);
		{_listbox lbAdd _x;} forEach districs;
	};
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