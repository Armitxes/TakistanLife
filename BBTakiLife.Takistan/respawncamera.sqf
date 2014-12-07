_kameraende = 0;
deadcam     = 1;
_camera = "camera" camcreate [(getpos role select 0),(getpos role select 1)+10,(getpos role select 2)+10];
_camera cameraEffect ["internal", "back"];
_camera camSetPos [(getpos role select 0),((getpos role select 1)+10),(getpos role select 2)+10];
_camera camSetTarget role;
_camera camSetFOV 0.700;
_camera camCommit 0;
waitUntil {camCommitted _camera};
_camera camSetPos [(getpos role select 0),((getpos role select 1)+10),(getpos role select 2)+10];
_camera camSetTarget role;
_camera camSetFOV 0.700;
_camera camCommit 10;
waitUntil {camCommitted _camera};
_camera camPreload 5;
waitUntil {camPreloaded _camera};
_camera camSetPos (deadcam_position_array select deadcam_kameraposition);
_camera camSetTarget (deadcam_target_array select deadcam_kameraposition);
_camera camSetFOV 0.700;_camera camCommit 0;waitUntil {camCommitted _camera};

_deadtime   = (time+DeadWaitSec+extradeadtime);

if (iscop) then
{
titleText [format[localize "STRS_deadcam_deadwait_cop", round(DeadWaitSec+extradeadtime)], "plain"];
}
else
{
titleText [format[localize "STRS_deadcam_deadwait_civ", deadtimes, round(DeadWaitSec), CivsKilled+CopsKilled, extradeadtime, SelfKilled], "plain"];
};

[_deadtime] spawn

{

_deadtime = _this select 0;

sleep 10;

if(suicided and !iscop)then{titletext[format["Because you suicided this round your spawn time has increased by %1 seconds.", suicidepenalty], "plain"]};

sleep 10;

while {_deadtime > time} do

	{

	titletext [format["%1 seconds remaining", round(_deadtime - time)], "plain"];

	sleep 1;

	};

};

while {true} do

{

deadcam_kameraposition = deadcam_kameraposition + 1;

if (count deadcam_position_array <= deadcam_kameraposition) then

	{

	deadcam_kameraposition = 0;

	};

_kamerapos    = deadcam_position_array select deadcam_kameraposition;
_kameratarget = deadcam_target_array   select deadcam_kameraposition;

if (_deadtime < time) exitWith {deadcam = 0;};

_camera camSetPos _kamerapos;
_camera camSetTarget _kameratarget;
_camera camSetFOV 0.700;
_camera camCommit deadcam_wechsel_dauer;

waitUntil {(camCommitted _camera) or (_deadtime < time)};

};

_camera cameraEffect ["terminate","back"];
titleCut [" ","Black in"];
camDestroy _camera;
titlefadeout 0;
0 cutfadeout 0;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 5;

extradeadtime = 0;