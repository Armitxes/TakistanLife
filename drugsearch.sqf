_obj 	= _this;
_list	= _obj getVariable "druglist";

if(isNil "_list")exitWith{hintSilent "No drugs found"};
if(count _list == 0)exitWith{hintSilent "No drugs found"};

for [{_i=0}, {_i < (count _list)}, {_i=_i+1}] do {
	_arr	= _list select _i;
	_civ 	= _arr select 0;
	_num	= _arr select 1;
	_cost	= _arr select 2;
	
	if(_cost < 35000) then { _cost = 35000; }; // min 7min
	if(_cost > 60000) then { _cost = 60000; }; // max 12min
	hintSilent format["This civilian has $%2 worth of drugs! Interrogation reveals that they were sold by %1.", name _civ, _cost/5];
	["addWarrant",_civ,"Drug dealing",_cost/5] execVM "warrant.sqf";
};

_obj setVariable["druglist", [], true];