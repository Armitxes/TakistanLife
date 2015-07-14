_action = _this select 0;

switch(_action) do {
	case "assignDistrict": {
		disableSerialization;
		_dsp = findDisplay 1606;
		_playerbox = (_dsp displayCtrl 2);
		_district = lbCurSel (_dsp displayCtrl 11);
		
		_curPlr = compile (_playerbox lbData (lbCurSel _playerbox));
		_curDis = districts select (_district);
		
		_plrData = _curPlr getVariable "pubPlrData";
		_plrData set [3, _district];
		(format ['%1 setVariable ["pubPlrData",%3]; if(player == %1) then { server globalChat "You were assigned to the district %2. Not being in the assigned district unless in a emergency will reduce your paycheck."; };',_curPlr,_curDis,_plrData]) call broadcast;
	};
}