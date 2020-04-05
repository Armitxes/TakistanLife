_array = _this select 3;
_art   = _array select 0;
_dollarz  = 'dollarz' call INV_GetItemAmount;_zusatzString = "";

if ((count _array)>1) then { _zusatzString = _array select 1; };

switch (_art) do {
    case "bail": {
	if (!(createDialog "baildialog")) exitWith {hint "Dialog Error!";};
	sliderSetRange [2, 100, 250000];		sliderSetSpeed [2, 1, 50];

	while {(ctrlVisible 1008)} do
	{
	    ctrlSetText [1, format["$%1", ((round(sliderPosition 2)) call ISSE_str_IntToStr)]];
	    sleep 0.3;
	};
    };
    case "wantedrelease": {
	if (!(createDialog "wantedrelease")) exitWith {hint "Dialog Error!";};
	[2, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, 0];

	// Change this and I'll fcking kill you ;)
	_list = lbAdd [4, "Crime not in List"]; lbSetData [4,_list,"1000"];
	if(iscop) then {
	    _list = lbAdd [4, "Murder"]; lbSetData [4,_list,"10000"];
	    _list = lbAdd [4, "Hit and Run"]; lbSetData [4,_list,"10000"];
	    _list = lbAdd [4, "Bribery"]; lbSetData [4,_list,"2000"];
	    _list = lbAdd [4, "VIP Assassination"]; lbSetData [4,_list,"10100"];
	    _list = lbAdd [4, "Bank/Casino Robbery"]; lbSetData [4,_list,"7000"];
	    _list = lbAdd [4, "Breach of Highway Code"]; lbSetData [4,_list,"500"];
	    _list = lbAdd [4, "Evading a Police Checkpoint"]; lbSetData [4,_list,"2000"];
	    _list = lbAdd [4, "Evading the Police"]; lbSetData [4,_list,"3000"];
	    _list = lbAdd [4, "Theft of Civilian Vehicle"]; lbSetData [4,_list,"1500"];
	    _list = lbAdd [4, "Assault"]; lbSetData [4,_list,"5000"];
	    _list = lbAdd [4, "Rioting"]; lbSetData [4,_list,"3000"];
	    _list = lbAdd [4, "Perverting the Course of Justice"]; lbSetData [4,_list,"500"];
	    _list = lbAdd [4, "Robbery"]; lbSetData [4,_list,"4000"];
	    _list = lbAdd [4, "Attempted Murder"]; lbSetData [4,_list,"5000"];
	    _list = lbAdd [4, "Attempted Vehicle Theft"]; lbSetData [4,_list,"1000"];
	    _list = lbAdd [4, "Possession of Illegal Weapon"]; lbSetData [4,_list,"3000"];
	    _list = lbAdd [4, "Anti Social Behaviour"]; lbSetData [4,_list,"200"];
	    _list = lbAdd [4, ""]; lbSetData [4,_list,"0"];
	    _list = lbAdd [4, "Assisting a Jail Break"]; lbSetData [4,_list,"7000"];
	    _list = lbAdd [4, "Arson"]; lbSetData [4,_list,"5000"];
	    _list = lbAdd [4, "Kidnap"]; lbSetData [4,_list,"6000"];
	    _list = lbAdd [4, "Manslaughter"]; lbSetData [4,_list,"5000"];
	    _list = lbAdd [4, "Breach of Aviation Law"]; lbSetData [4,_list,"750"];
	};
	_list = lbAdd [4, "Theft of UN/Cop Vehicle"]; lbSetData [4,_list,"1700"];
	_list = lbAdd [4, "Illegal Border Crossing"]; lbSetData [4,_list,"2500"];
	_list = lbAdd [4, "Crimes Against Humanity"]; lbSetData [4,_list,"18000"];
    _list = lbAdd [4, "Abuse of Emergency call"]; lbSetData [4,_list,"1500"];
	_list = lbAdd [4, "Possession of Class A Drug"]; lbSetData [4,_list,"8000"];
	_list = lbAdd [4, "Possession of Class B Drug"]; lbSetData [4,_list,"6000"];
    _list = lbAdd [4, "Slavery"]; lbSetData [4,_list,"10000"];
	_list = lbAdd [4, "Terrorism"]; lbSetData [4,_list,"18000"];

	lbSetCurSel [4, 0];

	while {ctrlVisible 1007} do
	{
		sleep 0.3;
	};
    };
    case "generalstats": {
		if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
		_trennlinie = "---------------------------------------------";
		lbAdd [1, _trennlinie];
		lbAdd [1, "GENERAL INFO"];
		lbAdd [1, _trennlinie];
		lbAdd [1, format ["Date: %3.%2.%1", (date select 0), (date select 1), (date select 2)]];

		_npcCount = 0; _medCount = 0; _judCount = 0; _lawyerCount = 0;
		{ if (!isPlayer _x) then { _npcCount = _npcCount + 1; }; } forEach (nearestObjects [[6453,8127,0],["Man"], 10000]);
		{
			if((typeOf _x) in ["Dr_Hladik_EP1","USMC_LHD_Crew_Blue","Doctor","Worker2"]) then { _medCount = _medCount + 1; };
			if((typeOf _x) == "SchoolTeacher") then { _judCount = _judCount + 1; };
			if((typeOf _x) == "RU_Functionary2") then { _lawyerCount = _lawyerCount + 1; };
		} forEach playableUnits;
		lbAdd [1, format ["There are %1 active NPCs",_npcCount]];
		lbAdd [1, format["There are %1 Medics online!",_medCount]];
		lbAdd [1, format["There are %1 Judges online!",_judCount]];
		lbAdd [1, format["There are %1 Lawyers online!",_lawyerCount]];
		lbAdd [1, ""];
		lbAdd [1, _trennlinie];
		lbAdd [1, "SERVER STATUS"];
		lbAdd [1, _trennlinie];
		lbAdd [1, format ["Runtime: %1 minutes", (round(time/60))]];
		if (!isNil "svrStats") then {
			svrFPS = svrStats select 0;
			svrDelay = svrStats select 1;
			svrPerf = "Perfect";
			if(svrFPS < 1.9) then {
				svrPerf = "Good";
				if(svrFPS < 1.3) then {
					svrPerf = "Average";
					if(svrFPS < 1.01) then {
						svrPerf = "Bad - Consider Restart";
						if(svrFPS < 0.8) then { svrPerf = "Critical - RESTART NEEDED!"; };
						hintSilent parseText format['Server Performance<br /><t size="1.4" color="#E62B2B">%4</t><br /><br />Server delay: %1m<br />Server FPS: %2<br />Client FPS: %3<br /><br />The lower the evaluation, the higher the desync and lagg!',round((time/60)-(svrDelay/60)),svrFPS,diag_fps,svrPerf];
					};
				};
			};

			lbAdd [1, format ["Performance (FPS): %1 (%2)",svrPerf,svrFPS]];
			lbAdd [1, format ["Server Delay: %1m",round((time/60)-(svrDelay/60))]];
			lbAdd [1, ""];
		};

		lbAdd [1, _trennlinie];
		lbAdd [1, "CLIENT STATUS"];
		lbAdd [1, _trennlinie];
		lbAdd [1, format ["FPS: %1",diag_fps]];
		lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_deaths", deadtimes]];
		lbAdd [1, format ["Respawn time: %1 seconds",round(DeadWaitSec+extradeadtime)]];
    };
    case "spielerliste": {
	_money = "dollarz" call INV_GetItemAmount;
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	lbAdd [1, "------- ~ Logfile Shortcuts ~ -------"];
	lbAdd [1, "[SHIFT+1] Performance | [SHIFT+2] Finances | [SHIFT+3] Crimes | [SHIFT+4] Police Actions"];
	_trennlinie = "---------------------------------------------";
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_playerinfo"];
	lbAdd [1, _trennlinie];
	lbAdd [1, format ["Money: $%1",_money]];
	lbAdd [1, format ["Savings: $%1",((PLAYERDATA select 1) call ISSE_str_IntToStr)]];
	lbAdd [1, format ["%1: %2/%3", localize "STRS_statdialog_weight", (call INV_GetOwnWeight), INV_Tragfaehigkeit]];

	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_licenselist"];
	for [{_i=0}, {_i < (count INV_Lizenzen)}, {_i=_i+1}] do
	{
		if (((INV_Lizenzen select _i) select 0) call INV_HasLicense) then
		{
		    _license = ((INV_Lizenzen select _i) select 2);
		    if(_license == "Drivers License")then{_license = format ["%1 [%2/12]",_license,demerits];};
		    if(_license == "Truck License")then{_license = format ["%1 [%2/12]",_license,truckDemerits];};
		    lbAdd [1,_license];
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

	lbAdd [1, "B A N K - & - CASINO SAFE"];
	lbAdd [1, (format ["Est. total funds in the main bank safe: $%1", robsafes select 0])];
	lbAdd [1, (format ["Est. total funds in the casino safe: $%1", robsafes select 1])];
	if (time_bank_rob_lockdown > time) then { lbAdd [1, (format ["Bank lockdown: %1 seconds.", (time_bank_rob_lockdown-time)])]; };
	if (time_casino_rob_lockdown > time) then { lbAdd [1, (format ["Casino lockdown: %1 seconds.", (time_casino_rob_lockdown-time)])]; };
	if (time_bank_lockout > time) then { lbAdd [1, (format ["Bank lockout time remaining: %1 seconds.", (time_bank_lockout-time)])]; };

	lbAdd [1,""];lbAdd [1,""];
	lbAdd [1, _trennlinie];
	lbAdd [1, "GOVERNMENT"];
	lbAdd [1, _trennlinie];
	if (not(MayorNumber == -1)) then
	{
		lbAdd [1,format["Prime Minister: %1",name (playerarray select MayorNumber)]];
	} else { lbAdd [1,"There is no elected Prime Minister"]; };
	if(!isNil "sgov") then {
		lbAdd [1, "South Leader: " + name (leader sgov)];
	} else { lbAdd [1,"There is no south leader"]; };
	if (not(chiefNumber == -1)) then
	{
	lbAdd [1,format["Chief Constable: %1",name (playerarray select chiefNumber)]];
	} else { lbAdd [1,"There is no elected Chief Constable"]; };

	lbAdd [1, format ["Next elections: %1 minutes",round((lastElection+35)-(time/60))]];

	lbAdd [1, "   " + _trennlinie];
	lbAdd [1, "    Laws [North & South]"];
	lbAdd [1, "   " + _trennlinie];
	_i = 0;
	{
		if (!(_x == "")) then
		{
			_i = _i + 1;
			lbAdd [1, (format ["   %1: %2", _i, _x])];
		};
	} forEach (GesetzArray select 0);
	lbAdd [1, "   " + _trennlinie];
	_i = 0;
	{
		if (!(_x == "")) then
		{
			_i = _i + 1;
			lbAdd [1, (format ["   %1: %2", _i, _x])];
		};
	} forEach (GesetzArray select 1);
	lbAdd [1, "   " + _trennlinie];
	_totalTaxes = 0;
	{
		if ((_x select 2) > 0) then
		{
		    _tax = (_x select 2); if ((_x select 1) == "Vehicle") then { _tax = _tax * 1.5; };
		    _totalTaxes = _totalTaxes + _tax;
		    lbAdd [1, format["%1 Tax: %2", (_x select 1), (_x select 2)] + "%" ];
		};
	} forEach INV_ItemTypenArray;
	_totalTaxes = _totalTaxes + (bank_steuer * 0.5);
	lbAdd [1, format["Transfer Tax: %1", bank_steuer] + "%" ];

	protesters = protesters - [objNull];
	_civNum = (civilian countSide playableUnits);
	if(_civNum > 0) then { _totalTaxes = round(_totalTaxes + (((count protesters) * 100) / _civNum)) };
	lbAdd [1, format ["Protesters against PM: %1/300",_totalTaxes]];
	lbAdd [1, _trennlinie];
	if (mlaw) then {
	lbAdd [1, "MARTIAL LAW IS IN EFFECT"];}
	else {
	lbAdd [1, "MARTIAL LAW IS NOT IN EFFECT"];};

	lbAdd [1,""];lbAdd [1,""];
	lbAdd [1, _trennlinie];
	lbAdd [1, "O I L  D E M A N D"];
	if (isNil "oildemand") then {
	lbAdd [1,"Oil Barrel Trader demand: 1"];}
	else {
	lbAdd [1, format["Oil Barrel Trader demand: %1", oildemand]];};

	lbAdd [1, _trennlinie];
	lbAdd [1, "W A N T E D:"];
	lbAdd [1, _trennlinie];

	for [{_i=0}, {_i < (count warrantarray)}, {_i=_i+1}] do
	{
		_singleWarrant = warrantarray select _i;
		_idCiv = _singleWarrant select 0;
		_pReason = _singleWarrant select 1;
		_pBounty = _singleWarrant select 2;

		lbAdd [1,(format ["%1 %2 ( Cop Bounty: %3, Jail Time: %4 min/s,Total Bail : %5): is wanted for :", _idCiv, (name _idCiv), _pBounty, round (_pBounty/(16.5*60)),(_pBounty*4)])];
		lbAdd [1,(format ["  %1", _pReason])];
	};
	lbAdd [1, _trennlinie];

	lbAdd [1,""];lbAdd [1,""];
	lbAdd [1, _trennlinie];
	lbAdd [1, "G A N G S:"];
	lbAdd [1, _trennlinie];

	for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do {
		_gangarray = gangsarray select _i;
		_gangname  = _gangarray select 0;
		_grp = _gangarray select 1;
		_members   = units _grp;
		_territory = "";

		{
			_control = _x getVariable "control";
			if (!(isNil "_control")) then {
				if (_control == _grp) then {
					_territory = _territory + (str _x) + ", ";
				};
			};
		} forEach [gangarea1,gangarea2,gangarea3];
		if (_territory == "") then { _territory = "None"; };

		lbAdd [1, format["%1 - Territory: %2 - Members:", _gangname, _territory]];
		{
			if (_x == leader _grp) then {
				lbAdd [1, format["%1 (Leader)",name _x]];
			} else {
				lbAdd [1, format["%1",name _x]];
			};
		} forEach _members;
	};
    };
    case "inventorycheck": {
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

    case "gesetz": {
		if (!(createDialog "gesetzdialog")) exitWith {hint "Dialog Error!";};
		{
			_index = lbAdd [1, _x];
			lbSetData [1, _index, _x];
		} forEach (GesetzArray select 0);
		while {ctrlVisible 1020} do
		{
			_selected = lbCurSel 1;
			ctrlSetText [2, lbText [1, _selected]];
			waitUntil {((!(_selected == lbCurSel 1)) or (!(ctrlVisible 1020)))};
		};
    };

    case "coplog": {
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
	    lbAdd [1, (format ["%1 %2 ( Cop Bounty: %3, Jail Time: %4 min/s,Total Bail : %5): is wanted for :", _idCiv, (name _idCiv), _pBounty, round (_pBounty/(16.5*60)),(_pBounty*4)])];
	    lbAdd [1,(format ["  %1", _pReason])];
	};
	lbAdd [1, _trennlinie];
    };

    case "wahlen": {
		if (!(createDialog "wahldialog")) exitWith {hint "Dialog Error!";};
		_array = [0, 1, true, false] call DialogSpielerListe;
		lbSetCurSel [1, _array select 1];
    };

    case "chief": {
		if (!(createDialog "chiefdialog")) exitWith {hint "Dialog Error!";};
		_arrayc = [0, 1, true, false] call DialogSpielerListe;
		lbSetCurSel [1, _arrayc select 1];
    };

	case "steuern": {
		if (!(createDialog "steuerdialog")) exitWith {hint "Dialog Error!";};
		sliderSetSpeed [12, 1, 5];
		sliderSetRange [12, 0, 20];
		sliderSetPosition [12,((INV_ItemTypenArray select 0) select 2)];
		sliderSetSpeed [22, 1, 5];		sliderSetRange [22, 1, 20];
		sliderSetPosition [22,((INV_ItemTypenArray select 1) select 2)];
		sliderSetSpeed [32, 1, 5];				sliderSetRange [32, 1, 20];
		sliderSetPosition [32,((INV_ItemTypenArray select 2) select 2)];
		sliderSetSpeed [42, 1, 5];
		sliderSetRange [42, 0, 20];
		sliderSetPosition [42,((INV_ItemTypenArray select 3) select 2)];
		sliderSetSpeed [52, 1, 5];
		sliderSetRange [52, 0, 20];
		sliderSetPosition [52,bank_steuer];
		while {ctrlVisible 1032} do {
			ctrlSetText [11, format[localize "STRS_dialogandere_steuerdialog_itemsteuer", ((round(sliderPosition 12)) call ISSE_str_IntToStr)]];
			ctrlSetText [21, format[localize "STRS_dialogandere_steuerdialog_fahrzeugsteuer", ((round(sliderPosition 22)) call ISSE_str_IntToStr)]];
			ctrlSetText [31, format[localize "STRS_dialogandere_steuerdialog_magazinsteuer", ((round(sliderPosition 32)) call ISSE_str_IntToStr)]];
			ctrlSetText [41, format[localize "STRS_dialogandere_steuerdialog_waffesteuer", ((round(sliderPosition 42)) call ISSE_str_IntToStr)]];
			ctrlSetText [51, format[localize "STRS_dialogandere_steuerdialog_banksteuer", ((round(sliderPosition 52)) call ISSE_str_IntToStr)]];
			sleep 0.1;
		};
	};

    case "copmenu": { if (!(createDialog "CopMenu")) exitWith {hint "Dialog Error!"}; };
    case "copmenulite": { if (!(createDialog "CopMenuLite")) exitWith {hint "Dialog Error!"}; };

    case "distribute": {
	if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
	private "_j";   /// BUG FIX
	for [{_j=0}, {_j < (count INV_VehicleArray)}, {_j=_j+1}] do {
	    if (!(isNull(INV_VehicleArray select _j))) then {
		_vehicle = (INV_VehicleArray select _j);
		_index = lbAdd [1, format["%1 (%2)", _vehicle, typeof _vehicle] ];
		lbSetData [1, _index, format["%1", _vehicle] ];
	    };
	};
	buttonSetAction [2, "[lbData [1, (lbCurSel 1)]] execVM ""choosecity.sqf"";"];
    };

    case "impound": {
	if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
	private "_j"; /// BUG FIX
	ctrlSetText [3, "Retrieve impounded vehicle (Cars: $250 - Motorcycles: $75)"];

	for [{_j=0}, {_j < (count INV_VehicleArray)}, {_j=_j+1}] do {
	    _vehicle = (INV_VehicleArray select _j);
	    if (!isNull _vehicle and _vehicle distance impoundarea1 < 200) then {
		_index = lbAdd [1, format["%1 (%2)", _vehicle, typeof _vehicle] ];
		lbSetData [1, _index, format["%1", _vehicle] ];
	    };
	};
	buttonSetAction [2, "[lbData [1, (lbCurSel 1)],""buy""] execVM ""impound.sqf"";"];
    };

    case "gangmenu": {
		if (!(createDialog "gang_menu")) exitWith {hint "Dialog Error!";};

		_i = 0;
		{
			_name = _x select 0;
			_grp = _x select 1;
			_mems = units _grp;

			if(count _mems > 0) then {
				if (!(isNil "sgov")) then {
					if(sgov == _grp) then {
						if (count _mems > 3 || !(isNil("warStartTime")) ) then {
							_name = "South Government";
						} else { ("hint ""The South Government dropped below 4 members and was dissolved!""; sgov = nil;") call toClients; };
					};
				};
				_txt = format ["%1 [%2 Member] (",_name,count _mems];
				{ _txt = _txt + (name _x) + ","; } forEach _mems;
				_txt = _txt + ")";

				_index = lbAdd [202,_txt];
			} else {
				gangsarray set [_i,-1];
			};
			_i = _i + 1;
		} forEach gangsarray;
		gangsarray = gangsarray - [-1];
    };

    case "gildenverwaltung": {
		_grp = group player;
		if(player != leader _grp)exitWith{hintSilent "You are not the gang leader!"};
		closedialog 0;
		if (!(createDialog "gilde_verwaltung")) exitWith {hint "Dialog Error!";};

		_index = lbAdd [201, localize "STRS_hints_ja"];
		lbSetData [201, _index, "true"];
		_index = lbAdd [201, localize "STRS_hints_nein"];
		lbSetData [201, _index, "false"];

		{
			_index = lbAdd [102, (format ["%1", name _x]) ];
			lbSetData [102, _index, (format ["%1", _x])]
		} forEach (units _grp);
    };

	case "constitution": {
		if (!(createDialog "constitution")) exitWith {hint "Dialog Error!";};
		_trennlinie = "-------------------------------------------------";
		lbAdd [1, ""];
		lbAdd [1, "§ Armitxes Network Rulebook §"];
		lbAdd [1, _trennlinie];
		lbAdd [1, "Hacking & cheating = [ArmA 2, ArmA 3] Network & Player Index Ban"];
		lbAdd [1, "Bug & glitch abusing = [ArmA 2] Network Ban (1 week -> 2 months -> Perma)"];
		lbAdd [1, "Money cheating servers = [ArmA 2, Arma 3] Server & User IP Ban (Permanent)"];
		lbAdd [1, "~ armitxes.net"];
		lbAdd [1, ""];
		lbAdd [1, _trennlinie];
		lbAdd [1, "§ Server Rulebook §"];
		lbAdd [1, _trennlinie];
		lbAdd [1, "Enter your server rules at the bottom of the maindialogs.sqf"];
	};
};
