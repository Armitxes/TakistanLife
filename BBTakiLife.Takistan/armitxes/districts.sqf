_action = _this select 0;

switch(_action) do {
	case "assignDistrict": {
		disableSerialization;
		_dsp = findDisplay 1606;
		_playerbox = (_dsp displayCtrl 2);
		_district = (_dsp displayCtrl 3);
		
		_curPlr = compile (_playerbox lbData (lbCurSel _playerbox));
		_curDis = lbCurSel _district;
		
		_curPlr setVariable ["district",_curDis,true];
	};
}