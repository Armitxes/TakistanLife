_art = ((_this select 3) select 0);
_playernum = (rolenumber-1);

if (_art == "PMresign") then {
_Wahlarrayp = server getVariable "PMvote";
if ((_playernum) == MayorNumber) then 
{
if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
	ctrlSetText [1,"Are you sure that you want to resign as Prime Minister?"];
	waitUntil{(not(ctrlVisible 1023))};
	
	if (Antwort == 1) then {
	isMayor = false;
	MayorNumber = -1;
    publicVariable "MayorNumber";
	_WahlArrayp = [];
for [{_i=0}, {_i < playercount}, {_i=_i+1}] do {_WahlArrayp = _WahlArrayp + [ [] ];};
  server setVariable ["PMVote",_WahlArrayp,true];
	_msg = format ["Prime Minister %1 has resigned from office!",name player];
	(format["hint ""%1"";", _msg]) call toClients;};
	
	Antwort = 2;
  };
};

if (_art == "CCresign") then {
_WahlArrayc = server getVariable "CCVote";
if ((_playernum) == ChiefNumber) then 
{
if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
	ctrlSetText [1,"Are you sure that you want to resign as Chief Constable?"];
	waitUntil{(not(ctrlVisible 1023))};
	
	if (Antwort == 1) then {
	isMayor = false;
	ChiefNumber = -1;
    publicVariable "ChiefNumber";
	for [{_i=0}, {_i < count(_WahlArrayc)}, {_i=_i+1}] do
  {
    _arr = (_WahlArrayc select _i);
    if (_playernum in _arr) exitWith {_arr = _arr - [_playernum];	_WahlArrayc SET [_i, _arr];};
  };
	server setVariable ["CCVote",_WahlArrayc,true];
	_msg = format ["Chief Constable %1 has resigned from office!",name player];
	(format["hint ""%1"";", _msg]) call toClients;};
	
	Antwort = 2;
  };
};