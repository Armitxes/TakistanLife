_this = _this select 3;
_art  = _this select 0;
_dollarz = 'dollarz' call INV_GetItemAmount;

if (_art == "ClientWahl") then
{
  if (isNil("WahlSperre")) then {WahlSperre = false;};
  
  if (WahlSperre) exitWith {hintSilent "You just voted.";};
  _spielernum = call compile (_this select 1);
  _waehlernum = (rolenumber-1);
  _WahlArray = server getVariable "PMVote";
  
  for [{_i=0}, {_i < count(_WahlArray)}, {_i=_i+1}] do
  {
  	_arr = (_WahlArray select _i);
  	if (_waehlernum in _arr) exitWith {_arr = _arr - [_waehlernum];_WahlArray SET [_i, _arr];};
	};

  _WahlArray SET [_spielernum, ((_WahlArray select _spielernum)+ [_waehlernum])];
  
  server setVariable ["PMVote",_WahlArray,true];
  hintSilent format[localize "STRS_regierung_votedfor",(playerstringarray select _spielernum)];
  
  WahlSperre = true;
  sleep 30;
  WahlSperre = false;
};

if (_art == "clientgesetz") then {
	_nummer = _this select 1;
	_text   = _this select 2;
	if (_nummer == -1) exitWith {};
	if ((_text call ISSE_str_Length) > 60) exitWith {hintSilent localize "STRS_text_zu_lang";};

	if (isMayor) then {
		if (_nummer <= 4) exitWith {hintSilent "You cannot change this law";};
		_temp = GesetzArray select 0;
		_temp set [_nummer,_text];
		GesetzArray set [0,_temp];
		publicVariable "GesetzArray";
	} else {
		if(!(isNil "sgov")) then {
			if (sgov == group player) then {
				_temp = GesetzArray select 1;
				_temp set [_nummer,_text];
				GesetzArray set [1,_temp];
				publicVariable "GesetzArray";
			};
		};
	};
};

if (_art == "steuernMayor") then {
	_item = _this select 1;
	_mag  = _this select 2;
	_weap = _this select 3;
	_vcl  = _this select 4;
	_bank = _this select 5;
	format ["
	(INV_ItemTypenArray select 0) SET [2, %1];
	(INV_ItemTypenArray select 1) SET [2, %2];
	(INV_ItemTypenArray select 2) SET [2, %3];
	(INV_ItemTypenArray select 3) SET [2, %4];
	bank_steuer = %5;
	[""add"",""finances"",""The Prime Minister has changed the taxes!"",false] execVM ""armitxes\logs.sqf"";
	", _item, _vcl, _mag, _weap, _bank] call broadcast;
};