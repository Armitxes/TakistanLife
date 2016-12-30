_currentChief = -1;
_currentMayor = -1;

while {true} do {
	sleep 10;
	if (lastElection+35 <= (time/60)) then {
		lastElection = (time/60); publicVariable "lastElection";
		_msg = "";

		//PM
		_MaxStimmen = 0;
		_MaxPos = -1; 
		_WahlArray = server getVariable "PMVote";

		for [{_i=0}, {_i < count(_WahlArray)}, {_i=_i+1}] do {
			private["_player_variable_name", "_player_variable"];
			_player_variable_name = (playerstringarray select _i);
			_player_variable = missionNamespace getVariable [_player_variable_name, objNull];
			
			if ((count (_WahlArray select _i)) > _MaxStimmen) then {
				if !(isNil "_player_variable") then {
					if !(isNull _player_variable) then {
						_MaxStimmen = (count (_WahlArray select _i));
						_MaxPos = _i;
					};
				};
			};
		};

		if (_MaxPos == -1) then	{
			_msg = "No Prime Minister has been elected.";
			_currentMayor = -1;
		} else { 
			if (_currentMayor == _MaxPos) then {
				_msg = "The old Prime Minister stays.";
			} else {
				protesters = []; publicVariable "protesters";
				_currentMayor = _MaxPos;
				_MayorString  = (playerstringarray select _currentMayor);
				_msg = format ["%1 is now the new Prime Minister!",_MayorString];
			};
		};

		MayorNumber = _currentMayor;
		publicVariable "MayorNumber";

		// CC
		_MaxStimmen = 0;
		_MaxPos = -1;
		_WahlArrayc = server getVariable "CCVote";

		for [{_i=0}, {_i < count(_WahlArrayc)}, {_i=_i+1}] do {
			_player_variable_name = (playerstringarray select _i);
			_player_variable = missionNamespace getVariable [_player_variable_name, objNull];

			if ((count (_WahlArrayc select _i)) > _MaxStimmen) then {
				if !(isNil "_player_variable") then {
					if !(isNull _player_variable) then {
						_MaxStimmen = (count (_WahlArrayc select _i));
						_MaxPos = _i;
					};
				};
			};
		};

		if (_MaxPos == -1) then { _msg = format ["%1 No Chief Constable has been elected.",_msg]; _currentChief = -1; }
		else { 
			if (_currentChief == _MaxPos) then { _msg = format ["%1 The current Chief Constable stays.",_msg]; }
			else {
				_currentChief = _MaxPos;
				_chiefString  = (playerstringarray select _currentChief);
				_msg = format ["%1 %2 is now the Chief Constable!",_msg,_chiefString];
			}; 
		};

		chiefNumber = _currentChief;
		PUBLICVARIABLE "chiefNumber";
		(format["hint ""%1""; if ((rolenumber-1) == %2) then {isMayor = true;} else {isMayor = false;}; if ((rolenumber-1) == %3) then {ischief = true;} else {ischief = false;};",_msg,MayorNumber,chiefNumber]) call toClients;
	};
};