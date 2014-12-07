// ****************************************************************
// Script file for ArmA II
// Generic Towing script 
// Created by: rundll.exe
// Modified by: BB Elvis and cptrick
// Arguments: [Towing object, Towed object]
// Returns: nothing
// ****************************************************************

// usage:
//add functions module on map. and use the following
//waituntil {!isnil "bis_fnc_init"};
//dll_tow = compile preprocessfile "BB Elvis towing\tow.sqf";
//[T, P] spawn dll_tow;
// T is the Towing vehicle
// P is the towed vehcile (orginated from Plane)


//start config
private ["_towfromrear", "_Tspeed", "_aTpos", "_aPpos", "_wheelPpos", "_dx", "_dy", "_dirdeg", "_xP", "_yP", "_P_axis_offset", "_Taxis", "_Paxis", "_Pwheel", "_d_axis", "_dx_axis", "_dy_axis", "_speed", "_dirdeg_axis"];

//set nil for not set
//if front axis AND wheels is defined (not nil), it can be towed)
//if back axis is defined, it can tow other items (NOT USED HERE!!!)
//				0 classname or base class - 1 front axis offset - 2 wheel offset - 3 back axis offset - 4 static (bool) 
dll_tow_defs =	 [["Mi24_Base ", 				[0,9], 				[0,-1], 		nil, 				false],		
				  ["A10", 						[0,8], 				[0,-1], 		nil, 				false],
			      ["AV8B2", 					[0,7.5],			[0,-1], 		nil,				false],	
				  ["MH60S", 					[0,-9], 			[0,-1], 		nil, 				false],	
				  ["Mi17_base",					[0,8], 				[0,0], 			nil, 				false],	
				  ["Mi17_rockets_RU",			[0,8.5],			[0,0], 			nil, 				false],	
				  ["F35B", 						[0,7], 				[0,-3.5],		nil, 				false],		
				  ["Su39", 						[0,5.5],			[0,-1], 		nil, 				false],
				  ["Su34", 						[0,6], 				[0,-2], 		nil, 				false],
				  ["Pchela1T", 					[0,2], 				[0,-1], 		nil, 				false],
				  ["MQ9PredatorB", 				[0,5.5],			[0,-1], 		nil, 				false],
				  ["USEC_MAULE",				[0,-6],				[0,1], 			nil, 				false],
				  ["C130J_US_EP1",						[0,15],				[0,-5], 		nil,				false],
          ["Mi17_Civilian",					[0,8], 				[0,0], 			nil, 				false],
          ["Ka137_PMC",					[0,8], 				[0,0], 			nil, 				false]
			];

//create list of only classnames from defs
dll_tow_classlist = [];
{
	dll_tow_classlist = dll_tow_classlist + [_x select 0];
} forEach dll_tow_defs;			
			
//end config

//get _T amd _P
_T = _this select 0;
_P = _this select 1;

//try to find the class or a base of it in the deflist
dll_tow_class = typeOf(_P);
dll_tow_i = (dll_tow_classlist find dll_tow_class);

if ( (!(dll_tow_class in dll_tow_classlist)) ||
	 (dll_tow_i <0)
	) exitWith { // if _P is not in the def exit with a hint
		hint format["%1 cannot be towed", dll_tow_class];
};

_def = dll_tow_defs select dll_tow_i;
_P setVariable ["dll_tow_front_axis_offset", _def select 1];
_P setVariable ["dll_tow_wheel_offset", _def select 2];
_P setVariable ["dll_tow_back_axis_offset", _def select 3];
_P setVariable ["static", _def select 4];
_back_axis_offset = _P getvariable "dll_tow_back_axis_offset";

//get _T and _P display names
_Pdisplayname = getText (configFile >> "CfgVehicles" >> typeOf(_P) >> "displayName");
_Tdisplayname = getText (configFile >> "CfgVehicles" >> typeOf(_T) >> "displayName");

//get axis offsets for _T		
_T_axis_offset = [0.25, -2] + [0];

//get offsets for _p
_P_axis_offset = (_P getvariable "dll_tow_front_axis_offset") + [0];
_P_wheel_offset = (_P getvariable "dll_tow_wheel_offset") + [0];

//check if axis offset value 2 is smaller than 0 and than assume we're towing from rear
_towfromrear = ((_P_axis_offset select 1) < 0);

/*if (dll_tow_debug) then {
	_axisclass = "RoadCone";
	_Taxis = _axisclass createvehicle (position _T);
	_Paxis = _axisclass createvehicle (position _T);
	_Pwheel = _axisclass createvehicle (position _T);
	_Taxis attachto [_T,[_T_axis_offset select 0, _T_axis_offset select 1, 3]]; 
	_Paxis attachto [_P,[_P_axis_offset select 0, _P_axis_offset select 1, 3]]; 
	_Pwheel attachto [_P,[_P_wheel_offset select 0, _P_wheel_offset select 1, 3]];  	
	 _base = inheritsFrom (configFile >> "CfgVehicles" >> typeOf(_P));
	hint format["%1 (%2) attached,  Base: %3", _Pdisplayname, typeof(_P),  configname _base];
};*/

