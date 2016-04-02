waitUntil {(alive player)};

civstatsdone = false;

'

if(local server) then

{

publicVariable "gangsarray";
civstatsdone=true; publicVariable "civstatsdone";

};

' call broadcast;

waituntil {civstatsdone};

waitUntil {JIP_Stats_Ready};
if (isdead == 1 and isciv) then {player setpos getpos deadcamlogic;[] execVM "rejoincamera.sqf";};