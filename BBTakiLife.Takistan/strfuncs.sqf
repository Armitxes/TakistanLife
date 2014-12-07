ISSE_MAX_NUMBER = 1000000;
ISSE_str_const_numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
ISSE_str_const_StringNum = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "."];
ISSE_str_const_letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
ISSE_str_const_lettersCap  = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
ISSE_str_const_keys        = [" ", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "_", "'"];
ISSE_str_const_codes       = [32,  48,  49,  50,  51,  52,  53,  54,  55,  56,  57,  65,  66,  67,  68,  69,  70,  71,  72,  73,  74,  75,  76,  77,  78,  79,  80,  81,  82,  83,  84,  85,  86,  87,  88,  89,  90,  97,  98,  99,  100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 95, 96];
ISSE_str_const_validInput  = [32,  48,  49,  50,  51,  52,  53,  54,  55,  56,  57,  65,  66,  67,  68,  69,  70,  71,  72,  73,  74,  75,  76,  77,  78,  79,  80,  81,  82,  83,  84,  85,  86,  87,  88,  89,  90,  97,  98,  99,  100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 95, 96];

ISSE_str_GetInteger =

{

private["_arr", "_i", "_num", "_isNumber", "_KommataCount", "_result", "_reString"];

_isNumber = true;
_result   = -1;
_reString = "";

if ((typeName _this) == "STRING") then

	{

	_KommataCount = 0;
	_arr          = _this call ISSE_str_StrToArr;
	for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do

		{

		_num = _arr select _i;
		if (_num == ",") then { _arr SET[_i, "."]; _num = "."; };
		if (_num == ".") then { _KommataCount = _KommataCount + 1;};

		if (((!(_num in ISSE_str_const_StringNum)) and ((_num != "-") and (_i == 0)) ) or (_KommataCount > 1)) exitWith

			{

			_isNumber = false;

			};

		};

	_reString = _arr call ISSE_str_ArrToStr;

	if (_reString == "") exitWith {_isNumber = false;};
	if (_isNumber) exitWith {_result = parseNumber(_reString);};

	}
	else
	{

	if ((typeName _this) == "SCALAR") then {_isNumber = true;_result   = _this;} else {_isNumber = false;};

	};

	[_isNumber, _result]

};

ISSE_str_isInteger =

{

private["_num"];

_num = _this call ISSE_str_GetInteger;
(  (_num select 0) and ((_num select 1) == (round (_num select 1)))  )

};

ISSE_str_isFloat = {((_this call ISSE_str_GetInteger) select 0)};

ISSE_str_StrToInt = {(   (1000000)  min  ( round ((_this call ISSE_str_GetInteger) select 1) )   )};

ISSE_str_StrToLongint = {( round ((_this call ISSE_str_GetInteger) select 1) )};

ISSE_str_StrToFloat = {((_this call ISSE_str_GetInteger) select 1)};

ISSE_str_IntToStr =

{

private["_num", "_str", "_i", "_rest"];

_num = _this;
_str = "";

if (typeName _this == "STRING") then

	{

	hint "Error: Wrong argument in IntToStr function: String";
	_str = _this;

	} else {

	if (_num >= 1000000) then

		{

		_i   = 0;

		while {true} do

			{

			_i    = _i + 1;
			_rest = (_num mod (10^_i));
			_num  = _num - _rest;
			_str  = format["%2%1", _str, (_rest/(10^(_i-1)))];
			if (_num <= 0) exitWith{};

			};

		} else {_str = format["%1", _num];};

	};

_str

};

ISSE_str_StrToArr =

{

private["_arr", "_i"];

if ((typeName _this) == "STRING") then

	{

	_arr = toArray(_this);

	for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do {_arr SET[_i, (toString [(_arr select _i)])];};

	_arr

	} else {[]};

};

ISSE_str_ArrToStr =

{

private["_str", "_i"];

_str = "";

if ((typeName _this) == "ARRAY") then

	{

	for [{_i = 0}, {_i < (count _this)}, {_i=_i+1}] do {_str = format["%1%2", _str, (_this select _i)];};

	};

_str

};

ISSE_str_Length =

{

if ((typeName _this) == "STRING") then {(count (_this call isse_str_StrtoArr))} else {-1};

};

ISSE_str_SubString =

{

private["_arr", "_str", "_start", "_end", "_re", "_i"];

_str   = _this select 0;
_start = _this select 1;
_end   = _this select 2;
_arr   = _str call isse_str_StrtoArr;
_re    = [];

if ((_end < 0) or (_start < 0)) then {_start = 0; _end = 0;};
if ( (count _arr) <= _end) then {_end = ((count _arr)-1);};
if ( (count _arr) <= _start) then {_start = ((count _arr)-1);};
if (_end < _start) then {_start = _end;};
for [{_i = _start}, {_i < _end}, {_i=_i+1}] do {_re = _re + [_arr select _i];};

(_re call isse_str_ArrToStr)

};

ISSE_str_IsInStr = {( ([(_this select 0), (_this select 1)] call ISSE_str_Pos) > -1 )};

ISSE_str_Pos =

{

private["_str", "_search", "_pos", "_found", "_i", "_j"];

_str    = (_this select 0) call isse_str_StrToArr;
_search = (_this select 1) call isse_str_StrToArr;
_found  = true;
_pos    = -1;

for [{_i=0}, {_i < (((count _str)-(count _search))+1)}, {_i=_i+1}] do

	{

	_found = true;
	for [{_j=0}, {_j < (count _search)}, {_j=_j+1}] do {if (not ((_str select (_i+_j)) == (_search select _j)) ) exitWith {_found = false;};};
	if (_found) exitWith {_pos = _i;};

	};

if (_found) then {_pos} else {-1};

};

ISSE_str_Replace =

{

private["_str", "_strArr", "_search", "_searchArr", "_replace", "_replaceArr", "_re", "_SubStr1", "_SubStr2"];

_str        = _this select 0;
_strArr     = (_this select 1) call isse_str_StrToArr;
_search     = _this select 1;
_searchArr  = (_this select 1) call isse_str_StrToArr;
_replace    = _this select 2;
_replaceArr = (_this select 2) call isse_str_StrToArr;
_found = [_str, _search] call ISSE_str_Pos;

if (_found > -1) then

	{

	_SubStr1 = [_str, 0, _found] call ISSE_str_SubString;
	_SubStr2 = [_str, (_found + (count _searchArr)), (count _strArr)] call ISSE_str_SubString;
	_str = format["%1%2%3", _SubStr1, _replace, _SubStr2];
	_str
	} else {_str}

};

ISSE_str_toString = {format["%1", _this]};