//add actions to _T
_action_detach = _T addaction ["Detach", "BB Elvis towing\action_detach.sqf"];

//set Variables
_T setVariable ["dll_tow_towing", true];//now we know something is coupled
_P setVariable ["dll_tow_T", _T]; //P should know who is 

//add EH for killing P or T (towing ends if _P or _T die)
_P_EHkilledIdx = _P addeventhandler ["Killed", "((_this select 0) getvariable ""dll_tow_T"") setVariable [""dll_tow_towing"", false]"];
_T_EHkilledIdx = _T addeventhandler ["Killed", "(_this select 0) setVariable [""dll_tow_towing"", false]"];

hint format["%1 attached to: %2", _Pdisplayname, _Tdisplayname];

//main towing loop
while {_T getvariable "dll_tow_towing"} do {

		//get global coordinates
		_aTpos = _T modelToWorld _T_axis_offset;
		_aPpos = _P modelToWorld _P_axis_offset;
		_wheelPpos = _P modelToWorld _P_wheel_offset;
	
		//get the x and y length of the difference vector
		_dx_axis = (_aTpos select 0) - (_aPpos select 0);
		_dy_axis = (_aTpos select 1) - (_aPpos select 1);		
		_d_axis = sqrt(_dx_axis^2 + _dy_axis^2);//absolute length of diff vector

		if(_d_axis > 0.05) then {		
			//get global distance between the T axis and P wheelpos
			_dx = (_aTpos select 0) - (_wheelPpos select 0);
			_dy = (_aTpos select 1) - (_wheelPpos select 1);		
			_dirdeg = _dx atan2 _dy;//convert to direction in deg
			
			if(_towfromrear) then {
				_dirdeg = _dirdeg + 180;
			};	
		
			//set the direction of P, preserving pitch and bank
			_Ppb = _P call BIS_fnc_getpitchbank;
			_P setdir _dirdeg;
			nil = [_P, _Ppb select 0, _Ppb select 1] call BIS_fnc_setpitchbank;			
				
						
			//setpos implementation (SAFE!!!! but ugly)
			_xP = (_aTpos select 0) - ((_P_axis_offset select 1)*sin _dirdeg);
			_yP = (_aTpos select 1) - ((_P_axis_offset select 1)*cos _dirdeg);
			_P setpos [_xP, _yP, 0];
			
			/*
			//velocity implementation (smoother but elastic)		
			_dirdeg_axis = _dx_axis atan2 _dy_axis;	//get the direction of the difference vector						
			_speed = _d_axis*8; //control the speed needed to make this distance smaller TWEAK HERE	Higher value means less elasticty, but more choppy.
			_speed = _speed min 50; //set max speed for safety.
			_Pvel = velocity _P;	
			_P setVelocity [(sin _dirdeg_axis*_speed),(cos _dirdeg_axis*_speed),(_Pvel select 2)-0.3]; //set the velocity in the correct direction
			
			//acceleration implementation doesnt work verry well with "trains"
			_Tvel = velocity _T;	
			_Pdir = vectordir _P;	
			_dot =  [_Pdir, _Tvel] call BIS_fnc_dotProduct;
			_newvel = [_Pdir, _dot] call BIS_fnc_vectorMultiply;
			_dirdeg_axis = _dx_axis atan2 _dy_axis;	//get the direction of the difference vector						
			_acc = _d_axis*5; //control the acc to make this distance smaller TWEAK HERE	
			_acc = _acc min 5; //set max acc for safety.
			_Pvel = velocity _P;	
			_P setVelocity [(_newvel select 0)+(sin _dirdeg_axis*_acc),(_newvel select 1)+(cos _dirdeg_axis*_acc),(_Pvel select 2)-0.1]; //set the velocity in the correct direction
			*/	
		};
		
		sleep 0.01; //Slight delay, don't overheat the server;)

	/*if (dll_tow_debug) then {

		hintsilent format["dx: %1\n
dy: %2\ndirdeg: %3\n
d_axis: %4\n
dirdeg: %5\n
_speed: %6\n
speed P: %7\n
speed T: %8\n
pitch: %9\n
bank: %10\n
", _dx, _dy, _dirdeg, _d_axis, _dirdeg, _speed, speed _P /3.6, _Tspeed, _Ppb select 0, _Ppb select 1];
	};*/		
		
};

//remove actions when done
_T removeaction _action_detach;

//remove EHs
_T removeEventHandler ["killed", _T_EHkilledIdx];
_P removeEventHandler ["killed", _P_EHkilledIdx];

if (dll_tow_debug) then {
	deletevehicle _Taxis;
	deletevehicle _Paxis; 
	deletevehicle _Pwheel;
};

//finally, we are not towing anymore
_T setVariable ["dll_tow_towing", false];
hint format["%1 detached from: %2", _Pdisplayname, _Tdisplayname];