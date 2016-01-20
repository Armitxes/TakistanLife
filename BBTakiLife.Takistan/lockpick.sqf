_art = _this select 0;

if (_art == "use") then

{

_item   = _this select 1;
_anzahl = _this select 2;
_vcls    = nearestobjects [getpos player,["LandVehicle", "Air", "ship"], 7];
_closevcl     = _vcls select 0;
_incarpark = false;


if (!(isNull(_closevcl))) then

	{
	if (usepick) exitWith {player groupChat "You are already using a lockpick"};
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
			} else { player groupChat localize "STRS_inventar_lockpick_noluck"; };

			[_item, -1] call INV_AddInventoryItem;
			format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", player] call broadcast;
			usepick = true;
			sleep 8;
			usepick = false;
		};
	}
	else
	{
		player groupChat localize "STRS_inventar_lockpick_zuweit";
	};
};











