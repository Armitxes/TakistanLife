private ["_camera"];

_array = _this select 3;
_art   = _array select 0;
_dollarz  = 'dollarz' call INV_GetItemAmount;

if (_art == "camcontrol") then {
	_camera = _array select 1;
	_zoom   = _array select 2;
	buttonSetAction [25, format["camUseNVG true;"] ];
	buttonSetAction [26, format["camUseNVG false;"] ];
	buttonSetAction [28, format["closeDialog 0;"] ];
	sliderSetRange [10, (_zoom select 0), (_zoom select 1)];
	sliderSetSpeed [10, 0.05, 0.25];
	sliderSetRange [11, 0, 200];
	sliderSetSpeed [11, 0.05, 20];
	_slider1 = 0;
	_slider2 = 0;
	
	while {(ctrlVisible 1050)} do {
		if ( (sliderPosition 10) != _slider1 ) then {_slider1 = (round(sliderPosition 10));};
		if ( (sliderPosition 11) != _slider2 ) then {
			_slider2 = (sliderPosition 11);if (_slider2 < 600) then {setAperture _slider2;}else{setAperture -1;};
		};
		sleep 0.1;
	};
	
	_camera cameraEffect ["terminate","back"];
	titleCut [" ","Black in",1];
	camDestroy _camera;
};