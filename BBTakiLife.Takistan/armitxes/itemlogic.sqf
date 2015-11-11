_art = _this select 0;

if (_art == "use") then
{
	_item = _this select 1;
	_class = _item call INV_getitemClassName;
	_plrPos = getPosASL player;
	
	switch (_item) do {
		case "seccam": {
			if (iscop || isun) then {
				_obj = _class createVehicle [0, 0, 0];
				_obj setDir getDir player;
				_obj setPosASL _plrPos;
				[_obj,((_plrPos select 2) + 2.2)] call setHeightASL;
				
				_l = 0; if (isun) then { _l = 1; };
				_arr = cameras select _l; _arr = _arr + [_obj];
				cameras set [_l, _arr]; publicVariable "cameras";
			};
		};
		case "Spikestrip": {
			_obj = _class createVehicle [0, 0, 0];
			_obj setDir getDir player;
			_obj setPosASL _plrPos;
			_obj setDammage 1;
		};
	};
	
	[_item, -1] call INV_AddInventoryItem;
};