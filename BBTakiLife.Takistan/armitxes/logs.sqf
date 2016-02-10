/* Usage: ["add","crimes"] execVM "armitxes\logs.sqf"; */
_exe = _this select 0;
_log = 0;
_params = 0;

if (count _this > 1) then {
	_log = _this select 1;
	if (count _this > 2) then {
		_params = _this select 2;
	};
};

switch (_exe) do {
	case "wipe": {
		tempNotifyLog = [];
		logFinances = [];
		logPolice = [];
		logAdmin = [];
		logCrimes = [];
	};
	case "add": {
		if (typeName _log == "STRING" && typeName _params == "STRING") then {
			_doNotify = true;
			
			switch (_log) do {
				case "admin": { logAdmin = [_params] + logAdmin; };
				case "police": { logPolice = [_params] + logPolice; _doNotify=false; };
				case "finances": { logFinances = [_params] + logFinances; _doNotify=false; };
				case "crimes": {
					logCrimes = logCrimes + [_params];
					if (PLAYERDATA select 7 != 2) then {_doNotify=false;};
				};
			};
				
			if (_doNotify) then {
				tempNotifyLog = [_params] + tempNotifyLog;
				tempNotifyLog resize 3;

				_txt = "--------------<br /><br />";
				{
					if (!(isNil "_x")) then {
						_txt = _txt + _x + "<br /><br />--------------<br /><br />" ;
					};
				} forEach tempNotifyLog;

				hintSilent parseText _txt;
			};
		};
	};
	case "show": {
		_logArray = [];
		switch (_log) do {
			case "admin": { _logArray = logAdmin; };
			case "police": { _logArray = logPolice; };
			case "finances": { _logArray = logFinances; };
			case "crimes": { _logArray = logCrimes; };
		};
		
		if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
		disableSerialization;

		{ lbAdd [1,_x]; } forEach _logArray;
	};
};