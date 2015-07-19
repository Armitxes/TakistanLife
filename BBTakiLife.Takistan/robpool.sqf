robsafes = [0,0];
while{true} do {
	_bank = robsafes select 0; _casino = robsafes select 1;
	if(_bank < 200000)then{ robsafes set [0,_bank + round random 7000]; };
	if(_casino < 200000)then{ robsafes set [1,_casino + round random 7000]; };
	publicVariable "robsafes";
	sleep 110;
};
