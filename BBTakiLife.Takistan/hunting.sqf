while{true}do

{

for [{_i=0}, {_i < (count huntingarray)},{_i=_i+1}] do 

	{
	
	_pos  	= getmarkerpos ((huntingarray select _i) select 0);
	_area 	= (huntingarray select _i) select 1;
	_exit 	= false;

	_boars 	= nearestobjects [_pos, ["wildboar"], _area];
	_boars2 = nearestobjects [_pos, ["wildboar"], (_area + 200)]; 
	if(count _boars2 > count _boars)then{deletevehicle (_boars2 select (count _boars2 - 1))};
	
	{if(_x distance _pos < _area)exitwith{_exit=true}} foreach playerarray; 

	if(_exit)exitwith{};

	_boars = nearestobjects [_pos, ["wildboar"], _area];
	if(count _boars < maxboars)then{createAgent ["Wildboar", _pos, [], _area, "NONE"];};
	
	};

sleep 120;

};