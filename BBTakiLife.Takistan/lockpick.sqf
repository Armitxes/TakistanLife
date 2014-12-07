_art = _this select 0;

if (_art == "use") then

{

_item   = _this select 1;
_anzahl = _this select 2;
_closeVcl   = dummyobj;
_closest    = -1;
_incarpark = false;

	{

	if (not(isNull(_x))) then

		{

		if (player distance _x < 7 and (player distance _x < _closest or _closest == -1)) then

			{

			_closest  = (player distance _x);
			_closeVcl = _x;

			};

		};

	} forEach INV_ServerVclArray;

if (not(_closest == -1)) then

	{

	if(_closeVcl isKindOf "Tank" || _closeVcl isKindOf "Air")exitwith{player groupchat "You cannot lockpick this vehicle!"};
	if(typeof _closeVcl == "LAV25" || typeof _closeVcl == "M1133_MEV_EP1")exitwith{player groupchat "You cannot lockpick Armoured Vehicles!"};
	if (_closeVcl in INV_VehicleArray) then

		{

		player groupchat localize "STRS_inventar_lockpick_already";

		}
		else
		{
			if ((random 100) < lockpickchance) then
			{
				INV_VehicleArray = INV_VehicleArray + [_closeVcl];
				_closeVcl setVariable ["owners",(_closeVcl getVariable "owners")+[getPlayerUID player],TRUE];

				player groupChat localize "STRS_inventar_lockpick_success";

				if (([player, (civarray), 40] call INV_Seen or _incarpark) and !iscop) then
				{
				   ["addWarrant",player,"Vehicletheft",4000] execVM "warrant.sqf";
				};

			}
			else
			{
				player groupChat localize "STRS_inventar_lockpick_noluck";

				if (([player, (civarray), 40] call INV_Seen or _incarpark) and !iscop) then
				{
					["addWarrant",player,"Attempted Vehicle Theft",2000] execVM "warrant.sqf";
				};
			};

			[_item, -1] call INV_AddInventoryItem;
		};
	}
	else
	{
		player groupChat localize "STRS_inventar_lockpick_zuweit";
	};
};











