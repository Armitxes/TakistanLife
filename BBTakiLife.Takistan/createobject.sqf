_art = _this select 0;

if (_art == "use") then {
	_item    = _this select 1;
	_class	 = _item call INV_getitemClassName;
	_exitvar = 0;
	if (player != vehicle player) exitWith {player groupChat localize "STRS_inv_item_sperre_invcl";};
	if (_exitvar == 1) exitWith {};
	[_item, -1] call INV_AddInventoryItem;
	_pos = [(position player select 0) + (sin(getDir player)*2), (position player select 1) + (cos(getDir player)*2), 0];
	_obj = _class createVehicle [0, 0, 0];
	if( !(_class in ["M2StaticMG_US_EP1","DSHKM_TK_INS_EP1","SearchLight_US_EP1","FlagCarrierBLUFOR_EP1","FlagCarrierUNO_EP1"]) ) then {_obj setVehicleInit "this enableSimulation false;";};
	_obj setDir getDir player;
	_obj setPos _pos;
	processInitCommands;
};