_target = (crew _this) select 0; 

_n 	= 10;
_exitvar = false;

if (locked _this) then {hintSilent "The car is locked. This might take a while."; _n = 16;};

hintSilent format ["You're pulling out %1. Stay close to the car!", _target];
format['if(player == %1)then{hintSilent "%2 is pulling you out of the car!"}', _target, player] call toClients;

for [{_i=0}, {_i < _n}, {_i=_i+1}] do {if (player distance _target > 3) exitWith {hintSilent "You are too far away."; _exitvar = true;};sleep 0.3;};

if(_exitvar)exitwith{};

_this lock false;

player switchMove "AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow";
sleep 0.4;
format['if(player == %2)then{player action["eject", vehicle player]}; server globalChat "%1 pulled %2 out of a car!";', player, _target] call broadcast; 