_array = _this select 3;
_art   = _array select 0;
_dollarz  = 'dollarz' call INV_GetItemAmount;_zusatzString = "";

if ((count _array)>1) then
{
	_zusatzString = _array select 1;
};

if (_art == "bail") then
{
	if (!(createDialog "baildialog")) exitWith {hint "Dialog Error!";};
	sliderSetRange [2, 100, 250000];		sliderSetSpeed [2, 1, 50];

	while {(ctrlVisible 1008)} do
	{
		ctrlSetText [1, format["$%1", ((round(sliderPosition 2)) call ISSE_str_IntToStr)]];
		sleep 0.3;
	};
};


if (_art == "wantedrelease") then
{
	if (!(createDialog "wantedrelease")) exitWith {hint "Dialog Error!";};
	[2, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, 0];
	
	// Change this and I'll fcking kill you ;)
  if(iscop) then {
  	_list = lbAdd [4, "Crime not in List"];
  	_list = lbAdd [4, "Murder"];
  	_list = lbAdd [4, "Hit & Run"];
  	_list = lbAdd [4, "Use of an Illegal Weapon"];
  	_list = lbAdd [4, "VIP Assassination"];
  	_list = lbAdd [4, "Bank/Casino Robbery"];
  	_list = lbAdd [4, "Breach of Highway Code"];
  	_list = lbAdd [4, "Evading a Police Checkpoint"];
  	_list = lbAdd [4, "Evading the Police"];
  	_list = lbAdd [4, "Theft of Civilian Vehicle"];
  	_list = lbAdd [4, "Possession of Class A Drug"];
  	_list = lbAdd [4, "Possession of Class B Drug"];
  	_list = lbAdd [4, "Assault on an Officer"];
  	_list = lbAdd [4, "Rioting"];
  	_list = lbAdd [4, "Slavery"];
  	_list = lbAdd [4, "Perverting the Course of Justice"];  	
  	_list = lbAdd [4, "Robbery"];
  	_list = lbAdd [4, "Attempted Murder"];
  	_list = lbAdd [4, "Attempted Vehicle Theft"];
  	_list = lbAdd [4, "Possession of Illegal Weapon"];
  	_list = lbAdd [4, "Anti Social Behaviour"];
  	_list = lbAdd [4, "Escaping Jail"];
  	_list = lbAdd [4, "Assisting a Jail Break"];
  	_list = lbAdd [4, "Arson"];
  	_list = lbAdd [4, "Kidnap"];
  	_list = lbAdd [4, "Manslaughter"];
  	_list = lbAdd [4, "Kidnapping a VIP"];
	_list = lbAdd [4, "Breach of Aviation Law"];
  };
  _list = lbAdd [4, "Theft of UN/Cop Vehicle"];
  _list = lbAdd [4, "Illegal Border Crossing"];
  _list = lbAdd [4, "Crimes Against Humanity"];  
  
  lbSetCurSel [4, 0];
  
	while {ctrlVisible 1007} do
	{
		sleep 0.3;
	};
};

