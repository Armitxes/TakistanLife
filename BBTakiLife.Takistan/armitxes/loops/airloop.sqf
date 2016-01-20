// Only executed while player is in an air vehicle

_veh = vehicle player;
if (_veh isKindOf "air") then {
	_firstPosY = 0;
	_lastPosY = 0;
	_midPosY = 0;
	_closestAA = unoAA;
	_aaGrp = (group _closestAA);
	_airWarnings = _veh getVariable "airWarnings";
	if (isNil "_airWarnings") then { _veh setVariable ["airWarnings",[0,-600],true]; _airWarnings = [0,0]; };
	
	titleText [format ["Flight Warnings: %1/3",_airWarnings select 0], "PLAIN DOWN", 0.1];
	
	while { (driver _veh) == player && alive _veh } do {
		_aas = nearestObjects [getPosATL _veh,["Stinger_Pod"],1000];
		if (count _aas > 0) then {
			_closestAA = _aas select 0;
			_midPosY = (getPosATL _closestAA) select 1;
			_lastPosY = (getPosATL _veh) select 1;
			if (_firstPosY == 0 && lastAirWarning+400 <= time) then {
				_firstPosY = _lastPosY;
				hint parseText "<t color='#FFA500' size='1.5'>WARNING</t><br /><br />You are approaching the borderline! Please land at a UN Checkpoint if you wish to cross.";
			};

			_closestAA reveal _veh;
			_closestAA doWatch _veh;
			
			sleep 3;
			
			_airWarnings = _veh getVariable "airWarnings";
			if(_airWarnings select 0 > 2) then {
				_aimTime = time + 25;
				hintSilent parseText "<t color='#FF0000' size='1.5'>URGENT WARNING</t><br /><br />You repeatedly illegally crossed the border!<br /><br />Border Defences will be engaging you.";
				_closestAA addMagazine "2Rnd_Stinger";
				waitUntil {_closestAA aimedAtTarget [_veh] > 0 || time > _aimTime};
				_airWarnings = _veh getVariable "airWarnings";
				if (_closestAA aimedAtTarget [_veh] > 0 && (_airWarnings select 0) > 0) then { _closestAA fireAtTarget [_veh]; };
			};
		};

		if (lastAirWarning+600 <= time) then {
			if ( (_firstPosY > _midPosY && (_lastPosY+400) < _midPosY) || (_firstPosY < _midPosY && (_lastPosY-400) > _midPosY) ) then {
				_airWarnings set [0, (_airWarnings select 0)+1]; lastAirWarning = time; _firstPosY = 0; _lastPosY = 0; _midPosY = 0;
				_veh setVariable ["airWarnings",_airWarnings,true];
				if(_airWarnings select 0 < 3 && (_airWarnings select 1)+600 < time) then {
					hint parseText format ["<t color='#FF0000' size='1.5'>WARNING</t><br /><br />You illegally crossed the border! You may be shot down if you fail to land too often.<br /><br />Warning: %1/3",_airWarnings select 0];
				};
			};
		};
		sleep 2;
	};
	
	sleep 2; // For the case they changed seats
	if ((vehicle player) isKindOf "air") then { 0 execVM "armitxes\loops\airloop.sqf"; } else { inAirVehicle = false; };
};