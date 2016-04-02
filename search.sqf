_art = ((_this select 3) select 0);

if (_art == "getajob_search") then

{

if (alreadygotaworkplacejob == 2)    exitWith

	{

	hintSilent localize "STRS_workplacemission_searchalready";

	};

if (alreadygotaworkplacejob == 1)    exitWith

	{

	hintSilent localize "STRS_workplacemission_search_alreadydelivery";

	};

if (workplacejob_search_cancel == 1) exitWith

	{

	hintSilent localize "STRS_workplacemission_nochgesperrt";

	};

alreadygotaworkplacejob = 2;
_searchjob      = floor(random(count workplacejob_searchmessages));
_searchmsg      = (workplacejob_searchmessages select _searchjob);
_searchobj      = (workplacejob_searchobjects  select _searchjob);
searchname     = (searchnamearray select _searchjob);
_objposarray    = workplacejob_searchpos select (floor(random(count workplacejob_searchpos)));
_objectlogic    = _objposarray select 0;
_objectposition = getpos (_objectlogic);
_objectradius   = _objposarray select 1;
_objectradius2  = _objposarray select 2;
_searchobject = _searchobj createVehicleLocal [((_objectposition select 0)+(random(_objectradius)-random(_objectradius))), ((_objectposition select 1)+(random(_objectradius2)-random(_objectradius2))), _objectposition select 2];
hintSilent _searchmsg;
_action            = 0;
_action2	   = 0;
_distancenachricht = 0;
_money             = searchjobsuccess;
cash               = searchjobsuccess;
timetaken          = 0;
inf		   = 0;

while {true} do

	{

	if ((player distance workplace_getjobflag_1 <= 5) and (alreadygotaworkplacejob == 2) and (_action == 0)) then

		{

		workplace_searchaction_cancel = player addAction [localize "STRS_workplacemission_addaction_searchjob_cancel", "search.sqf", ["canceljob_search", _searchobject]];

		_action = 1;

		};

	if ((((player distance workplace_getjobflag_1 > 8) or (alreadygotaworkplacejob == 0)) and (_action == 1))) then

		{

		player removeAction workplace_searchaction_cancel;

		_action = 0;

		};

	if (vehicle player != player and _action2 == 1) then

		{

		player removeaction searchinfoaction;
		veh = vehicle player;
		searchinfoaction = veh addAction ["Toggle search mission info", "search.sqf", ["info"]];

		_action2 = 0;

		};

	if (vehicle player == player and _action2 == 0) then

		{

		veh removeaction searchinfoaction;
		searchinfoaction = player addAction ["Toggle search mission info", "search.sqf", ["info"]];

		_action2 = 1;

		};

	if ((player distance _searchobject < 15) and (_distancenachricht == 0)) then

		{

		hintSilent localize "STRS_workplacemission_searchjob_targetreached";

		_distancenachricht = 1;

		};

	if (player distance _searchobject >= 15) then

		{

		_distancenachricht = 0;

		};

	if ((player distance _searchobject) < 7) exitWith

		{

		player removeaction finishsearchjobaction;

		veh removeaction searchinfoaction;
		player removeaction searchinfoaction;

		deletevehicle _searchobject;

		hintSilent format[localize "STRS_workplacemission_search_finish", (_money call ISSE_str_IntToStr)];

		['dollarz', _money] call INV_AddInventoryItem;

		alreadygotaworkplacejob = 0;

		};

	if (_money > searchjobmin and player distance suchlogik < 200) then {_money = _money - 100; cash = _money};

	if (alreadygotaworkplacejob == 0) exitWith {};

	if(player distance suchlogik < 250)then{timetaken = timetaken + 1};

	sleep 1;

	};

};


if (_art == "canceljob_search") then

{

veh removeaction searchinfoaction;
player removeaction searchinfoaction;
deletevehicle ((_this select 3) select 1);
hintSilent format[localize "STRS_workplacemission_search_cancel", (workplacejob_search_cancelsperre call ISSE_str_IntToStr)];
alreadygotaworkplacejob = 0;
player REMOVEACTION workplace_searchaction_cancel;
workplacejob_search_cancel = 1;
sleep (workplacejob_search_cancel*60);
workplacejob_search_cancel = 0;

};

if (_art == "info") then

{

if(inf == 0)then{inf=1}else{inf=0; hint "";};

while{inf == 1 and alreadygotaworkplacejob == 2 and alive player} do

	{

	hint format["Find: %1\nTime taken: %2 seconds\nPay: $%3", searchname, timetaken, cash];

	sleep 1;

	};

inf=0;

};




