// script by eddiev223 and cobra//additions by Gman

_selection = ((_this select 3)select 0);

_moneyearned = 0;
_distance = 0;


if (_selection == "start") then
{

pmissionactive = true;
deleteMarkerLocal "patrolmarker";


_newmarker = (floor(random(count coppatrolarray)));
_markerlocation = (coppatrolarray select _newmarker);

_markerobj = createmarkerlocal ["patrolmarker",[0,0]];
_markername = "patrolmarker";
_markerojb setmarkershapelocal "Icon";
//"patrolmarker" setMarkerBrushLocal "solid";
"patrolmarker" setmarkertypelocal "warning";
"patrolmarker" setmarkercolorlocal "coloryellow";
"patrolmarker" setmarkersizelocal [1, 1];
"patrolmarker" setmarkertextlocal "Patrol point";
_markername Setmarkerposlocal _markerlocation;

player sidechat "Your patrol mission will be available shortly, simply get to the patrol point, time is not a factor in how large the payment is.";

sleep 2;
_plocation = getpos player;
_distance = _plocation distance _markerlocation;

while {pmissionactive} do

	{

	if (player distance _markerlocation <= 30) then
		{
		deleteMarkerLocal "patrolmarker";
		_moneyearned = (ceil(_distance * patrolmoneyperkm));
		[_moneyearned] call setMoney;
		player sidechat format["You earned $%1 for patroling", _moneyearned];
		player sidechat "please wait a moment for a new patrol point";

		sleep 5;

		_newmarker = (floor(random(count coppatrolarray)));
		_markerlocation = (coppatrolarray select _newmarker);

		_markerobj = createmarkerlocal ["patrolmarker",[0,0]];
		_markername = "patrolmarker";
		_markerojb setmarkershapelocal "icon";
		//"patrolmarker" setMarkerBrushLocal "solid";
		"patrolmarker" setmarkertypelocal "warning";
		"patrolmarker" setmarkercolorlocal "coloryellow";
		"patrolmarker" setmarkersizelocal [1, 1];
		"patrolmarker" setmarkertextlocal "Patrol point";
		_markername Setmarkerposlocal _markerlocation;
		player sidechat "New Patrol point added";

		_plocation = getpos player;
		_distance = _plocation distance _markerlocation;


		};

	sleep 5;
	};
deleteMarkerLocal "patrolmarker";



};

if (_selection == "end") then
{
  pmissionactive = false;
  deleteMarkerLocal "patrolmarker";
  player sidechat "Patrol mission ended you must wait 60s to get a new one";
  patrolwaittime = true;
  sleep 60;
  patrolwaittime = false;
};


