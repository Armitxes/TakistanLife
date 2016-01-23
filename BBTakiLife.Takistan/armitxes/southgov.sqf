_grp = group player;

_doAction = _this select 0;

if(typeName _doAction != "STRING") then {
	if(typeName (_this select 3) == "ARRAY") then {
		_doAction=(_this select 3) select 0;
	} else {_doAction=_this select 3;};
};

switch (_doAction) do {
	case "form": {
		//gangmember && leader _grp == player && count (units _grp) > 4
		if ( true ) then {
			if (isNil "sgov") then {
				_cost = 100000;
				if(PLAYERDATA select 9 == 2) then {_cost = 60000;};
				Antwort = 2;
				if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
				ctrlSetText [1, format ["Do you wish to form a south government for $%1?",_cost] ];
				waitUntil {isNull ((findDisplay 3000) displayCtrl 3)};

				if(Antwort == 1) then {
					if (PLAYERDATA select 1 >= _cost) then {
						[-_cost] call setMoney;
						sgov = group player;
						publicVariable "sgov";
					} else { hintSilent "Not enough money!"; };
				};
			} else { hintSilent "South Government already in place."; };
		} else { hintSilent "You need to be the leader of a gang with atleast 5 members to form a south government!"; };
	};
	case "laws": {
		if (!(createDialog "gesetzdialog")) exitWith {hint "Dialog Error!";};
		{
			_index = lbAdd [1, _x];
			lbSetData [1, _index, _x];
		} forEach (GesetzArray select 1);
		while {ctrlVisible 1020} do {
			_selected = lbCurSel 1;
			ctrlSetText [2, lbText [1, _selected]];
			waitUntil {((!(_selected == lbCurSel 1)) or (!(ctrlVisible 1020)))};
		};	
	};
	case "declare": {
		Antwort = 2;
		if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};

		ctrlSetText [1, "Do you really wish to declare war?"];
		waitUntil {isNull ((findDisplay 3000) displayCtrl 3)};

		if(Antwort == 1) then {
			warStartTime = time+600;
			("[""war"",ismayor,warStartTime] execVM ""armitxes\southgov.sqf"";") call toClients;
		};		
	};
	case "war": {
		if (!(isNil "sgov")) then {
			_declarer = "south"; _declared = "north"; if(_this select 1) then { _declarer = "north"; _declared = "south"; };
			player say "bank_alarm"; warStartTime = _this select 2;
			if (isciv) then {
				Antwort = 2;
				if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
				ctrlSetText [1, format ["The %1 declared war against the %2! 10 minutes prepartion time is given. If you wish to defend your support, move to your gov complex for equipment. DO YOU WISH TO SUPPORT YOUR COUNTRY?",_declarer,_declared] ];
				waitUntil {isNull ((findDisplay 3000) displayCtrl 3)};

				if(Antwort == 1) then {
				} else { hintSilent "You decided to stay out of the war. You may seek UNs protection you go your own way (on your own risk)"; };		
			};
		};
	};
};