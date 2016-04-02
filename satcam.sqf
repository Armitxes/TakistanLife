_Position = _this select 0;
CAM_FreecamMoveTime = 1;
FreeCamera = "camera" camCreate _Position;
FreeCamera cameraEffect ["internal", "back"];
FreeCamera camSetFOV 0.700;
FreeCamera camPreload 5;
FreeCamera camCommit 0;
FreeCamera setVectorUp [(sin 0)*(cos -89),-(sin -89),(cos 0)*(cos -89)];
waitUntil {camCommitted FreeCamera};

if (!(createDialog "free_cam")) exitWith {hint "Dialog Error!";};

CAM_FreeCamActive = true;

(findDisplay 2001) displaySetEventHandler["KeyDown", 'nul = _this spawn

{

switch (_this select 1) do

	{

	case 17: {FreeCamera camsetpos [(getpos FreeCamera select 0),     (getpos FreeCamera select 1)+100, (getpos FreeCamera select 2)]; FreeCamera camCommit CAM_FreecamMoveTime;};
	case 30: {FreeCamera camsetpos [(getpos FreeCamera select 0)-100, (getpos FreeCamera select 1),     (getpos FreeCamera select 2)]; FreeCamera camCommit CAM_FreecamMoveTime;};
	case 32: {FreeCamera camsetpos [(getpos FreeCamera select 0)+100, (getpos FreeCamera select 1),     (getpos FreeCamera select 2)]; FreeCamera camCommit CAM_FreecamMoveTime;};
	case 31: {FreeCamera camsetpos [(getpos FreeCamera select 0),     (getpos FreeCamera select 1)-100, (getpos FreeCamera select 2)]; FreeCamera camCommit CAM_FreecamMoveTime;};
	case 33: {FreeCamera camsetpos (getpos FreeCamera); FreeCamera camCommit 0;};

	};

};

'];

buttonSetAction [21, format["FreeCamera camsetpos [(getpos FreeCamera select 0)-100, (getpos FreeCamera select 1),     (getpos FreeCamera select 2)]; FreeCamera camCommit CAM_FreecamMoveTime;"] ];
buttonSetAction [22, format["FreeCamera camsetpos [(getpos FreeCamera select 0),     (getpos FreeCamera select 1)+100, (getpos FreeCamera select 2)]; FreeCamera camCommit CAM_FreecamMoveTime;"] ];
buttonSetAction [23, format["FreeCamera camsetpos [(getpos FreeCamera select 0),     (getpos FreeCamera select 1)-100, (getpos FreeCamera select 2)]; FreeCamera camCommit CAM_FreecamMoveTime;"] ];
buttonSetAction [24, format["FreeCamera camsetpos [(getpos FreeCamera select 0)+100, (getpos FreeCamera select 1),     (getpos FreeCamera select 2)]; FreeCamera camCommit CAM_FreecamMoveTime;"] ];
buttonSetAction [25, format["camUseNVG true;"] ];
buttonSetAction [26, format["camUseNVG false;"] ];
buttonSetAction [27, format["FreeCamera camsetpos (getpos FreeCamera); FreeCamera camCommit 0;"] ];
buttonSetAction [28, format["closeDialog 0;"] ];
sliderSetRange [10, 175, 1500];
sliderSetSpeed [10, 100, 250];
sliderSetRange [11, 0, 200];
sliderSetSpeed [11, 0.05, 20];

_slider1 = 0;
_slider2 = 0;

while {(ctrlVisible 1029)} do

{

if ( (round(sliderPosition 10)) != _slider1 ) then

	{

	_slider1 = (round(sliderPosition 10));
	FreeCamera camsetpos [(getpos FreeCamera select 0), (getpos FreeCamera select 1), _slider1]; FreeCamera camCommit CAM_FreecamMoveTime;

	};

if ( (sliderPosition 11) != _slider2 ) then

	{

	_slider2 = (sliderPosition 11);
	if (_slider2 < 600) then {setAperture _slider2;} else {setAperture -1;};

	};

sleep 0.1;

};

setAperture -1;
CAM_FreeCamActive = false;
FreeCamera cameraEffect ["terminate", "back"];
titleCut [" ","Black in",1];
camDestroy FreeCamera;

