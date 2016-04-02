_arr = _this select 0;
if (not(isNil "_arr")) then {_arr = call compile _arr;} else {_arr = [];};
if (!(createDialog "INV_list")) exitWith {hint "Dialog Error!";};
lbAdd [1, "Items in the Storage:"];
lbAdd [1, "---------------------"];

for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do

{

_item        = (_arr select _i) select 0;
_anzahl      = (_arr select _i) select 1;
_anzeigename = _item call INV_getitemName;

if (_anzahl > 0) then

	{

	lbAdd [1, format ["%1 - %2x", _anzeigename, _anzahl]];

	};

};

