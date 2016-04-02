_target = (crew _this) select 0; 

_n 	= 10;
_exitvar = false;

hintSilent format ["You're pulling out %1. Stay close to the car!", _target];

for [{_i=0}, {_i < _n}, {_i=_i+1}] do {if (player distance _target > 6) exitWith {hintSilent "You are too far away."; _exitvar = true;};sleep 0.3;};

if(_exitvar)exitwith{};

_this lock false;

player switchMove "AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow";
sleep 0.4;  
                                                       
format['if(player == %2)then{player action["eject", vehicle player]};', player, _target] call toClients;
(format ["%1 switchmove ""%2"";", _target, "civillying01"]) call toClients;
 
dragging = true;
dragciv = _target;
_target attachTo [player,[0,0.5,0]];