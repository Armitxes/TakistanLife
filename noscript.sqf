_com = _this select 3;

if ((typeName _com) == "ARRAY") then

{

{call compile format [ "%1", _x];} forEach _com;

} else {

call compile format [ "%1", _com];

};

