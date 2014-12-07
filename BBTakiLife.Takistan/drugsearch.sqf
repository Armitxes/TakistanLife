_obj 	= _this;
_list	= _obj getvariable "druglist";

if(isnil "_list")exitwith{player groupchat "No drugs found"};
if(count _list == 0)exitwith{player groupchat "No drugs found"};

for [{_i=0}, {_i < (count _list)}, {_i=_i+1}] do {
  _arr	= _list select _i;
  _civ 	= _arr select 0;
  _num	= _arr select 1;
  _cost	= _arr select 2;

  player groupchat format["This civilian has $%2 worth of drugs! Interrogation reveals that they were sold by %1.", name _civ, (_num*_cost)/2];
  ["addWarrant",_civ,"Drug dealing",(_num*_cost)/2] execVM "warrant.sqf";
};

_obj setvariable["druglist", [], true];