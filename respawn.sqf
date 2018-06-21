waitUntil {JIP_Stats_Ready};

while {true} do
{
	waituntil {alive player};
	player removeweapon "ItemGPS";
	removeAllWeapons player;
	removeBackpack player;
	primHolster = "";
	pistolHolster = "";
	time_bank_lockout = -1200;

	if (iscop || isun) then {
		if (count playerWeapons == 0 and count playermagazines == 0) then {
			if(iscop) then { {player addMagazine _x} forEach CopStartGear_Mags; {player addWeapon   _x} forEach CopStartGear_Weap; };
			if(isun) then { {player addMagazine _x} forEach UNStartGear_Mags; {player addWeapon   _x} forEach UNStartGear_Weap; };
		} else {
			{player addMagazine _x} forEach playerMagazines;
			{player addWeapon   _x} forEach playerWeapons;
		};
		player selectWeapon (primaryweapon player);
	};

	["respawn"] execVM "armitxes\clothing.sqf";
	sleep 5;
	if(player isKindOf "Animal") then {
		if(isun) then { ["use","unUni"] execVM "armitxes\clothing.sqf"; } else {
			if(iscop) then { ["use","CopUniDef"] execVM "armitxes\clothing.sqf"; } else {
				["use","civUni5"] execVM "armitxes\clothing.sqf";
			};
		};
		sleep 3;
	};

	waituntil {!(alive player)};
	dmgHead = 0;
	dmgBody = 0;
	dmgHands = 0;
	dmgLegs = 0;

	if(player isKindOf "Animal") then {
		if(alive petOwner) then {
			selectPlayer petOwner;
			waitUntil {alive player};
			_petGrp = (group playerPet);
			deleteVehicle playerPet;
			deleteGroup _petGrp;
			playerPet = nil;
			_petGrp = nil;

			waituntil {!(alive petOwner)};
			petOwner = nil;
		} else { deleteVehicle petOwner; };
	} else {
		if(!isNil("playerPet")) then { deleteVehicle playerPet; playerPet = nil; };

		weaponsloaded = false;
		role = player;
		sleep 0.5;
		closeDialog 0;

		if(iscop) then {
			_amount = ("dollarz" call INV_GetItemAmount);
			if (_amount >= 1) then
			{
				_object = "EvMoney" createvehicle position player;
				_object setVehicleInit "this enableSimulation false;";
				processInitCommands;

				_object setVariable ["droparray", [_amount, "dollarz"], true];
				["dollarz", -(_amount)] call INV_AddInventoryItem;
			};
		};

		if (isciv) then {
			for [{_i=0}, {_i < (count INV_InventarArray)}, {_i=_i+1}] do {
				_item   = ((INV_InventarArray select _i) select 0);
				_amount = (_item call INV_GetItemAmount);

				if (_amount > 0 and (_item call INV_getitemDropable)) then {
					private "_class";

					if(_item == "dollarz")then{_class = "EvMoney"}else{_class = "Suitcase"};
					_object = _class createVehicle position player;
					_object setVehicleInit "this enableSimulation false;";
					processInitCommands;
					_object setvariable ["droparray", [_amount, _item], true];
				};
			};
			call INV_InventarLeeren;

			if(isdead == 0)then{[player, "suicide"] execVM "victim.sqf";};
			waituntil{isdead == 1};
			DeadWaitSec = DeadWaitSec + respawntimeinc;
			if (DeadWaitSec > DeadTimeMax) then {DeadWaitSec = DeadTimeMax};
			[] execVM "respawncamera.sqf";
			sleep 3;
			["deleteWarrant",player,"",0] execVM "warrant.sqf";

			sleep respawnzeit-5;
			removeAllWeapons role;
			hideBody role;

			waituntil {alive player};
			[] execVM "actions.sqf";

			removeAllWeapons player;
			deleteVehicle role;
			waituntil {deadcam == 0};
			isdead = 0;
			if((PLAYERDATA select 9) == 2) then {player setPos (getMarkerPos "respawn_civilian2");
			} else {
			player setPos (getMarkerPos "respawn_civilian");};
			};

		if (iscop || isun) then {
			removeAllWeapons role;
			if (DeadWaitSec > DeadTimeMax) then {DeadWaitSec = DeadTimeMax};
			[] execVM "respawncamera.sqf";
			sleep (respawnzeit - 5);
			hideBody role;

			sleep 5;

			waitUntil {alive player};
			[] execVM "actions.sqf";

			deleteVehicle role;
			isdead = 0;

			if(iscop) then { player setPos (getMarkerPos "respawn_west"); };
			if(isun) then { player setPos (getMarkerPos "respawn_guerrila"); };
		};
	};
};
