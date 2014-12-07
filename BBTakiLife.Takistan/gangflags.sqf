if(pickingup)exitwith{};

pickingup=true;

_this 		= _this select 3;
_gangarea 	= _this select 0;
_type		= _this select 1;

player playmove "AinvPknlMstpSlayWrflDnon_medic";

if(!debug)then{
sleep 5;
waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
};

if(_type == "neutralise")then

{

_gangarea setpos [getpos _gangarea select 0, getpos _gangarea select 1, (getpos _gangarea select 2) - 1.5];

if(getpos _gangarea select 2 <= -7)then

	{

	_mygang  = call INV_mygang;
	_control = _gangarea getvariable "control";

	if(_mygang != "" and !isnil "_control")then

		{

		_gangarea setvariable["control", nil, true];
		};

	};

};

if(_type == "capture")then

{

_gangarea setpos [getpos _gangarea select 0, getpos _gangarea select 1, (getpos _gangarea select 2) + 1.5];

if(getpos _gangarea select 2 >= 0)then

	{

	_gangarea setpos [getpos _gangarea select 0, getpos _gangarea select 1, 0];

	_mygang  = call INV_mygang;
	_control = _gangarea getvariable "control";

	if(_mygang != "" and isnil "_control")then

		{

		_gangarea setvariable["control", _mygang, true];
		//format["hint ""%1 has been captured by %2!"";", _gangarea, _mygang] call broadcast_civ;

		};

	};

};

pickingup=false;