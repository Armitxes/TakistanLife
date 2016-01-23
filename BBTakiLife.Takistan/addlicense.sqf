_this    = _this select 3;
_number  = _this select 0;
_art     = _this select 1;

if ((_art == "remove") or (_art == "add")) then

{

if (_art == "add") then

	{

	_license = ((INV_Lizenzen select _number) select 0);
	_name    = ((INV_Lizenzen select _number) select 2);
	_cost    = ((INV_Lizenzen select _number) select 3);
	if (_license call INV_HasLicense) exitWith {hintSilent localize "STRS_inv_buylicense_alreadytrue";};
	if (('dollarz' call INV_GetItemAmount) < _cost) exitWith {hintSilent localize "STRS_inv_buylicense_nomoney";};
	if(_license == "car")then{demerits = 12};
	if(_license == "truck") then {truckDemerits = 12};
	['dollarz', -(_cost)] call INV_AddInventoryItem;
	hintSilent format[localize "STRS_inv_buylicense_gottraining", (_cost call ISSE_str_IntToStr), _name];

	INV_LizenzOwner = INV_LizenzOwner + [_license];

	}
	else
	{

	_license = ((INV_Lizenzen select _number) select 0);
	name    = ((INV_Lizenzen select _number) select 2);
	if (not(_license call INV_HasLicense)) exitWith {hintSilent localize "STRS_inv_buylicense_alreadyfalse";};
	INV_LizenzOwner = INV_LizenzOwner - [_license];
	hintSilent format[localize "STRS_inv_buylicense_losttraining", _name];

	};

};