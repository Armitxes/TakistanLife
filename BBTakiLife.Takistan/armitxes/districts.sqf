_action = _this select 0;

switch(_action) do {
	case "assignDistrict": {
		disableSerialization;
		_dsp = findDisplay 1606;
		_playerbox = (_dsp displayCtrl 2);
		_district = (_dsp displayCtrl 3);
		
		_curPlr = compile (_playerbox lbData (lbCurSel _playerbox));
		_curDis = districs select (lbCurSel _district);
		
		_curPlr setVariable ["district",_curDis,true];
		(format ['if(player == %1) then { server globalChat "You were assigned to the district %2. Not being in the assigned district unless in a emergency will reduce your paycheck."; };',_curPlr,_curDis]) call toClients;
	};
}