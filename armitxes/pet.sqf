_action = (_this select 0);

if(_action == "use") exitWith {
	if(player isKindOf "Animal") exitWith { hintSilent "A pet having a pet?\nNope..." };
	if(!isNil("playerPet")) exitWith { if(alive playerPet) then { hintSilent "You can't have 2 pets..." } else { deleteVehicle playerPet; }; };
	[(_this select 1), -1] call INV_AddInventoryItem;
	petOwner = player;
	_petGroup = group player;
	_petClass = "";
	switch ((_this select 1)) do {
		case "Rabbits": { _petClass = "rabbit"; };
		case "Dog": { _petClass = "Pastor"; if(isciv) then { _petClass = "Fin"; }; };
		case "Cow": { _petClass = (format ["Cow0%1",(ceil random 4)]); };
		default { _petClass = (_this select 1); };
	};
	playerPet = _petGroup createUnit [_petClass, position player, [], 0, "FORM"];
	addSwitchableUnit playerPet;
};