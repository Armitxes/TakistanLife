_pos   = (_this select 0) select 0;
_class = (_this select 0) select 1;
_obj   = nearestobject[_pos, _class];
_arr   = _this select 1;
_range = _this select 2;
_time  = _this select 3;

_x = 0;

while{alive _obj} do

{

if([_obj, _arr, _range] call ISSE_ArrayIsNear)then{_x = 0};
if(_x >= _time)exitwith{};
_x = _x + 50;
sleep 50;

};

deletevehicle _obj;