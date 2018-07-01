// new version of assassin mission with vip and guards armed, car,  new spawn locations, bug fixes and more stability by Scripter Wulfer
_secondcounter = 0;
_minutecounter = 0;
_art = (_this select 3) select 0;

if (isNil "workplacejob_hostage_serverarray") then {workplacejob_hostage_serverarray = []};

if (_art == "serverloop") then

{

while {true} do

	{

	for [{_i=0}, {_i < (count workplacejob_hostage_serverarray)}, {_i=_i+1}] do

		{

		if (isNull ((workplacejob_hostage_serverarray select _i) select 0)) then

			{

			if (!(isNull ((workplacejob_hostage_serverarray select _i) select 1))) then

				{

				deleteVehicle ((workplacejob_hostage_serverarray select _i) select 1);
				deletemarker "htargetmarker";

				};

			workplacejob_hostage_serverarray set [_i,""];
			workplacejob_hostage_serverarray = workplacejob_hostage_serverarray - [""];
			sleep ((workplacejob_hostage_break)*60);
			workplacejob_hostage_active = false;
			publicvariable "workplacejob_hostage_active";

			};

		};
	sleep 10;

	};

};

if (_art == "getajob_hostage") then

{
_copplayernumber = playersNumber west;
if (_copplayernumber < 3)exitWith{hintSilent "There are not enough cops on to start the hostage mission!"};
if(workplacejob_hostage_active)exitWith{hintSilent "There are currently no more hostages.";};
if(workplacejob_hostage_failed)exitWith{hintSilent "You have failed a hostage mission recently, maybe you can do it again later.";};

_a1	= 0;
//delete any left overs from last time this ran
deletemarker "htargetmarker";
deletevehicle hostage1;


//creating VIP
_group = createGroup east;
hostage1 = _group createUnit ["Functionary1_EP1", (getMarkerPos "hostagespawn"), [], 10, "FORM"];
hostage1 setvehicleinit 'hostage1 = this;this setVehicleVarName "hostage1";';

processInitCommands;

format["workplacejob_hostage_serverarray = workplacejob_hostage_serverarray + [[%1, hostage1]];", player] call broadcast;

_markerobj = createMarker ["htargetmarker",[0,0]];
_markername= "htargetmarker";
_markerobj setMarkerShape "ICON";
"htargetmarker" setMarkerType "Marker";
"htargetmarker" setMarkerColor "ColorRed";
"htargetmarker" setMarkerText "Hostage target";
_markername SetMarkerPos _start;

workplacejob_hostage_active = true; publicvariable "workplacejob_hostage_active";

hintSilent "The Hostage is marked on the map, don't let the police get you.";

"if (iscop) then {player sideChat ""Someone is trying to take a hostage. The hostage has been marked on the map. Arrest the hostage taker before its too late!""};" call broadcast;

hintSilent "The police are on to you, hurry up!";
["addWarrant",player,"Kidnapping a VIP",5000] execVM "warrant.sqf";

while {true} do {
  "htargetmarker" setmarkerpos getpos hostage1;
	if (_minutecounter >= 750 and alive player) exitWith {
		[50000] call setMoney;
		hintSilent "Well done, you kept the hostage for 15 minutes, $50000 has been transfered to your account.";
		sleep 10;
		"server globalchat ""Hostage Taker WINS, he kept the hostage for 15 minutes."";" call broadcast;
		sleep 1;
		deletevehicle hostage1;
		deletemarker "htargetmarker";
		_minutecounter = 0;
		deleteGroup _group;
	};

	if (!alive hostage1 and alive player) exitWith {
		hintSilent "Hostage has been killed, No one WINS!!";
		sleep 5;
		"server globalchat ""The Hostage has been Killed, No one WINS!"";" call broadcast;
		deletevehicle hostage1;
		deletemarker "htargetmarker";
    deleteGroup _group;
  };

	if(hostage1 distance getmarkerpos "hostagezone" > 150) exitWith {

		"
		server globalchat ""The Hostage taker has fled the area! Cops get $5000"";
		_copbonus = 5000;
		if (iscop) then {[_copbonus] call setMoney; player sidechat format[""you received $%1 for hostage taker fleeing the area"", _copbonus];};
		" call broadcast;
		sleep 2;
		hintSilent "You fled the area with the hostage, stay in the zone next time, mission failed!";
		workplacejob_hostage_failed = true;
		deletevehicle hostage1;
		deletemarker "htargetmarker";
    deleteGroup _group;


		};


	if(player distance hostage1 > 150) exitwith

		{

		"
		server globalchat ""The Hostage taker has lost!"";
		_copbonus = 20000;
		if (iscop) then {[_copbonus] call setMoney; player sidechat format[""you received $%1 for the successful rescue of the hostage"", _copbonus];};
		" call broadcast;
		sleep 2;
		hintSilent "The Hostage was rescued, mission failed!";
		workplacejob_hostage_failed = true;
		deletevehicle hostage1;
		deletemarker "htargetmarker";
    deleteGroup _group;

		};





	_minutecounter = _minutecounter + 1;
	_secondcounter = _secondcounter + 1;
	sleep 1;

	};
deletevehicle hostage1;
deletemarker "htargetmarker";

sleep ((workplacejob_hostage_break)*60);
workplacejob_hostage_active = false;
publicvariable "workplacejob_hostage_active";

if (workplacejob_hostage_failed) then

	{

	sleep ((workplacejob_hostage_break)*60);
	workplacejob_hostage_failed = false;

	};

};

// written by Wulfer, template by Eddie Vedder
