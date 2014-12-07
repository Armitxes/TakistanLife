waitUntil {(alive player)};

civstatsdone = false;

'

if(local server) then

{

publicvariable "gangsarray";
civstatsdone=true; publicVariable "civstatsdone";

};

' call broadcast;

waituntil {civstatsdone};

waitUntil {JIP_Stats_Ready};
if (isdead == 1 and isciv) then {player setpos getpos deadcamlogic;[] execVM "rejoincamera.sqf";};
if(time > 20)then{skiptime (currentTime - daytime)};
