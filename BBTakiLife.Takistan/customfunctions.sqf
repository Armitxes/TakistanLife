TastenDruck =
{
	private ["_ctrl", "_zeichennummer", "_ctrlid"];
	_ctrl          = ((_this select 0) select 0);
	_zeichennummer = ((_this select 0) select 1);
	_ctrlid        = (_this select 1);
	if (ISSE_str_const_validInput find _zeichennummer < 0) then
	{
		closedialog 0;
		player groupChat format[localize "STRS_wrong_input", _zeichennummer];
	};
};
ISSE_UnitExists =
{
	private ["_obj"];
	if ((typeName _this) == "STRING") then
	{
		if ((isnil(_this)) or (_this == "scalar bool array string 0xe0ffffef") or (_this == "<NULL-Object>") or (_this == "Error: No vehicle")) then
		{
			false
		}
		else
		{
			_obj = call compile format ["%1", _this];
			if (format ["%1", isplayer _obj] == "true") then
			{
				true
			}
			else
			{
				false
			};
		};
	}
	else
	{
		if (isNull _this) then
		{
			false
		}
		else
		{
			true
		};
	};
};
ISSE_ArrayIsNear =
{
	private ["_c", "_obj", "_arr", "_dis", "_res"];
	_obj = _this select 0;
	_arr = (_this select 1) - [_obj];
	_dis = _this select 2;
	_res = false;
	if (isNull _obj) then
	{
		_res = false;
	}
	else
	{
		for "_c" from 0 to (count _arr - 1) do {

			if (not(isNull(_arr select _c))) then
			{
				if ((_obj distance (_arr select _c)) < _dis) then
				{
					_res = true;
				};
			};
		};
	};
	_res
};

ISSE_ArrayNumberNear =
{
	private ["_c", "_obj", "_arr", "_dis", "_res"];
	_obj = _this select 0;
	_arr = _this select 1;
	_dis = _this select 2;
	_res = 0;
	if (isNull _obj) then
	{
		_res = 0;
	}
	else
	{
		for "_c" from 0 to (count _arr - 1) do {

			if (not(isNull(_arr select _c))) then
			{
				if ((_obj distance (_arr select _c)) < _dis) then
				{
					_res = _res + 1;
				};
			};
		};
	};
	_res
};

ISSE_CreateMarkerArray =
{
	private ["_name", "_text", "_color", "_shape", "_pos", "_typ", "_marker", "_size"];
	_pos = [0,0];
	if ((typeName (_this select 0)) == "OBJECT") then
	{
		_pos = [((getPos (_this select 0)) select 0), ((getPos (_this select 0)) select 1)];
	};
	if ((typeName (_this select 0)) == "ARRAY") then
	{
		_pos = [((_this select 0) select 0), ((_this select 0) select 1)];
	};
	_text  = "";
	if (count _this > 1) then {_text  = _this select 1};
	_typ   = "Destroy";
	if (count _this > 2) then {_typ   = _this select 2};
	_color = "ColorRed";
	if (count _this > 3) then {_color = _this select 3};
	_shape = "ICON";
	if (count _this > 4) then {_shape = _this select 4};
	_size  = [1, 1];
	if (count _this > 5) then {_size  = _this select 5};

	if (isNil("GespawnteMarkerCounter")) then {GespawnteMarkerCounter = 0;};
	_name = format["SpawnedMarker_%1", GespawnteMarkerCounter];
	if (count _this > 6) then {_name  = _this select 6};
	_marker = createMarkerLocal [_name, _pos];
	_marker setMarkerShapeLocal _shape;
	_marker setMarkerTypeLocal  _typ;
	_marker setMarkerColorLocal _color;
	_marker setMarkerTextLocal  _text;
	_marker setMarkerSizeLocal  _size;
	GespawnteMarkerCounter = GespawnteMarkerCounter + 1;
	[_name, _marker]
};

ISSE_IsVictim =
{
	private ["_state", "_victimStats"];
	_state  = animationState _this;
	_victimStats = ["amovpercmstpssurwnondnon", "adthppnemstpsraswpstdnon_2", "adthpercmstpslowwrfldnon_4", "amovpercmwlkssurwnondf_forgoten", "civillying01"];
	if (_state in _victimStats) then
	{
		true
	}
	else
	{
		false
	};
};

ISSE_DeleteVehicle = {
	private ["_vcl", "_deltime"];
	_vcl     = _this select 0;
	_deltime = _this select 1;
	sleep _deltime;
	if (not(isNull(_vcl))) then
	{
		_vcl setVehicleInit "";
		call compile format["%1 = nil;", _vcl];
		deleteVehicle _vcl;
	};
};