_loopart = _this select 0;
_dollarz    = 'dollarz' call INV_GetItemAmount;

if (_loopart == "disarm") then {
  call INV_EntferneIllegales;
  hintSilent localize "STRS_civmenucheck_beendisarmed";
};


if (_loopart == "ticket") then

{

_strafe = _this select 1;
_cop    = _this select 2;
_didpay = 0;
_copplayernumber = playersNumber west;
_copticket = round(_strafe/_copplayernumber);

if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};

ctrlSetText [1, format["%1 gave you a ticket of $%2. Do you want to pay?", _cop, (_strafe call ISSE_str_IntToStr)]];

waitUntil{(not(ctrlVisible 1023))};

if (Antwort == 1) then

	{

	if ((_dollarz + (PLAYERDATA select 1)) < _strafe) exitwith

		{
    
    (format ["server globalChat format [localize ""STRS_civmenu_didnotpayticket"", name %2, %3];", _cop, player, (_strafe call ISSE_str_IntToStr), (_didnotpay call ISSE_str_IntToStr)]) call broadcast;

		};

	hintSilent format [localize "STRS_civmenucheck_ticketself", (_strafe call ISSE_str_IntToStr)];
	(format ["server globalChat format [localize ""STRS_civmenu_didpayticket"", name %2, %3]; if (iscop) then{hintSilent ""You got $%4 because the %2 paid the ticket."";[""dollarz"", %4] call INV_AddInventoryItem;};", _cop, player, (_strafe call ISSE_str_IntToStr), (_copticket call ISSE_str_IntToStr)]) call toClients;

	if(_dollarz > _strafe) exitwith {['dollarz', -(_strafe)] call INV_AddInventoryItem;};
	if ((PLAYERDATA select 1) > _strafe) exitwith {[-_strafe] call setMoney;};

	if ((_dollarz + (PLAYERDATA select 1)) > _strafe) exitwith

		{

		_strafe1 = _dollarz;
		_strafe2 = _strafe - _strafe1;
		['dollarz', -(_strafe1)] call INV_AddInventoryItem;
		[-_strafe2] call setMoney;

		};

	};

  if (Antwort == 2) then {
    (format ["server globalChat format [localize ""STRS_civmenu_didpaynothing"", name %2];", _cop, player, (_strafe call ISSE_str_IntToStr)]) call toClients;
    hintSilent localize "STRS_civmenu_youdidnotpay";
	};
  Antwort = 2;
};



if (_loopart == "drugs") then {
	_checkcop = _this select 1;
	drugsvalue = 0;

	if (["INV_InventarArray", "illegal"] call INV_StorageHasKindOf) then {
		for [{_i=0}, {_i < (count INV_InventarArray)}, {_i=_i+1}] do {
			_item   = ((INV_InventarArray select _i) select 0);
			_infos  = _item call INV_getitemArray;
			
			if(_item call INV_getitemKindOf == "illegal") then {
				_amount = (_item call INV_GetItemAmount);
				_preis  = (_infos call INV_getitemBuyCost);
				drugsvalue = drugsvalue + (_preis*_amount);
			};
		};

		["INV_InventarArray", "illegal"] call INV_StorageRemoveKindOf;
		[format ["addWarrant",player,"trafficking illegals (%1)",_infos call INV_getitemName],drugsvalue/2] execVM "warrant.sqf";
		hintSilent localize "STRS_civmenucheck_beendrugsearched";
	} else {(format ["if (player == %2) then {hintSilent localize ""STRS_civmenu_hasnodrugs"";};", player, _checkcop]) call toClients;};

};

if (_loopart == "inventcheck") then {
	_aktionsStarter = _this select 1;
	(format ['if (player == %1) then {[0, 0, 0, ["inventorycheck", %2, %3, %4]] execVM "maindialogs.sqf";};',_aktionsStarter, INV_LizenzOwner, INV_InventarArray, player]) call broadcast;
};

if (_loopart == "licencheck") then {
	_aktionsStarter = _this select 1;
	(format ['if (player == %1) then {["idcard", %2, %3] execVM "armitxes\dialogs\controller.sqf";};',_aktionsStarter,player,INV_LizenzOwner]) call broadcast;
};

if (_loopart == "stealmoney") then {
	_aktionsStarter = _this select 1;
	if(stolenfromtimeractive) exitwith { };
	
	_dollarz  = 'dollarz' call INV_GetItemAmount;
	_amounttosteal = (floor(random _dollarz));
	['dollarz',-_amounttosteal] call INV_AddInventoryItem;
	
	(format ['if (player == %1) then {["dollarz", %3] call INV_AddInventoryItem;}; hint "%2 stole %3 from %4";',_aktionsStarter ,name _aktionsStarter, _amounttosteal, name player]) call toClients;
	stolenfromtimeractive = true;
	sleep stolenfromtime;
	stolenfromtimeractive = false;
};