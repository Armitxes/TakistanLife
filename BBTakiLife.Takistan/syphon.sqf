 _art = _this select 0;

if (_art == "use") then

{

_item   = _this select 1;
_anzahl = _this select 2;
_closeVcl   = dummyobj;
_closest    = -1;

	{

	if (not(isNull(_x))) then

		{

		if ( ((player distance _x) < 7) and ( ((player distance _x) < _closest) or (_closest == -1) ) ) then

			{

			_closest  = (player distance _x);
			_closeVcl = _x;

			};

		};

	} forEach INV_ServerVclArray;

if(typeof _closeVcl == "MMT_Civ" or typeof _closeVcl == "MMT_USMC")exitwith{};

if ((fuel _closeVcl) < 0.5) exitWith {player groupChat "there is not enough fuel in this car to syphon";};

[_item, -1] call INV_AddInventoryItem;

if (not(_closest == -1)) then

	{

	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	player groupchat "Draining fuel.";
	_closeVcl setFuel 0;
	sleep 6;
	WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
	player groupChat localize "STRS_inv_items_empty_refueled";
	["kanister", 1] call INV_AddInventoryItem;

	};

};