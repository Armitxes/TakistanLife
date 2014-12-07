 _art = _this select 0;

if (_art == "use") then

{

_item   = _this select 1;
_anzahl = _this select 2;
_civ    = player;
_jammed = 0;
call compile format ["_jammed = %1_markerjammed;",_civ];
if (_jammed == 1) exitWith {player groupChat localize "STRS_inventar_stoersender_alreadyinuse";};
_dauer = (10 * 60);
call compile format ["%1_markerjammed = 1; publicVariable ""%1_markerjammed"";",_civ];
player groupChat format [localize "STRS_inventar_stoersender_success",(stoersender_dauer call ISSE_str_IntToStr)];
showMap false;
[_item, -1] call INV_AddInventoryItem;
sleep _dauer;

if (call compile format ["%1_markerjammed == 1",_civ]) then

	{

	call compile format ["%1_markerjammed = 0; publicVariable ""%1_markerjammed"";", _civ];
	player groupChat localize "STRS_inventar_stoersender_end";
	showMap true;

	};

};