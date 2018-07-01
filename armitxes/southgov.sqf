_grp = group player;
_doAction = _this select 0;

if(typeName _doAction != "STRING") then {
	if(typeName (_this select 3) == "ARRAY") then {
		_doAction=(_this select 3) select 0;
	} else {_doAction=_this select 3;};
};

switch (_doAction) do {
	case "form": {
		if ( gangmember && leader _grp == player && count (units _grp) > 4 ) then {
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
		if (isNil "warStartTime") then {
			if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};

			ctrlSetText [1, "Do you really wish to declare war? DO NOT LEAVE THE GAME AND DO NOT CHANGE SLOTS!"];
			waitUntil {isNull ((findDisplay 3000) displayCtrl 3)};

			if(Antwort == 1) then {
				warStartTime = time+1800;
				(format ["[""warPrep"",%1,%2] execVM ""armitxes\southgov.sqf"";",ismayor,warStartTime]) call toClients;
				_boxInit = "clearWeaponCargo this; clearMagazineCargo this;
				this addWeaponCargo ['M4A1_AIM_CAMO',50]; this addWeaponCargo ['SCAR_H_CQC_CCO',50]; this addWeaponCargo ['SCAR_H_LNG_Sniper',3];
				this addMagazineCargo ['30Rnd_556x45_Stanag',6000]; this addMagazineCargo ['20Rnd_762x51_B_SCAR',6000]; 
				this addMagazineCargo ['HandGrenade',50]; this addMagazineCargo ['Mine',50];";

				if(isNil "warBoxA" && isNil "warBoxB") then {
					warBoxA = "LocalBasicAmmunitionBox" createVehicle [0,0,0];
					warBoxB = "LocalBasicAmmunitionBox" createVehicle [0,0,0];
				};

				warBoxA setVehicleInit _boxInit;
				warBoxB setVehicleInit _boxInit;
				processInitCommands;
				warBoxA setPos [5725.42,9957.93,0];
				warBoxB setPos [2606.02,5112.34,0];

				waitUntil { (time >= warStartTime) };
				(format ["[""warStart"",%1] execVM ""armitxes\southgov.sqf"";",warStartTime]) call toClients;
				sleep 3; deleteVehicle warBoxA; deleteVehicle warBoxB;
			};
		} else { hintSilent "There's already a war in place!"; };
	};
	case "warPrep": {
		if (!(isNil "sgov")) then {
			_declarer = "south"; _declared = "north"; if(_this select 1) then { _declarer = "north"; _declared = "south"; };
			player say "bank_alarm"; warStartTime = _this select 2;
			hintSilent "War will start in 30 minutes! Head to your government complex to participate or follow UN instructions.";
			if (isciv && group player != sgov) then {
				Antwort = 2;
				if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
				ctrlSetText [1, format ["The %1 declared war against the %2! 30 minutes prepartion time is given. If you wish to defend your support, move to your gov complex for equipment. DO YOU WISH TO SUPPORT YOUR COUNTRY?",_declarer,_declared] ];
				waitUntil {isNull ((findDisplay 3000) displayCtrl 3)};

				if(Antwort == 1) then {
					if(PLAYERDATA select 9 == 2) then { ["use","SouthUni1"] execVM "armitxes\clothing.sqf"; } else { ["use","northWar"] execVM "armitxes\clothing.sqf"; };
					sleep 4;
					warStarted = true;
				} else { hintSilent "You decided to stay out of the war. You may seek UNs protection you go your own way (on your own risk)"; };		
			};
		};
	};
	case "warStart": {
		player say "bank_alarm";
		hintSilent "The war has begun - fights have started! Protect your Government Complex while capturing the enemy one.";
		warStartTime = _this select 1;
	};
	case "warCap": {
		if (!(isNil "warStartTime")) then {
			if (warStartTime+30 < time) then {
				_side = "";
				_plrNation = PLAYERDATA select 9;
				if ( (player distance southGov) < 60 && _plrNation == 1 ) then { _side = "south"; };
				if ( (player distance northGov) < 60 && ( _plrNation == 2 || player in (units sgov) ) ) then { _side = "north"; };

				if (_side != "") then {
					capSuccessTime = time + 600;
					(format ['player say "bank_alarm"; hintSilent "Someone is capturing the %2 government complex!";',_side]) call toClients;
					sleep 1;
					hintSilent "Stay alive inside the base for 10 Minutes within 100 Meters to win the war!";
					while { alive player && ((player distance southGov) < 100 || (player distance northGov) < 100) && (time < capSuccessTime) } do {
						_txt = format ["Time until succesful capture: %1",round(capSuccessTime-time)];
						titleText [_txt, "PLAIN DOWN", 0.1];
						sleep 1;
					};
					if (alive player && time >= capSuccessTime) then {
						(format ['hint parseText "<img image=""images\codepad\led_red.paa"" size=""10"" /><br /><t color=""#FF0000"" size=""1.5"">WAR IS OVER!</t><br /><br />The %1 has lost its territory and must surrender!"; warStartTime=nil; warStarted=false;',_side]) call toClients;
					};
				} else { hintSilent "You can't capture your own base."; };
			} else {hintSilent "It's too soon to cap this base.";};
		} else {hintSilent "There is no war declared.";};
	};
};