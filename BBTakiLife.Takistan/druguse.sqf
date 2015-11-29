while {true} do {
	for [{_i=0}, {_i < (count drugsellarray)}, {_i=_i+1}] do {
		_obj 	= drugsellarray select _i;
		_list 	= _obj getVariable "druglist";
		
		if(!isNil "_list") then {
			_count = count _list;
			
			for [{_j=0}, {_j < _count}, {_j=_j+1}] do {	
				_arr = _list select _j;
				_num = (_arr select 1) - 1;
				if(_num == 0)then{_list set[_j, 0]; _list = _list - [0]}else{_arr set[1, _num];_list set[_j, _arr]};
			};
			
			if(_count > 0)then{_obj setVariable["druglist", _list, true]};
		};
	};
	sleep druguserate;
};