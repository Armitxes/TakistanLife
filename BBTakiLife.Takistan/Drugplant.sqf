_art = _this select 0;

if (_art == "Use") then
{
	_item = _this select 1;
	_anzahl = _this select 2;

	if (player != vehicle player) exitwith {};
	if (IsCop) exitwith {};

	 [_item, -1] call INV_AddInventoryItem;

	if (_Item == "CannabisSeed") then
	{
		hintSilent localize "STRS_Drugs_Plant_Cannabis";
		_plant = "Cannabis" createvehicle (getpos player);
		_plant setVehicleInit "this addaction [localize ""STRS_action_Drugs_CannabisBurn"", ""DrugScript.sqf"", [""Burn"", ""Cannabis""]]";
		processInitCommands;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -3];
		sleep 3;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -2];
		sleep 3;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -1.65];
		hintSilent localize "STRS_Drugs_Cannabis_NearlyReady";
		sleep 3;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -0.65];
		sleep 3;
		_plant setVehicleInit "this addaction [localize ""STRS_action_Drugs_CannabisHarvest"", ""DrugScript.sqf"", [""Harvest"", ""Cannabis""]]";
		processinitcommands;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, 0];
		hintSilent localize "STRS_Drugs_Cannabis_Ready";
		sleep 800;
		if (alive _plant) then { deletevehicle _plant; };
	};

	if (_Item == "CocaineSeed") then
	{
		hintSilent localize "STRS_Drugs_Plant_Cocaine";
		_plant = "DD_bush02b" createvehicle (getpos player);
		_plant setVehicleInit "this addaction [localize ""STRS_action_Drugs_CocaineBurn"", ""DrugFarming\DrugScript.sqf"", [""Burn"", ""Cocaine""]]";
		processInitCommands;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -3];
		sleep 300;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -2];
		sleep 300;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -1.65];
		hintSilent localize "STRS_Drugs_Cocaine_NearlyReady";
		sleep 250;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -0.65];
		sleep 250;
		_plant setVehicleInit "this addaction [localize ""STRS_action_Drugs_CocaineHarvest"", ""DrugFarming\DrugScript.sqf"", [""Harvest"", ""Cocaine""]]";
		processinitcommands;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, 0];
		hintSilent localize "STRS_Drugs_Cocaine_Ready";
		sleep 800;
		if (alive _plant) then { deletevehicle _plant; };
	};

		if (_Item == "OliveSeed") then
	{
			hintSilent localize "STRS_Drugs_Plant_olive";
		_plant = "AAPL055" createvehicle (getpos player);
		_plant setVehicleInit "this addaction [localize ""STRS_action_Drugs_oliveBurn"", ""DrugFarming\DrugScript.sqf"", [""Burn"", ""Olive""]]";
		processInitCommands;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -2];
		sleep 120;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -1.5];
		sleep 120;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -1.25];
		hintSilent localize "STRS_Drugs_olive_NearlyReady";
		sleep 120;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, -0.65];
		sleep 120;
		_plant setVehicleInit "this addaction [localize ""STRS_action_Drugs_OliveHarvest"", ""DrugFarming\DrugScript.sqf"", [""Harvest"", ""Olive""]]";
		processinitcommands;
		_plant setPos [getPos _plant select 0, getPos _plant select 1, 0];
		hintSilent localize "STRS_Drugs_olive_Ready";
		sleep 800;
		if (alive _plant) then { deletevehicle _plant; };
	};

	if (_Item == "DrugShed") then
	{
		hintSilent localize "STRS_Drugs_PlaceShed";
		_shed = "Land_hut_old02" createvehicle (getpos player);
		sleep 0.5;
		_flag = "FlagCarrierWest" createVehicle (getpos _shed);
		_flag  setVehicleInit "this addaction [localize ""STRS_action_Drugs_DestroyShed"", ""DrugFarming\DrugScript.sqf"", [""Destroy"", ""DrugShed""]]";
		_flag  setVehicleInit "this addaction [localize ""STRS_action_Drugs_ProcessCannabis"", ""DrugFarming\DrugScript.sqf"", [""Process"", ""Cannabis""]]";
		_flag  setVehicleInit "this addaction [localize ""STRS_action_Drugs_ProcessCocaine"", ""DrugFarming\DrugScript.sqf"", [""Process"", ""Cocaine""]]";
		processinitcommands;
	};


};







