_deadtime     = (time+DeadWaitSec+extradeadtime);
_kamerapos    = deadcam_position_array select deadcam_kameraposition;
_kameratarget = deadcam_target_array   select deadcam_kameraposition;

_camera = "camera" camcreate _kamerapos;
_camera cameraEffect ["internal", "back"];
_camera camSetPos _kamerapos;
_camera camSetTarget _kameratarget;
_camera camSetFOV 0.700;
_camera camCommit 0;

_deadtime spawn

{

while {_this > time} do

	{

	titletext [format["%1 seconds remaining", round(_this - time)], "plain"];

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

if (_deadtime < time) exitWith {};

_camera camSetPos _kamerapos;
_camera camSetTarget _kameratarget;
_camera camSetFOV 0.700;
_camera camCommit deadcam_wechsel_dauer;

waitUntil {(camCommitted _camera) or (_deadtime < time)};

};

isdead = 0;
extradeadtime = 0;

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