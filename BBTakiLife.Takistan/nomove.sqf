if(!isServer)exitwith{};

sleep 10;

_pos = getposASL _this;
_dir = getdir _this;

while{true}do

{

if(!(getposASL _this select 0 in _pos) or !(getposASL _this select 1 in _pos))then{_this setposASL _pos;_this setdir _dir;};
sleep 60;

};