if (_art == "spielerliste") then
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_trennlinie = "---------------------------------------------";
	lbAdd [1, format ["Date:     %3.%2.%1", (date select 0), (date select 1), (date select 2)]];
	lbAdd [1, format ["Runtime: %1 minutes", (round(time/60))]];
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_playerinfo"];
	lbAdd [1, format ["Money: $%2", localize "STRS_statdialog_health", (('dollarz' call INV_GetItemAmount) call ISSE_str_IntToStr)]];
	lbAdd [1, format ["Savings: $%2", localize "STRS_statdialog_health", ((PLAYERDATA select 1) call ISSE_str_IntToStr)]];
	lbAdd [1, format ["%1: %2/%3", localize "STRS_statdialog_weight", (call INV_GetOwnWeight), INV_Tragfaehigkeit]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_deaths", deadtimes]];
	lbAdd [1, format ["%1: %2 seconds",    "Respawn time", round(DeadWaitSec+extradeadtime)]];
	if(isciv)then{lbAdd [1, format ["%1: %2",    "Demerit points", demerits]]};

	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_licenselist"];
	for [{_i=0}, {_i < (count INV_Lizenzen)}, {_i=_i+1}] do
	{
		if (((INV_Lizenzen select _i) select 0) call INV_HasLicense) then
		{
			lbAdd [1, ((INV_Lizenzen select _i) select 2)];
		};
	};
	lbAdd [1, _trennlinie];
	lbAdd [1, "F A C T O R I E S:"];
	for [{_i=0}, {_i < (count INV_ItemFabriken)}, {_i=_i+1}] do
	{
		if (((INV_ItemFabriken select _i) select 1) in INV_Fabrikowner) then
		{
      _workers = call compile format["%1workers", ((INV_ItemFabriken select _i) select 8)];
      lbAdd [1, format['%1: %2 workers', ((INV_ItemFabriken select _i) select 2), _workers]];
		};
	};
	lbAdd [1, _trennlinie];
	if (not(MayorNumber == -1)) then
	{
		lbAdd [1,format["Prime Minister: %1",name (playerarray select MayorNumber)]];
	} else { lbAdd [1,"There is no elected Prime Minister"]; };	
	
	if (not(chiefNumber == -1)) then
	{
    lbAdd [1,format["Police Constable: %1",name (playerarray select chiefNumber)]];
	} else { lbAdd [1,"There is no elected Police Constable"]; };
  
  lbAdd [1, format ["Next elections: %1 minutes",round((lastElection+35)-(time/60))]]; 
		
	lbAdd [1, _trennlinie];
	lbAdd [1, "G A N G S:"];

	for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do

	{

	_gangarray = gangsarray select _i;
	_gangname  = _gangarray select 0;
	_members   = _gangarray select 1;
	_territory = "None";

	_control1 = gangarea1 getvariable "control";
	_control2 = gangarea2 getvariable "control";
	_control3 = gangarea3 getvariable "control";

	if(_control1 == _gangname)then{_territory = "Gang area 1"};
	if(_control2 == _gangname)then{if(_territory == "None")then{_territory = "Gang area 2"}else{_territory = _territory + ", Gang area 2"};};
	if(_control3 == _gangname)then{if(_territory == "None")then{_territory = "Gang area 3"}else{_territory = _territory + ", Gang area 3"};};
	_territory = _territory + ".";

	lbAdd [1, format["%1 - Territory: %2 - Members:", _gangarray select 0, _territory]];
	private "_j"; /// BUG FIX
	for [{_j=0}, {_j < (count _members)}, {_j=_j+1}] do {if(_j == 0)then{lbAdd [1, format["%1 (leader)", _members select _j]]}else{lbAdd [1, format["%1", _members select _j]]};};

	};

	lbAdd [1, _trennlinie];

	lbAdd [1, "B A N K:"];
	lbAdd [1, (format ["Est. total funds in the main bank safe: $%1", robpoolsafe])];
	if(!local_useBankPossible)then{lbAdd [1, (format ["Bank lockout time remaining: %1 seconds.", round rblock])]};
	
	lbAdd [1, _trennlinie];

	lbAdd [1, "C A S I N O  S A F E:"];
	lbAdd [1, (format ["Est. total funds in the casino safe: $%1", crobpoolsafe])];

	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_laws"];
	_i = 0;
	{
		if (not(_x == "")) then
		{
			_i = _i + 1;
			lbAdd [1, (format ["%1: %2", _i, _x])];
		};
	}
	forEach GesetzArray;
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_taxes"];
	{
		if ((_x select 2) > 0) then
		{
			lbAdd [1, format["%1: %2", (_x select 1), (_x select 2)] ];
		};
	}
	foreach INV_ItemTypenArray;
	lbAdd [1, format["Transfer: %1", bank_steuer] ];
	lbAdd [1, _trennlinie];
	
	lbAdd [1, "O I L  D E M A N D"];
	if (isNil "oildemand") then {
	lbAdd [1,"Oil Barrel Trader demand: 1"];}
	else {
	lbAdd [1, format["Oil Barrel Trader demand: %1", oildemand]];};
	
	lbAdd [1, _trennlinie];
	lbAdd [1, "W A N T E D:"];
         
	for [{_i=0}, {_i < (count warrantarray)}, {_i=_i+1}] do
	{
      _singleWarrant = warrantarray select _i;
        _idCiv = _singleWarrant select 0;
        _pReason = _singleWarrant select 1;
        _pBounty = _singleWarrant select 2;  
      
	   lbAdd [1,(format ["%1 %2 ( Cop Bounty: %3, Jail Time: %4 min/s,Total Bail : %5): is wanted for :", _idCiv, (name _idCiv), _pBounty, round (_pBounty/(16.5*60)),(_pBounty*2)])];
				 lbAdd [1,(format ["  %1", _pReason])];
		};
		lbAdd [1, _trennlinie]
	};

