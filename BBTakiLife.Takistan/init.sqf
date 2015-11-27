BIS_fnc_init = true;
RandomCode = ["*",(round(random 9)), (round(random 9)), (round(random 9)), "#"];
RandomCodeString = "";
for "_i" from 0 to ((count RandomCode) - 1) do {RandomCodeString = RandomCodeString + (format["%1",(RandomCode select _i)])};
BIS_Effects_Burn=compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";

sleep 0.5;

enableSaving [false, false];
enableEnvironment false;
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
call compile preprocessfile "triggers.sqf";

waitUntil { ( (time > 1) and ((alive player) or (local server)) ) };

_h = [] execVM "playerarrays.sqf";
waitUntil{scriptDone  _h};

_h = [playercount, rolenumber] execVM "initfuncs.sqf";
waitUntil{scriptDone  _h};

_h = [] execVM "facharvest.sqf"; waitUntil {scriptDone _h};
_h = execVM "armitxes\init.sqf"; waitUntil {scriptDone _h};

_h = [playerarray, playerstringarray, !iscop] execVM "INVvars.sqf";
waituntil{scriptDone  _h};

_h = [] execVM "bankexec.sqf";

waitUntil{scriptDone  _h};

_h = [] execVM "workplacesettings.sqf";
waitUntil {scriptDone _h};
if (isServer) then { [0,0,0,["serverloop"]] execVM "hostage.sqf"; };

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

setPitchBank = compile preprocessfile "setPitchBank.sqf";


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
   
for [{_i=0}, {_i < (count INV_ItemShops)}, {_i=_i+1}] do {((INV_ItemShops select _i) select 0) execVM "nomove.sqf"; sleep 0.2;};
for [{_i=0}, {_i < (count workplacejob_deliveryflagarray)}, {_i=_i+1}] do {(workplacejob_deliveryflagarray select _i) execVM "nomove.sqf"; sleep 0.2;};

};

if(!isDedicated) then {
  execVM "specialareas.sqf";
  execVM "armitxes\anticheat.sqf";
  //_bounty = (PLAYERDATA select 7); if(_bounty > 0) then { ["addWarrant",player,"Various Crimes",_bounty] execVM "warrant.sqf"; };
};