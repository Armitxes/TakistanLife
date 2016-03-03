_action = _this select 0;
switch (_action) do  {
	case "add": {
		if(isjudge && PLAYERDATA select 2 > 0) then {
			disableSerialization;
			_dsp = findDisplay 20;
			_txt = ctrlText (_dsp displayCtrl 200);
			_txtArr = toArray _txt;
			_length = count(_txtArr);
			if (_length > 14 && _length < 97 && !(34 in _txtArr) && !(39 in _txtArr)) then {
				_unhc = objNull;
				_lstRnk = 0;
				{
					if(typeOf _x in untypes) then {
						_plrData = _x getVariable "pubPlrData";
						_rnk = _plrData select 1;
						if(_plrData select 0 == 2 && _rnk > 2 && _rnk > _lstRnk) then {
							_unhc = _x; _lstRnk = _rnk;
						};
					};
				} forEach playableUnits;
				if (!(isNull _unhc)) then {
					if(isPlayer _unhc && alive _unhc) then {
						(format ['if(player == %3) then {["confirm","%1","%2"] execVM "armitxes\basiclaw.sqf"};',_txt,name player,_unhc]) call toClients;
					};
				} else {server globalChat "There is no High Command member of the UN available.";}
			} else {server globalChat "The length of a new paragraph must be between 15 and 97 chars. Quotation chars are not allowed.";};
		} else {server globalChat "Only judges with BB Membership may suggest new paragraphs for the constitution.";};
	};
	case "confirm": {
		constLawAccepted = false;
		if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
		ctrlSetText [1,format ["IMPORTANT! Judge %1 requests a new constitution paragraph!\nONLY PASS IT IF YOU ARE VERY SURE OF IT!\nNew Paragraph Content:\n'%2'",_this select 2,_this select 1] ];
		ctrlSetText [2,"DENY"];
		ctrlSetText [3,"PASS LAW"];
		buttonSetAction [3, "constLawAccepted=true;closeDialog 1603;"];
		waitUntil {isNull ((findDisplay 3000) displayCtrl 3)};
		if(constLawAccepted) then {
			constitution = constitution + [_this select 1]; publicVariable "constitution";
		} else { ('server globalChat "The United Nations denied a new constitution paragraph";') call toClients; };
	};
};