if (_art == "inventorycheck") then
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_licensearray  = (_array select 1);
	_inventararray = (_array select 2);
	_civobj        = (_array select 3);
	_waffenarray   = weapons _civobj - nonlethalweapons;
	_magazinarray  = magazines _civobj;
	_trennlinie = "---------------------------------------------";
	lbAdd [1, localize "STRS_statdialog_licenselist"];
	private "_i"; //// ADD to fix bug
	for [{_i=0}, {_i < (count _licensearray)}, {_i=_i+1}] do
	{
		_lizenz = (_licensearray select _i);
		lbAdd [1, format ["%1", (_lizenz call INV_GetLicenseName)]];
	};
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_inventarlist"];
	for [{_i=0}, {_i < (count _inventararray)}, {_i=_i+1}] do
	{
		_objekt     = ((_inventararray select _i) select 0);
		_objektname = (_objekt call INV_getitemName);
		_anzahl     = ((_inventararray select _i) select 1);
		if (_anzahl > 0) then
		{
			lbAdd [1, format ["%1: %2", _objektname, _anzahl]];
		};
	};

	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_waffen"];
	for [{_i=0}, {_i < (count _waffenarray)}, {_i=_i+1}] do
	{
		_objekt     = _waffenarray select _i;
		_scriptname = _objekt call INV_GetScriptFromClass_Weap;
		_objektname = (_scriptname call INV_getitemName);
		lbAdd [1, format ["%1", _objektname]];
	};
	lbAdd [1, _trennlinie];
	_index = lbAdd [1, localize "STRS_statdialog_magazine"];
	for [{_i=0}, {_i < (count _magazinarray)}, {_i=_i+1}] do
	{
		_objekt     = _magazinarray select _i;
		_scriptname = _objekt call INV_GetScriptFromClass_Mag;
		_objektname = (_scriptname call INV_getitemName);
		lbAdd [1, format ["%1", _objektname]];
	};
	lbAdd [1, _trennlinie];
};

if (_art == "licensecheck") then 
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_licensearray  = (_array select 1);
	
	_trennlinie = "---------------------------------------------";
	lbAdd [1, localize "STRS_statdialog_licenselist"];
	private "_i"; //// ADD to fix bug
	for [{_i=0}, {_i < (count _licensearray)}, {_i=_i+1}] do 
	{
		_lizenz = (_licensearray select _i);
		lbAdd [1, format ["%1", (_lizenz call INV_GetLicenseName)]];
	};
	lbAdd [1, _trennlinie];
	
};

if (_art == "gesetz") then
{
	if (!(createDialog "gesetzdialog")) exitWith {hint "Dialog Error!";};
	{
		_index = lbAdd [1, _x];
		lbSetData [1, _index, _x];
	}
	forEach GesetzArray;
	while {ctrlVisible 1020} do
	{
		_selected = lbCurSel 1;
		ctrlSetText [2, lbText [1, _selected]];
		waitUntil {((not(_selected == lbCurSel 1)) or (not(ctrlVisible 1020)))};
	};
};

if (_art == "coplog") then
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_trennlinie = "---------------------------------------------";
	private "_i"; /// ADDED TO FIX BUG
	lbAdd [1, "C U R R E N T  W A R R A N T S:"];
	lbAdd [1, _trennlinie];
	for [{_i=0}, {_i < (count warrantarray)}, {_i=_i+1}] do
	{
      _singleWarrant = warrantarray select _i;
        _idCiv = _singleWarrant select 0;
        _pReason = _singleWarrant select 1;
        _pBounty = _singleWarrant select 2;  
      lbAdd [1, (format ["%1 %2 ( Cop Bounty: %3, Jail Time: %4 min/s,Total Bail : %5): is wanted for :", _idCiv, (name _idCiv), _pBounty, round (_pBounty/(16.5*60)),(_pBounty*2)])];
			     lbAdd [1,(format ["  %1", _pReason])]; 
	
	};
  lbAdd [1, _trennlinie];
};

if (_art == "wahlen") then
{
	if (!(createDialog "wahldialog")) exitWith {hint "Dialog Error!";};
	_array = [0, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, _array select 1];
};

if (_art == "chief") then
{
	if (!(createDialog "chiefdialog")) exitWith {hint "Dialog Error!";};
	_arrayc = [0, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, _arrayc select 1];
};

