_art = _this select 0;
if (_art == "clientloop") then {
	_dblimit = 15000000;
	inAirVehicle = false;
	
	while {true} do {
		_vcl = vehicle player;
		_dollarz = 'dollarz' call INV_GetItemAmount;
		_nextspike = getPos player nearestObject "Fort_RazorWire";
		if((_vcl distance _nextspike) < 5 && _vcl != player) then { ["spikes"] execVM "armitxes\vehtools.sqf"; };
		sleep 0.5;
		{if ( (parseNumber _x) + 360 <= time ) then { deleteMarkerLocal _x; };} forEach emMarkers;
		{
			if ((rating _x) < 0) then {_x addRating (abs (rating _x))};
			if ((score _x) < 0)  then {_x addScore  (abs (score _x))};
        } forEach playerarray;
		
		if (isciv) then {
			if (!inAirVehicle && _vcl isKindOf "air" && !ismedic) then { inAirVehicle = true; [] execVM "armitxes\loops\airloop.sqf"; };
			if (!ismedic && driver _vcl == player && (typeOf _vcl) in ["GAZ_Vodnik_MedEvac","HMMWV_Ambulance","S1203_ambulance_EP1"]) then { player action ["EJECT",_vcl]; _vcl lock true; hintSilent "Nope, I'm not a medic"; };
			{if ((player distance (_x select 0)) < (_x select 1)) then {timeinworkplace = timeinworkplace + 1;};} forEach workplacearray;
		} else {
			if (dragging) then {
				if ( (player distance [5967.74,7490.84,0.000900269]) < 2.5 ) then { a = execVM "arrest.sqf"; };
			};
		};
		
		if (_dollarz < 0) then {['dollarz', 0] call INV_SetItemAmount; _dollarz = 0;};
		if ((PLAYERDATA select 1) > _dblimit) then { PLAYERDATA set [1,_dblimit]; hint format["You are not allowed to have more than $%1! Money has been removed",_dblimit]; };
	};
};