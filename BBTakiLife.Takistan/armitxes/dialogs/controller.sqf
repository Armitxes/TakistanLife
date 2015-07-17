_action = _this select 0;
if(typeName _action != "STRING") then {_action=_this select 3;};

_initPlayerInteraction = {
	private ["_playerbox","_entry"];
	disableSerialization;
	_dsp = findDisplay 1606;
	(_dsp displayCtrl 0) ctrlSetText (_this select 0);
	_playerbox = (_dsp displayCtrl 2);
	
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
			};} forEach playableUnits;
		};
		case "police": {
			{if(alive _x && (typeOf _x) in coptypes) then {
				_entry = _playerbox lbAdd (name _x);
				_playerbox lbSetData [_entry,str(_x)];
			};} forEach playableUnits;
		};
		case "un": {
			{if(alive _x && (typeOf _x) in untypes) then {
				_entry = _playerbox lbAdd (name _x);
				_playerbox lbSetData [_entry,str(_x)];
			};} forEach playableUnits;
		};
		case "civilian": {
			{if(alive _x && !((typeOf _x) in coptypes) && !((typeOf _x) in untypes)) then {
				_entry = _playerbox lbAdd (name _x);
				_playerbox lbSetData [_entry,str(_x)];
			};} forEach playableUnits;
		};
	};
};

switch (_action) do {
	case "nation": {
		while {PLAYERDATA select 9 == 0} do {
			if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
			ctrlSetText [1,"Please choose the nation you want to join.\nYou can select between North & South.\nChoose wisely! This decision is permanent."];
			ctrlSetText [2,"North"];
			buttonSetAction [2, "PLAYERDATA set [9,1];closeDialog 1603;"];
			ctrlSetText [3,"South"];
			buttonSetAction [3, "PLAYERDATA set [9,2];closeDialog 1603;"];
			waitUntil {!dialog};
		};
		_newNat = PLAYERDATA select 9;
		nation = format ["%1,%2",PLAYERDATA select 0,_newNat];
		publicVariableServer "nation";
		player setVariable ["pubPlrData",[PLAYERDATA select 4, PLAYERDATA select 5,_newNat],true];
		if(isciv && _newNat == 2) then {player setPos (getMarkerPos "respawn_civilian2");};
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
	case "idcard": {
		if (!(createDialog "ArmiID")) exitWith {hint "Dialog Error!"};
		_target = _this select 1; _data = _target getVariable "pubPlrData";
		_licenses = _this select 2;
		_faction = [_data select 0,_data select 1] call getFactionRank;
		disableSerialization;
		_display = findDisplay 1601;
		(_display displayCtrl 10) ctrlSetText format ["Name: %1",name _target];
		(_display displayCtrl 11) ctrlSetText format ["Faction: %1",_faction select 0];
		(_display displayCtrl 12) ctrlSetText format ["Rank: %1",_faction select 1];
		_nation = "North"; if((_data select 2) == 2) then { _nation = "South"; };
		(_display displayCtrl 13) ctrlSetText format ["Citizen of the %1",_nation];
		(_display displayCtrl 14) ctrlSetText format ["%1",getPlayerUID _target];
		lbAdd [1, "~ LICENSE LIST ~"];
		private "_i";
		for [{_i=0}, {_i < (count _licenses)}, {_i=_i+1}] do 
		{
			_lizenz = (_licenses select _i);
			lbAdd [1, format ["%1", (_lizenz call INV_GetLicenseName)]];
		};
	};
	case "sergeant": {
		createDialog "sergeantmenu";
		["Police Officers","police"] call _initPlayerInteraction;
		disableSerialization;
		_dsp = findDisplay 1606;
		_listPlr = (_dsp displayCtrl 2);
		_listbox = (_dsp displayCtrl 11);
		{_listbox lbAdd _x;} forEach districts;
		_listPlr ctrlAddEventHandler ["LBSelChanged","[""setDescr""] execVM ""armitxes\districts.sqf"";"];
	};
};