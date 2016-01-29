_action = _this select 0;
if(typeName _action != "STRING") then {_action=_this select 3;};

switch(_action) do {
	case "assignDistrict": {
		disableSerialization;
		_dsp = findDisplay 1606;
		_playerbox = (_dsp displayCtrl 2);
		_district = lbCurSel (_dsp displayCtrl 11);
		
		_curPlr = call compile (_playerbox lbData (lbCurSel _playerbox));
		_curDis = districts select _district;

		_plrData = _curPlr getVariable "pubPlrData";
		_plrData set [3, _district];
		(format ['%1 setVariable ["pubPlrData",%3]; if(player == %1) then { ["assignedDistrict","%4"] execVM "armitxes\districts.sqf"; };',_curPlr,_curDis,_plrData,name player]) call broadcast;
		closeDialog 1606;
	};
	case "setDescr": {
		disableSerialization;
		_display = findDisplay 1606;
		_listbox = (_display displayCtrl 2);
		_plr = (call compile (_listbox lbData (lbCurSel _listbox)));
		_data = _plr getVariable "pubPlrData";
		_curDuty = districts select (_data select 3);
		_faction = [_data select 0,_data select 1] call getFactionRank;
		(_display displayCtrl 12) ctrlSetText (format ["Name: %1\nFaction: %2\nRank: %3\nAssigned: %4",name _plr,_faction select 0,_faction select 1,_curDuty]);
	};
	case "assignedDistrict": {
		sleep 3;
		iscop = true;
		_data = player getVariable "pubPlrData";
		_curDuty = districts select (_data select 3);
		server globalChat format["You were assigned to %1 by %2. Disobeying can reduce your paycheck.",_curDuty,_this select 1];
		if ((_data select 3) == 7) then {
			iscop = false; isciv = true;
			server globalChat "You were suspended from duty! If this doesn't change within the next 5 minutes, you will be kicked from your copslot.";
			sleep 300;
			_data = player getVariable "pubPlrData";
			if ((_data select 3) == 7) then { ["save"] execVM "armitxes\_db.sqf"; endMission "loser"; } else {isciv = false; iscop=true;};
		};
	};
	case "offduty": {
		_pub = player getVariable "pubPlrData";
		_duty = _pub select 3;
		if(!(_duty == 7)) then {
			if(_duty == 6) then {
				_pub set [3,0];
				player setVariable ["pubPlrData",_pub,true]; sleep 4; server globalChat "you are now on duty";
			} else {
				if(onduty+600 < time) then {
					onduty = time; _pub set [3,6];
					player setVariable ["pubPlrData",_pub,true]; sleep 4; server globalChat "you are now off duty";
				} else { server globalChat "You must be on duty for atleast 10 minutes." };
			};	
		};
	};
};