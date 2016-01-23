private ["_code", "_OnTrue", "_OnFalse", "_CodeArea", "_Paper", "_ledGreen", "_ledRed", "_rightCode", "_CodeNumbers", "_CodeString"];

_CodeArray = _this select 0;
_OnTrue = _this select 1;
_OnFalse = _this select 2;

// In case of code being called via action, grab the data from the appropriate place.

if (count _this > 3) then {_CodeArray = (_this select 3) select 0; _OnTrue = (_this select 3) select 1; _OnFalse = (_this select 3) select 2};
keypad_num = 0;

_ok = createDialog "RUG_Codepad";
if (!_ok) exitWith {hintSilent "Codepad dialog error!"};

// Some dialog IDCs

_CodePadDisplay = 182173;
_CodeArea = 999;
_Paper = 599;
_ledGreen = 598;
_ledRed = 597;
_rightCode = 600;

// Makes certain controls invisible by default

{ctrlShow [_x, false]} forEach [_Paper, _ledGreen, _ledRed, _rightCode];

// Loads keycheck script and assigns a displayEventhandler so that numbers can be filled in by simply writing them on your keyboard.

if (isNil "RUG_CodePad_KeyCheck") then {RUG_CodePad_KeyCheck =
{
_key = _this select 1;

_n1 = 2;
_n2 = 3;
_n3 = 4;
_n4 = 5;
_n5 = 6;
_n6 = 7;
_n7 = 8;
_n8 = 9;
_n9 = 10;
_n0 = 11;
_n10 = 43;
_n11 = 55;
_NUM_0 = 82;
_NUM_1 = 79;
_NUM_2 = 80;
_NUM_3 = 81;
_NUM_4 = 75;
_NUM_5 = 76;
_NUM_6 = 77;
_NUM_7 = 71;
_NUM_8 = 72;
_NUM_9 = 73;
_NUM_star = 55;

_CodePadDisplay = findDisplay 182173;
_CP0 = _CodePadDisplay displayCtrl 100;
_CP1 = _CodePadDisplay displayCtrl 101;
_CP2 = _CodePadDisplay displayCtrl 102;
_CP3 = _CodePadDisplay displayCtrl 103;
_CP4 = _CodePadDisplay displayCtrl 104;
_CP5 = _CodePadDisplay displayCtrl 105;
_CP6 = _CodePadDisplay displayCtrl 106;
_CP7 = _CodePadDisplay displayCtrl 107;
_CP8 = _CodePadDisplay displayCtrl 108;
_CP9 = _CodePadDisplay displayCtrl 109;
_CP10 = _CodePadDisplay displayCtrl 110;
_CP11 = _CodePadDisplay displayCtrl 111;

if (_key == _n0 OR _key == _NUM_0) then {call compile (buttonAction _CP0);ctrlSetFocus _CP0;};
if (_key == _n1 OR _key == _NUM_1) then {call compile (buttonAction _CP1);ctrlSetFocus _CP1;};
if (_key == _n2 OR _key == _NUM_2) then {call compile (buttonAction _CP2);ctrlSetFocus _CP2;};
if (_key == _n3 OR _key == _NUM_3) then {call compile (buttonAction _CP3);ctrlSetFocus _CP3;};
if (_key == _n4 OR _key == _NUM_4) then {call compile (buttonAction _CP4);ctrlSetFocus _CP4;};
if (_key == _n5 OR _key == _NUM_5) then {call compile (buttonAction _CP5);ctrlSetFocus _CP5;};
if (_key == _n6 OR _key == _NUM_6) then {call compile (buttonAction _CP6);ctrlSetFocus _CP6;};
if (_key == _n7 OR _key == _NUM_7) then {call compile (buttonAction _CP7);ctrlSetFocus _CP7;};
if (_key == _n8 OR _key == _NUM_8) then {call compile (buttonAction _CP8);ctrlSetFocus _CP8;};
if (_key == _n9 OR _key == _NUM_9) then {call compile (buttonAction _CP9);ctrlSetFocus _CP9;};
if (_key == _n10) then {call compile (buttonAction _CP10);ctrlSetFocus _CP10;};
if (_key == _n11 OR _key == _NUM_star) then {call compile (buttonAction _CP11);ctrlSetFocus _CP11;};

};
};

// Sets the displayeventhandler to react to keypresses while the display is up

(findDisplay _CodePadDisplay) displaySetEventHandler ["KeyDown", "nilll = _this call RUG_CodePad_KeyCheck"];

// Converts the array of numbers to a string

_CodeNumbers = count _CodeArray;
_CodeString = "";
for "_i" from 0 to (_CodeNumbers - 1) do {_CodeString = _CodeString + (format ["%1",(_CodeArray select _i)])};

// Checks if the string is in the knownCodes array, and if so, reveals it on a piece of paper under the codepad.

//if (_CodeString in RUG_CodePad_KnownCodes) then {
//						ctrlShow [_rightCode, true];
//						ctrlShow [_Paper, true];
//						ctrlSetText [_rightCode, _CodeString];
//						};

// Main loop that runs while the codepad is visible. Will spawn _OnTrue at correct code, _OnFalse if wrong. Note: _this select 0 for both _OnTrue and _OnFalse scripts will be the code string!

while {ctrlVisible _CodeArea} do
{
waitUntil {!ctrlVisible _CodeArea || ctrlText _CodeArea == _CodeString || keypad_num >= _CodeNumbers};
if (!ctrlVisible _CodeArea) exitWith {};
if (ctrlText _CodeArea == _CodeString) then
	{
	//playSound "codefound";
	ctrlShow [_ledGreen, true];
	_n=[_CodeString] spawn _OnTrue;
	sleep 1;
	ctrlSetText [_CodeArea, ""];
	keypad_num = 0;
	}
	else
	{
	if (keypad_num >= _CodeNumbers) then
		{
		//playsound "wrongcode";
		ctrlShow [_ledRed, true];
		ctrlShow [_ledGreen, false];
		_n = [_CodeString] spawn _OnFalse;
		sleep 1;
		ctrlShow [_ledRed, false];
		ctrlSetText [_CodeArea, ""];
		keypad_num = 0;
		closeDialog 0;
		hint "Wrong code!";
		player setpos getpos wrongcode;
		};
	};
};

keypad_num = 0;