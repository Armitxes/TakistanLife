_art = ((_this select 3) select 0);
if (_art == "getajob_delivery") then

{

if (alreadygotaworkplacejob == 2) exitWith

	{

	hintSilent localize "STRS_workplacemission_searchalready";

	};

if (alreadygotaworkplacejob == 1) exitWith

	{

	hintSilent format [localize "STRS_workplacemission_already", workplacejob_deliveryname];

	};

if(canceltime) exitwith

	{

	hintSilent "You cannot start another delivery mission so soon after failing one!";

	};

canceltime=false;
alreadygotaworkplacejob = 1;
_whereto = floor(random (count workplacejob_deliveryflagarray));
_msg = (workplacejob_deliverymsg select (round(random((count workplacejob_deliverymsg)-1))));
workplacejob_deliveryflag = workplacejob_deliveryflagarray select (_whereto);
workplacejob_deliveryname = workplacejob_deliverynamearray select (_whereto);
while{workplacejob_deliveryflag distance player < 1500}do{_whereto = floor(random (count workplacejob_deliveryflagarray));workplacejob_deliveryflag = workplacejob_deliveryflagarray select (_whereto);workplacejob_deliveryname = workplacejob_deliverynamearray select (_whereto);};
hintSilent format[localize _msg, workplacejob_deliveryname];
workplacemissioninfos = ["Delivery Mission", format["%1", (_whereto+1)]];
timetaken = 0;
_a1 = 0;
_pos = getpos player;
vcl = objnull;
workplacejob_deliverymoney = round(workplacejob_deliveryflag distance _pos)*deliveryjobmulti+500;
if(workplacejob_deliverymoney > workplacejob_courier_maxmoney)then{workplacejob_deliverymoney = workplacejob_courier_maxmoney};
maxtime	= workplacejob_deliverymoney/50;
if(maxtime < deliverymintime)then{maxtime = deliverymintime};

while {true} do

	{


	if (player distance workplacejob_deliveryflag <= 5 and vehicle player == player) exitwith

		{

		player removeaction deliveryinfoaction;
		vcl removeaction deliveryinfoaction;
		hintSilent format[localize "STRS_workplacemission_delivery_finish", (workplacejob_deliverymoney call ISSE_str_IntToStr)];
		hint format["Destination: %1\nTime taken: %2 seconds.\nPay: $%3\nDistance remaining: %4m", workplacejob_deliveryname, timetaken, round workplacejob_deliverymoney, (round(workplacejob_deliveryflag Distance player))];
		['dollarz', round workplacejob_deliverymoney] call INV_AddInventoryItem;
		alreadygotaworkplacejob = 0;
		workplacemissioninfos = ["", ""];

		};

	if (vehicle player != player and _a1 == 1) then

		{

		vcl = vehicle player;
		player removeaction deliveryinfoaction;
		deliveryinfoaction = vcl addAction ["Delivery mission info", "noscript.sqf", 'hint format["Destination: %1\nTime remaining: %2 seconds.\nPay: $%3\nDistance remaining: %4m", workplacejob_deliveryname, round(maxtime - timetaken), round workplacejob_deliverymoney, (round(workplacejob_deliveryflag Distance player))]',1,false,true,"",""];

		_a1 = 0;

		};

	if (vehicle player == player and _a1 == 0) then

		{

		vcl removeaction deliveryinfoaction;
		deliveryinfoaction = player addAction ["Delivery mission info", "noscript.sqf", 'hint format["Destination: %1\nTime remaining: %2 seconds.\nPay: $%3\nDistance remaining: %4m", workplacejob_deliveryname, round(maxtime - timetaken), round workplacejob_deliverymoney, (round(workplacejob_deliveryflag Distance player))]',1,false,true,"",""];

		_a1 = 1;

		};

	timetaken = timetaken + 1;

	if(timetaken > maxtime)exitwith{_art = "cancel"};
	if(alreadygotaworkplacejob == 0)exitwith{};

	sleep 1;

	};

};

if (_art == "cancel") then

{

player removeAction deliveryinfoaction;
player removeAction deliverycancelaction;
vcl removeaction deliveryinfoaction;
hintSilent "delivery mission failed!";
alreadygotaworkplacejob = 0;
workplacemissioninfos = ["", ""];

canceltime=true;
sleep 60;
canceltime=false;

};