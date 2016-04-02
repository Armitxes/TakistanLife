_array = _this select 3;
_art = _array select 0;
_type = _array select 1;

if (_art == "Burn") then
{


if (_type == "Cannabis") then
{
_plant = nearestObject [player, "FxWindGrass1"];
deleteVehicle _plant;
hintSilent localize "STRS_Drugs_Cannabis_Burn";
};

if (_type == "Cocaine") then
{
_plant = nearestObject [player, "AAPL001"];
deletevehicle _plant;
hintSilent localize "STRS_Drugs_Cocaine_Burn";
};

if (_type == "Olive") then
{
_plant = nearestObject [player, "AAPL055"];
deletevehicle _plant;
hintSilent localize "STRS_action_Drugs_olive_Burn";
};

};

if (_art == "Harvest") then
{

	if (_type == "Cannabis") then
	{
		_Weight = call INV_GetOwnWeight;
		_Plant = nearestobject [player, "Cannabis"];
		deletevehicle _Plant;

		if (_Weight > 59) exitwith { hintSilent localize "STRS_inv_buyitems_get_zuschwer"; };
		if (IsCop) exitwith { hintSilent "Cops cannot do this"; };

		['Unprocessed_Cannabis', +(1)] call INV_AddInventoryItem;
		['CannabisSeed', +(2)] call INV_AddInventoryItem;

		hintSilent localize "STRS_Drugs_HarvestCannabis";
	};

	if (_type == "Cocaine") then
	{
		_Weight = call INV_GetOwnWeight;
		_Plant = nearestobject [player, "AAPL001"];
		deletevehicle _Plant;

		if (_Weight > 59) exitwith { hintSilent localize "STRS_inv_buyitems_get_zuschwer"; };
		if (IsCop) exitwith { hintSilent "Cops cannot do this"; };

		['CocaineUP', +(1)] call INV_AddInventoryItem;
		['CocaineSeed', +(2)] call INV_AddInventoryItem;

		hintSilent localize "STRS_Drugs_HarvestCocaine";
	};

	if (_type == "Olive") then
	{
		_Weight = call INV_GetOwnWeight;
		_Plant = nearestobject [player, "AAPL055"];
		deletevehicle _Plant;

		if (_Weight > 59) exitwith { hintSilent localize "STRS_inv_buyitems_get_zuschwer"; };
		if (IsCop) exitwith { hintSilent "Cops cannot do this"; };

		['Olives', +(1)] call INV_AddInventoryItem;
		['OliveSeed', +(2)] call INV_AddInventoryItem;

		hintSilent localize "STRS_Drugs_Harvestolive";
	};
};


if (_art == "Destroy") then
{
	if (_type == "Drugshed") then
	{
		_Shed = nearestobject [player, "Land_hut_old02"];
		_Flag = nearestobject [player, "FlagCarrierWest"];

		if (IsCop) then
		{
			_plyer = vehicle player;
			(format ['hint "%1 has destroyed a drug shed and has recieved a $2500 bonus";', _plyer]) call ISSE_pub_execPstr;
			[2500] call setMoney;
		}
		else
		{
			hintSilent localize "STRS_Drugs_DestroyShed";
		};


		deleteVehicle _Shed;
		deleteVehicle _Flag;
	};
};

if (_art == "Process") then
{
	if (IsCop) exitwith { hintSilent "Cops cannot do this"; };

	if (_type == "Cannabis") then
	{
		_Ammount =  'CannabisUP' call INV_GetItemAmount;

		if (_Ammount > 0) then
		{
			hintSilent localize "STRS_Drugs_ProcessCannabis";
			['CannabisUP', -(1)] call INV_AddInventoryItem;
			['marihuana', +(1)] call INV_AddInventoryItem;
		}
		else
		{
			hintSilent localize "STRS_Drugs_NoCannabis";
		};

	};

	if (_type == "Cocaine") then
	{
		_Ammount = 'CocaineUP' call INV_GetItemAmount;

		if (_Ammount > 0) then
		{
			hintSilent localize "STRS_Drugs_ProcessCocaine";
			['CocaineUP', -(1)] call INV_AddInventoryItem;
			['kokain', +(1)] call INV_AddInventoryItem;
		}
		else
		{
			hintSilent localize "STRS_Drugs_NoCocaine";
		};
	};



};
