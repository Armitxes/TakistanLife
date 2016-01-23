_this = _this select 3;
_art  = _this select 0;

if(_art == "create") then {
	_text = _this select 1;
	_name = name player;
	_dollarz = 'dollarz' call INV_getitemamount;

	if (gangmember) exitWith {hintSilent "You are already in a gang!";};
	if (_text == "South Government") exitWith {hintSilent "Illegal name";};
	
	if ((_text call ISSE_str_Length) > 30 or (_text call ISSE_str_Length) < 3) exitWith {hintSilent "the entered text is either too long or too short";};
	if(_dollarz < 15000) exitWith {hintSilent "You need atleast 15k to found this gang."};
	['dollarz', -15000] call INV_addinventoryitem;

	_gangGroup = group player;
	_gangGroup selectLeader player;
	enableRadio false; 5 fadeRadio 0;
	gangsarray = gangsarray + [[_text,_gangGroup,true]];
	hintSilent format["you have created a new gang called %1!", _text];
	publicVariable "gangsarray";
	gangmember = true;
};

if(_art == "join") then {
	_id = _this select 1;
	_name = name player;
	_gangData = gangsarray select _id;
	
	if (_gangData select 2) then {
		if (gangmember) exitWith { hintSilent "You are already in a gang!"; };
		_oldGrp = group player;
		_gang = _gangData select 1;
		enableRadio false; 5 fadeRadio 0;
		[player] joinSilent _gang;
		gangmember = true;
		sleep 2;
		deleteGroup _oldGrp;
	} else { hintSilent "Group is locked." };
};

if(_art == "leave") then {
	_grp = createGroup civilian;
	[player] joinSilent _grp;
	gangmember = false;
};

if(_art == "kick") then {
	_civ = call compile format["%1", _this select 1];
	if(player == _civ)exitWith{hintSilent"You cannot kick yourself!"};
	_grp = createGroup civilian;
	[_civ] joinSilent _grp;
};

if(_art == "allowjoin") then {
	if(gangmember) then {
		_grp = group player;
		if (leader _grp == player) then {	
			_i = 0;
			{
				if(_x select 1 == _grp) exitWith {
					_open = _x select 2;
					_x set [2, !_open];
					gangsarray set [_i,_x];
				};
				_i = _i + 1;
			} forEach gangsarray;
		};
	};
};