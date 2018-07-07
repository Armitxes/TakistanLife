/* IMPORTED FROM ArmiLife Alpha 0.1 */

_do = _this select 0;

switch (_do) do {
	case "switch": {
		_vcl = vehicle player;

		if (isun || iscop || ismedic) then {
			_isOn = _vcl getVariable "siren"; if (isNil "_isOn") then { _isOn = false };

			if(!_isOn) then {
				if (time > blockSiren) then {
					_sDur = 4.87;
					_sName = "";

					if (ismedic) then { _sName = "Siren_EMS"; };
					if (iscop) then { _sName = "Siren_Cop"; };
					if (isun) then { _sName = "Siren_UN"; _sDur = 0.7; };

					(format ['["sync",%1,"%2",%3] execVM "armitxes\events\onSiren.sqf";', _vcl, _sName, _sDur]) call toClients;
					titleText ["Siren on", "PLAIN DOWN"];
				};
			} else {
				_vcl setVariable ["siren",false,true];
				titleText ["Siren off", "PLAIN DOWN"];
				blockSiren = time + 5.4;
			};
		};
	};
	case "sync": {
		_vcl = _this select 1;

		_vcl setVariable ["siren",true];
		[_vcl, _this select 2, _this select 3] spawn {
			_vcl = _this select 0; _sName = _this select 1; _sDur = _this select 2;
			while { _vcl getVariable "siren" && alive _vcl} do {
				if (speed _vcl > 2) then {
					if (speed _vcl > 50) then { _vcl say [_sName, 1]; sleep _sDur; };
					if (speed _vcl <= 50) then { _vcl say ["Siren_Short", 1]; sleep 0.72; };
				};
			};
		};
	};
};
