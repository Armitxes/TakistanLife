_array = _this select 3;
_art   = _array select 0;

if (_art == "civmenu") then
{
	if (!(createDialog "civmenu")) exitWith {hint "Dialog Error!";};
	civmenu_civ = _array select 1;
	civmenuciv  = _array select 2;
	sliderSetRange [3, 1, 60];
	sliderSetSpeed [3, 1, 5];

	while {ctrlVisible 1006} do {
		ctrlSetText [4,  format[localize "STRS_dialogcivmenu_arrest", ((round(sliderPosition 3)) call ISSE_str_IntToStr) ]];
		sleep 0.3;
	};
};

if (_art == "uninteraktion") then {
	if (!(createDialog "uninteraktion")) exitWith {hint "Dialog Error!";};
	civmenu_civ = _array select 1;
	civmenuciv  = _array select 2;
};

if (_art == "civinteraktion") then {
	if (!(createDialog "civinteraktion")) exitWith {hint "Dialog Error!";};
	civmenu_civ = _array select 1;
	civmenuciv  = _array select 2;
};

