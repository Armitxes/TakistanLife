_grp = group player;
switch (_this select 0) do {
	case "form": {
		//gangmember && leader _grp == player && count (units _grp) > 4
		if ( true ) then {
			if (isNil "sgov") then {
				Antwort = 2;
				_cost = 100000;
				if(PLAYERDATA select 9 == 2) then {_cost = 60000;};
				if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
				ctrlSetText [1, format ["Do you wish to form a south government for $%1?",_cost] ];
				ctrlSetText [2,"Nope"];
				ctrlSetText [3,"Do it!"];
				buttonSetAction [3, "Antwort=1; closeDialog 1603;"];
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
};