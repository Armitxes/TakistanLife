// Only executed while player is in an air vehicle

_veh = vehicle player;
if (_veh isKindOf "air") then {
	_firstPosY = 0;
	_lastPosY = 0;
	_midPosY = 0;
	_closestAA = unoAA;
	_aaGrp = (group _closestAA);
	_airWarnings = _veh getVariable "airWarnings";
	if (isNil "_airWarnings") then { air_warning_time = -1800; _veh setVariable ["airWarnings",[0,-600],true]; _airWarnings = [0,-600]; };
	_perms = "Denied"; if ( (_airWarnings select 1)+600 > time ) then { _perms = "Granted"; };
	titleText [format ["Flight Warnings: %1/3 - Flight Permission: %2",_airWarnings select 0,_perms], "PLAIN DOWN", 0.4];

	while { (driver _veh) == player && alive _veh } do {
		_aas = nearestObjects [getPosATL _veh,["Stinger_Pod"],1000];
		if (count _aas > 0) then {
			_closestAA = _aas select 0;
			_midPosY = (getPosATL _closestAA) select 1;
			_lastPosY = (getPosATL _veh) select 1;
			if (_firstPosY == 0 && lastAirWarning+300 <= time) then {
				_firstPosY = _lastPosY;
				hint parseText "<t color='#FFA500' size='1.5'>WARNING</t><br /><br />You are approaching the borderline! Please land at a UN Checkpoint if you wish to cross.";
			};

			sleep 3;
			if(speed _veh < 30) then {
				if(_veh distance prisonDoor < 30) then {
					hintSilent parseText "<t color='#FFA500' size='1.5'>PRISON WARNING</t><br /><br />Prison defences detected you! Don't take any prisoners with you or you'll be engaged!";
					_oldCrew = count (units _veh);
					waitUntil {!(alive player) || (_veh distance prisonDoor) >= 150 || !(alive _veh) };
					if (count (units _veh) > _oldCrew) then {
						_airWarnings set [0,3];
						_veh setVariable ["airWarnings",_airWarnings,true];
						if (air_warning_time+1800 < time) then { air_warning_time = time; (format["server globalChat ""Air control authorized the air vehicle of %1 to be shot down. Reason: Prison Break"";",(name player)]) call toClients; };
						hintSilent parseText "<t color='#FF0000' size='1.5'>URGENT WARNING</t><br /><br />Prison Break! All defense systems are now locked on you. Better get the hell out of here!";
					};
				};
			};

			_airWarnings = _veh getVariable "airWarnings";
			if(_airWarnings select 0 > 2) then {
				hintSilent parseText "<t color='#FF0000' size='1.5'>URGENT WARNING</t><br /><br />You either repeatedly illegally crossed the border or commited a prison break!<br /><br />Air Defences will be engaging you.";
				if (air_warning_time+1800 < time) then { air_warning_time = time; (format["server globalChat ""Air control authorized the air vehicle of %1 to be shot down. Reason: Repeated illegal border crossing."";",(name player)]) call toClients; };
			};
		};

		if (lastAirWarning+400 <= time) then {
			if ( (_firstPosY > _midPosY && (_lastPosY+400) < _midPosY) || (_firstPosY < _midPosY && (_lastPosY-400) > _midPosY) ) then {
				_b1 = nearestObjects [passseller,untypes,100]; _b2 = nearestObjects [passseller3,untypes,100];
				if (count _b1 > 0 || count _b2 > 0) then {
					if(_airWarnings select 0 < 4 && (_airWarnings select 1)+600 < time) then {
						_airWarnings set [0, (_airWarnings select 0)+1]; lastAirWarning = time; _firstPosY = 0; _lastPosY = 0; _midPosY = 0;
						_veh setVariable ["airWarnings",_airWarnings,true];
						if(_airWarnings select 0 < 3) then {
							hint parseText format ["<t color='#FF0000' size='1.5'>WARNING</t><br /><br />You illegally crossed the border! You may be shot down if you fail to land too often.<br /><br />Warning: %1/3",_airWarnings select 0];
						};
					};
				} else { hintSilent "You illegally crossed the border - no penalty is given as there is no UN manning the border."; };
			};
		};
		sleep 2;
	};

	sleep 2; // For the case they changed seats
	if ((vehicle player) isKindOf "air") then { 0 execVM "armitxes\loops\airloop.sqf"; } else { inAirVehicle = false; };
};
