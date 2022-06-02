if(isServer) then {
	warrantarray = [];
	lastElection = 0;

	_WahlArray = [];
	for [{_i=0}, {_i < playercount}, {_i=_i+1}] do {_WahlArray = _WahlArray + [ [] ];};
	server setVariable ["PMVote",_WahlArray,true];
	server setVariable ["CCVote",_WahlArray,true];
	_WahlArray = nil;

	_w = execVM "\tkl_server\db.sqf"; waitUntil {scriptDone _w};
	_w = execVM "\tkl_server\map.sqf"; waitUntil {scriptDone _w};
}
