private ["_minearray"];

_art = _this select 0;

if (_art == "use") then

{

if(working)exitwith{};

_item   = _this select 1;
_anzahl = _this select 2;

working=true;
_isInArea=false;

{
	if (player distance (getMarkerPos ((_x select 0) select 0)) < ((_x select 0) select 1)) then {_isInArea = true; _minearray = _x};
} forEach miningarray;

_resource = _minearray select 1;
_max      = _minearray select 2;
_infos    = _resource call INV_getitemArray;
_name     = (_infos call INV_getitemName);

if (!_isInArea) exitwith {
	hintSilent "You are not near a mine.";
	working = false;
};

if(_item == "Shovel")then

	{

	totalamount=0;
	_max = shovelmax;

	for [{_i=0}, {_i < 4}, {_i=_i+1}] do

		{

		_amount = round (random _max);
		titletext ["Digging...", "PLAIN DOWN", 0.1];
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 1.3;
		player switchmove "normal";
		shoveldur = shoveldur - (floor (random 2));

		if(shoveldur <= 0)exitwith{hintSilent "The shovel broke"; ["Shovel", -1] call INV_AddInventoryItem; shoveldur=20;};

		_avail = floor (INV_Tragfaehigkeit - (call INV_GetOwnWeight));

		totalamount = totalamount + _amount;
		if((totalamount*3) >= _avail)exitwith{totalamount = (_avail/3); hintSilent "maximum weight reached"; _i=6;};
		hintSilent format["You got %1 %2.", _amount, _name];

		};
	totalamount = (floor (totalamount));
	[_resource, totalamount] call INV_AddInventoryItem;

	};

if(_item == "fishingpole")then

	{

	totalamount=0;
	_max = fishingpolemax;

	for [{_i=0}, {_i < 4}, {_i=_i+1}] do

		{

		_amount = round (random _max);
		titletext ["Digging...", "PLAIN DOWN", 0.1];
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 1.3;
		player switchmove "normal";
		fishingpoledur = fishingpoledur - (floor (random 2));

		if(fishingpoledur <= 0)exitwith{hintSilent "The fishing pole broke"; ["fishingpole", -1] call INV_AddInventoryItem; fishingpoledur=20;};

		_avail = floor (INV_Tragfaehigkeit - (call INV_GetOwnWeight));

		totalamount = totalamount + _amount;
		if((totalamount*3) >= _avail)exitwith{totalamount = (_avail/3); hintSilent "maximum weight reached"; _i=6;};
		hintSilent format["You got %1 %2.", _amount, _name];

		};
	totalamount = (floor (totalamount));
	[_resource, totalamount] call INV_AddInventoryItem;

	};

if(_item == "Pickaxe")then

	{

	totalamount=0;
	_max = pickaxemax;

	for [{_i=0}, {_i < 5}, {_i=_i+1}] do

		{

		_amount = round (random _max);
		titletext ["Working...", "PLAIN DOWN", 0.1];
		player playmove "AinvPknlMstpSlayWrflDnon";
		sleep 1.3;
		player switchmove "normal";
		pickaxedur = pickaxedur - (floor (random 2));

		if(pickaxedur <= 0)exitwith{hintSilent "The pickaxe broke"; ["Pickaxe", -1] call INV_AddInventoryItem; pickaxedur=50;};

		_avail = floor (INV_Tragfaehigkeit - (call INV_GetOwnWeight));

		totalamount = totalamount + _amount;
		if((totalamount*3) >= _avail)exitwith{totalamount = (_avail/3); hintSilent "maximum weight reached"; _i=6;};

		hintSilent format["You got %1 %2.", _amount, _name];

		};
	totalamount = (floor (totalamount));
	[_resource, totalamount] call INV_AddInventoryItem;

	};

if(_item == "JackHammer")then

	{

	totalamount=0;
	_max = pickaxemax;
	
	titletext ["Working...", "PLAIN DOWN", 0.1];
	player playmove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
	
  for [{_i=0}, {_i < 5}, {_i=_i+1}] do
	{ 
	  _amount = round (random _max);
		sleep 0.8;
		player switchmove "normal";
		_avail = floor (INV_Tragfaehigkeit - (call INV_GetOwnWeight));
		
		totalamount = totalamount + _amount;
		if((totalamount*3) >= _avail)exitwith{totalamount = (_avail/3); hintSilent "maximum weight reached"; _i=6;};
		hintSilent format["You got %1 %2.", _amount, _name];
		 }; 
    
	totalamount = (floor (totalamount));
	if ((vehicle player) == player) then {
	[_resource, totalamount] call INV_AddInventoryItem;
	} else {
	_vcls = nearestobjects [getpos player, ["LandVehicle", "Air", "ship"],15];
    _vcl = _vcls select 0;
	_vclClass = (typeOf _vcl);
	_maxweight = _vclClass call INV_getvehmaxkg;
	_totalamount = totalamount call ISSE_str_StrToInt;
	_storageweight = (format["%1_storage", _vcl] call INV_GetStorageWeight) + (_totalamount * (_resource call INV_getitemTypeKg));
	if(_storageweight > _maxweight)then{hintSilent "The vehicle's storage is full";
	} else {
	[_resource, totalamount, format["%1_storage", _vcl]] call INV_AddItemStorage;};
	};

	};

working=false;

};