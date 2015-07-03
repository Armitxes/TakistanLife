BIS_fnc_init = true;
RandomCode = ["*",(round(random 9)), (round(random 9)), (round(random 9)), "#"];
RandomCodeString = "";
for "_i" from 0 to ((count RandomCode) - 1) do {RandomCodeString = RandomCodeString + (format["%1",(RandomCode select _i)])};
BIS_Effects_Burn=compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";

sleep 0.5;

enableSaving [false, false];
WEST setFriend [EAST, 1];
EAST setFriend [WEST, 1];
RESISTANCE setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 1];
RESISTANCE setFriend [WEST, 1];
WEST setFriend [RESISTANCE, 1];
version			= "1.62";
compatible		= 1.62;
enableDebug		= !isDedicated && isServer;
addonversion	= false;
copscount		= 22;
civscount		= 45;
playercount		= 77;
debugarray		= [];
nopop			= true;
canuseshopagain	= 1;
JIP_Stats_Ready = false;

if (isServer) then
{
	warrantarray = [];
	lastElection = 0;
	
	_WahlArray = [];
	for [{_i=0}, {_i < playercount}, {_i=_i+1}] do {_WahlArray = _WahlArray + [ [] ];};
	server setVariable ["PMVote",_WahlArray,true];
	server setVariable ["CCVote",_WahlArray,true];
	_WahlArray = nil;
 };
         
execVM "Simple_house_lights_script.sqf";
call compile preprocessfile "triggers.sqf";

waitUntil { ( (time > 1) and ((alive player) or (local server)) ) };

_h = [] execVM "playerarrays.sqf";
waitUntil{scriptDone  _h};

_h = [playercount, rolenumber] execVM "initfuncs.sqf";
waitUntil{scriptDone  _h};

_h = [] execVM "facharvest.sqf"; waitUntil {scriptDone _h};
_w = execVM "armitxes\init.sqf"; waitUntil {scriptDone _w};

_h = [playerarray, playerstringarray, !iscop] execVM "INVvars.sqf";
waituntil{scriptDone  _h};

_h = [] execVM "bankexec.sqf";

waitUntil{scriptDone  _h};

_h = [] execVM "initWPmissions.sqf";

waitUntil{scriptDone  _h};

_h = [] execVM "gfx.sqf";
waitUntil{scriptDone  _h};
setTerrainGrid(75);

_h = [] execVM "animList.sqf";

waitUntil{scriptDone  _h};

_h = []	execVM "miscfunctions.sqf";

waitUntil{scriptDone  _h};

_h = [] execVM "variables.sqf";

waitUntil{scriptDone  _h};

execVM "BTK\Cargo Drop\Start.sqf"; // Initialize BTK Cargo Drop Script
execVM "BB Elvis towing\Start.sqf"; // Initialize BB Elvis Towing

[SkipTimeDay, SkipTimeNight, 1] execVM "skiptime.sqf";
setPitchBank = compile preprocessfile "setPitchBank.sqf";
publicvariable "station1robbed";
publicvariable "station2robbed";
publicvariable "station3robbed";
publicvariable "station4robbed";
publicvariable "station5robbed";
publicvariable "station6robbed";
publicvariable "station7robbed";
publicvariable "station8robbed";
publicvariable "station9robbed";
publicvariable "station10robbed";


if(!isDedicated) then {

["clientloop"] execVM "clientloop.sqf";
[0,0,0,["clientloop"]] execVM "gangs.sqf";
[] execVM "respawn.sqf";
[] execVM "itemactions.sqf";
[] execVM "petrolactions.sqf";
[] execVM "SpeedCams.sqf";
[] execVM "nametags.sqf";
[] execVM "initplayer.sqf";
[] execVM "salaries.sqf";
[] execVM "actions.sqf";
[] execVM "motd.sqf";
[] execVM "moo.sqf";

for [{_i=0}, {_i < (count INV_ItemFabriken)}, {_i=_i+1}] do {_i execVM "facqueue.sqf"};

player addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun.sqf";}];
player addEventHandler ["handleDamage", {_this call compile preprocessfile "armitxes\setHit.sqf"}];

waituntil{vehicle player == player};
player addEventHandler ["fired",{_this execVM "fired.sqf"}];
[]spawn {
while{true}do
{
	sleep 1;
	if(player getVariable "flashed" and isciv) then
	{
		_fadeInTime   = 0;
		_fadeOutTime  = 5;
		if (not(alive player)) exitWith {};
		titleCut ["","WHITE OUT",0];
		sleep _fadeOutTime;
		titleCut ["","WHITE IN",0];
		sleep 1;
		player setVariable ["flashed",false, true];
	};
};
};

onKeyDown = compile preprocessFile "onKeyDown.sqf";
onKeyPress = compile preprocessFile "onKeyPress.sqf";
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyDown"];
(findDisplay 46) displaySetEventHandler ["KeyUp", "_this call onKeyPress"];

};

if (isServer) then

{

[0, 0, 0, ["serverloop"]] execVM "gangsserverloop.sqf";
[] execVM "druguse.sqf";
[] execVM "drugreplenish.sqf";
[] execVM "robpool.sqf";
[] execVM "governmentconvoy.sqf";
   

//=======================rob gas station init and variables================
[] execVM "stationrobloop.sqf";
station1money = 1000;
publicvariable "station1money";

station2money = 1000;
publicvariable "station2money";

station3money = 1000;
publicvariable "station3money";

station4money = 1000;
publicvariable "station4money";

station5money = 1000;
publicvariable "station5money";

station6money = 1000;
publicvariable "station6money";

station7money = 1000;
publicvariable "station7money";

station8money = 1000;
publicvariable "station8money";

station9money = 1000;
publicvariable "station9money";

station10money = 1000;
publicvariable "station10money";

for [{_i=0}, {_i < (count INV_ItemShops)}, {_i=_i+1}] do {((INV_ItemShops select _i) select 0) execVM "nomove.sqf"; sleep 0.2;};
for [{_i=0}, {_i < (count workplacejob_deliveryflagarray)}, {_i=_i+1}] do {(workplacejob_deliveryflagarray select _i) execVM "nomove.sqf"; sleep 0.2;};

};

if(!isDedicated) then {
  execVM "specialareas.sqf";
  execVM "armitxes\anticheat.sqf";
  //_bounty = (PLAYERDATA select 7); if(_bounty > 0) then { ["addWarrant",player,"Various Crimes",_bounty] execVM "warrant.sqf"; };
};