if (_art == "steuern") then
{
	if (!(createDialog "steuerdialog")) exitWith {hint "Dialog Error!";};
	sliderSetSpeed [12, 1, 5];
	sliderSetRange [12, 0, 40];
	sliderSetPosition [12,((INV_ItemTypenArray select 0) select 2)];
	sliderSetSpeed [22, 1, 5];		sliderSetRange [22, 1, 40];
	sliderSetPosition [22,((INV_ItemTypenArray select 1) select 2)];
	sliderSetSpeed [32, 1, 5];				sliderSetRange [32, 1, 40];
	sliderSetPosition [32,((INV_ItemTypenArray select 2) select 2)];
	sliderSetSpeed [42, 1, 5];
	sliderSetRange [42, 0, 40];
	sliderSetPosition [42,((INV_ItemTypenArray select 3) select 2)];
	sliderSetSpeed [52, 1, 5];
	sliderSetRange [52, 0, 40];
	sliderSetPosition [52,bank_steuer];
	while {ctrlVisible 1032} do
	{
		ctrlSetText [11, format[localize "STRS_dialogandere_steuerdialog_itemsteuer", ((round(sliderPosition 12)) call ISSE_str_IntToStr)]];
		ctrlSetText [21, format[localize "STRS_dialogandere_steuerdialog_fahrzeugsteuer", ((round(sliderPosition 22)) call ISSE_str_IntToStr)]];
		ctrlSetText [31, format[localize "STRS_dialogandere_steuerdialog_magazinsteuer", ((round(sliderPosition 32)) call ISSE_str_IntToStr)]];
		ctrlSetText [41, format[localize "STRS_dialogandere_steuerdialog_waffesteuer", ((round(sliderPosition 42)) call ISSE_str_IntToStr)]];
		ctrlSetText [51, format[localize "STRS_dialogandere_steuerdialog_banksteuer", ((round(sliderPosition 52)) call ISSE_str_IntToStr)]];
		sleep 0.1;
	};
};

if (_art == "copmenu") then
{
	if (!(createDialog "CopMenu")) exitWith {hint "Dialog Error!"};
};

if (_art == "copmenulite") then
{
	if (!(createDialog "CopMenuLite")) exitWith {hint "Dialog Error!"};
};

if (_art == "distribute") then

{

if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
private "_j";   /// BUG FIX
for [{_j=0}, {_j < (count INV_VehicleArray)}, {_j=_j+1}] do

	{

	if (!(isNull(INV_VehicleArray select _j))) then

		{

		_vehicle = (INV_VehicleArray select _j);
		_index = lbAdd [1, format["%1 (%2)", _vehicle, typeof _vehicle] ];
		lbSetData [1, _index, format["%1", _vehicle] ];

		};

	};

buttonSetAction [2, "[lbData [1, (lbCurSel 1)]] execVM ""choosecity.sqf"";"];

};

if (_art == "impound") then

{

if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
private "_j"; /// BUG FIX
ctrlSetText [3, "Retrieve impounded vehicle (Cars: $250 - Motorcycles: $75)"];

for [{_j=0}, {_j < (count INV_VehicleArray)}, {_j=_j+1}] do

	{

	_vehicle = (INV_VehicleArray select _j);

	if (!isNull _vehicle and _vehicle distance impoundarea1 < 200) then

		{

		_index = lbAdd [1, format["%1 (%2)", _vehicle, typeof _vehicle] ];
		lbSetData [1, _index, format["%1", _vehicle] ];

		};

	};

buttonSetAction [2, "[lbData [1, (lbCurSel 1)],""buy""] execVM ""impound.sqf"";"];

};

if (_art == "gangmenu") then

{

if (!(createDialog "gang_menu")) exitWith {hint "Dialog Error!";};
private "_i";
for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do

	{

	_gangarray = gangsarray select _i;
	_index = lbAdd [202, format ["%1 - Memberlist: %2", (_gangarray select 0), (_gangarray select 1)]];
	lbSetData [202, _index, format ["%1", (_gangarray select 0)]];

	};

};

if (_art == "gildenverwaltung") then

{

if(!gangleader)exitwith{player groupchat "you are not the gang leader!"};

closedialog 0;

if (!(createDialog "gilde_verwaltung")) exitWith {hint "Dialog Error!";};

_members = [];
private "_i";
for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do {if ((name player) in ((gangsarray select _i) select 1)) exitWith {_members = ((gangsarray select _i) select 1)};};

_index = lbAdd [201, localize "STRS_hints_ja"];
lbSetData [201, _index, "true"];
_index = lbAdd [201, localize "STRS_hints_nein"];
lbSetData [201, _index, "false"];

for [{_i=0}, {_i < (count _members)}, {_i=_i+1}] do

	{

	_member = (_members select _i);
	_obj 	= [_member, civarray] call INV_findunit;

	if(isnull _obj)then{_obj = "notingame"};

	_index = lbAdd [102, (format ["%1 (%2)", _member, _obj])];
	lbSetData [102, _index, (format ["%1", _obj])];

	};

};