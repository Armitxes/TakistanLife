_art = _this select 0;

if (_art == "use") then

{

_item   = _this select 1;
_vcl  	= vehicle player;
_type	= typeof _vcl;

if(_vcl getvariable "nitro" == 1)exitwith{player groupchat "this vehicle already has nitro installed"};
if (player == _vcl) exitWith {player groupChat localize "STRS_inv_items_speed_car"};
if (!(_vcl iskindof "car") or _type call INV_getitemTypeKg > 2) exitWith {player groupChat localize "STRS_inv_items_speed_no";};

player groupchat "tuning vehicle...";
_vcl setfuel 0;
sleep 10;
_vcl setfuel 1;
_vcl setvariable ["nitro", 1, true];
player groupchat "vehicle tuned!";
sleep 2;
player groupchat "press and hold shift to activate nitro";
[_item, -1] call INV_AddInventoryItem;

};



