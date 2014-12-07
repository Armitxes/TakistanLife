 /******************************************************************************
 *                        ,1             ,-===========.
 *                       /,| ___________((____________\\_                _
 *    ,========.________//_|/===========._#############L_Y_....-----====//
 *   (#######(==========\################\=======.______ --############((
 *    `=======`"        ` ===============|::::.___|[ ))[JW]#############\\
 *                                       |####|     ""\###|   :##########\\
 *                                      /####/         \##\     ```"""=,,,))
 *     C R E A T E D   B Y   B T K     /####/           \##\
 *                                    '===='             `=`
 *******************************************************************************
 *
 *  The main script engine. This file executes the load AND drop functions...
 *
 ******************************************************************************/


/// Include the Objects Setup
#include "Settings_Objects.sqf";


//// Variables
_Transporter = _this select 0;
_TransporterType = typeOf _Transporter;
_TransporterName = getText (configFile >> "CfgVehicles" >> (typeOf _Transporter) >> "displayName");
_Unit = _this select 1;
_Action = _this select 2;
_Selected = (_this select 3) select 0;
//_Dir = random 359;


/// Create variables for Transporter Setup detection
_SelectedTransporterTypeS = false;_SelectedTransporterTypeM = false;_SelectedTransporterTypeL = false;_SelectedTransporterTypeXL = false;


/// Include the Transporter Setup
#include "Settings_Transporter.sqf";


//// Supported types
if (!(_SelectedTransporterTypeS) && !(_SelectedTransporterTypeM) && !(_SelectedTransporterTypeL) && !(_SelectedTransporterTypeXL)) exitWith {

	//// BTK_Hint - Not supported
	hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>This vehicle does not support cargo transports!</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	"];
	
_Transporter removeAction _Action;
};

sleep 1;

/*
//// Unit in transporter
if ((_Unit in _Transporter) && !(_Selected == "UnloadCargo")) exitWith {

	//// BTK_Hint - You have to get out
	hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>You have to <t color='#fdd785'>get out</t> to load cargo!</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	"];

_Transporter removeAction _Action;
};
*/

//// Unload function
if (_Selected == "UnloadCargo") exitWith {
	
	//// 2low
	if (!((getpos _Transporter) select 2 <= 2.1) && ((getpos _Transporter) select 2 <= 50)) exitWith {

		//// BTK_Hint - Flying too low
		hint parseText format ["
			<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
			<t align='left' color='#eaeaea' size='1.0'>You have to fly above <t color='#fdd785'>50m</t> to drop the cargo!</t>
			<br />
			<t align='left' color='#eaeaea' size='1.0'>Or hover below <t color='#fdd785'>2m</t> to unload the cargo!</t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		"];
	};

	_Transporter removeAction _Action;
	
	if ((getpos _Transporter) select 2 <= 1.5) then {
		UnloadCargo = true;
		DoUnload = true;
		_Transporter setVariable ["BTK_CargoDrop_ActionAdded", false];
		_Transporter setVariable ["BTK_CargoDrop_TransporterLoaded", false];
	}

	else {
		UnloadCargo = true;
		DoDrop = true;
		_Transporter setVariable ["BTK_CargoDrop_ActionAdded", false];
		_Transporter setVariable ["BTK_CargoDrop_TransporterLoaded", false];
	};
};


/******************************************************************************
* Load in - Small
******************************************************************************/
if ((_Selected == "LoadCargo") && (_SelectedTransporterTypeS)) exitWith {

	//// Get nearest objects
	_TransporterPos = _Transporter modelToWorld [0,0,0];
	_ObjectsInRange = nearestObjects [_Transporter, _ObjectsS, 15];
	
	//// If no objects, exit with
	if (count _ObjectsInRange < 1) exitWith {
	
		//// BTK_Hint - Nothing to load in range
		hint parseText format ["
			<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
			<t align='left' color='#eaeaea' size='1.0'>Nothing to load in range!<br /><br />Please move the object closer to the transporter.</t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		"];
	};
	
	//// Else, select the object from list
	_Object = _ObjectsInRange select 0;
	_Object setVariable ["BTK_CargoDrop_ObjectLoaded", true];
	_Transporter setVariable ["BTK_CargoDrop_TransporterLoaded", true];
	
	
	//// Get the object name
	_ObjectName = getText (configFile >> "CfgVehicles" >> (typeOf _Object) >> "displayName");

	//// BTK_Hint - Loading in...
	hint parseText format ["
	<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	<t align='left' color='#eaeaea' size='1.0'>Loading <t color='#fdd785'>%1</t> into <t color='#fdd785'>%2</t> ...</t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	",_ObjectName,_TransporterName];

	//// remove the Action
	_Transporter removeAction _Action;

	//// Animate ramp
	sleep 1;
	_Transporter animate ["ramp_top", 1];
	_Transporter animate ["ramp_bottom", 1];

	//// Attach object to transporter
	sleep 3;
	
	//// Fix for F35
	if (_Transporter isKindOf "F35_base") then {
	_Object attachTo [_Transporter,[0,0.5,-2.5]];
	} else {
	_Object attachTo [_Transporter,[0,0.5,-1.6]];
	};
	
	_Object enableSimulation false;
		
	//// Disable R3F
	_Object setVariable ["R3F_LOG_disabled", true];

	//// Animate ramp again
	sleep 1;
	_Transporter animate ["ramp_top", 0];
	_Transporter animate ["ramp_bottom", 0];

	//// BTK_Hint - Loaded
	hint parseText format ["
	<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> loaded.</t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	", _ObjectName,_TransporterName];

	//// add unload/drop Action
	_UnloadAction = _Transporter addAction [("<t color=""#fadfbe"">" + ("Unload cargo") + "</t>"),"BTK\Cargo Drop\Engine.sqf",["UnloadCargo"], 5, false, true, "", "player in (assignedVehicle _target)"];

	//// Wait until unload
	waitUntil {UnloadCargo || !(alive _Transporter) || !(alive _Object)};

	
	//// If destroyed
	if (!(alive _Transporter) || !(alive _Object)) exitWith {};
	

	//// If unload
	if (DoUnload) then {
		
		//// Reset variables
		DoUnload = false;
		DoDrop = false;
		UnloadCargo = false;
		_Object setVariable ["BTK_CargoDrop_ObjectLoaded", false];
		_Object enableSimulation true;

		//// BTK_Hint - Unloading...
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>Unloading <t color='#fdd785'>%1</t> from <t color='#fdd785'>%2</t> ...</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Animate ramp
		sleep 1;
		_Transporter animate ["ramp_top", 1];
		_Transporter animate ["ramp_bottom", 1];

		//// Detach object
		sleep 3;
		_Object attachTo [_Transporter,[12,0,0]];
		sleep 0.2;
		deTach _Object;
		sleep 0.2;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),0];
		
		//// Enable R3F
		_Object setVariable ["R3F_LOG_disabled", false];

		//// Animate ramp again
		sleep 1;
		_Transporter animate ["ramp_top", 0];
		_Transporter animate ["ramp_bottom", 0];
		
		//// BTK_Hint - Unloaded
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> unloaded.</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];
	};

	//// If drop
	if (DoDrop) then {

		//// BTK_Hint - Dropping...
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>Dropping <t color='#fdd785'>%1</t> ...</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Reset variables
		DoUnload = false;
		DoDrop = false;
		UnloadCargo = false;
		_Object setVariable ["BTK_CargoDrop_ObjectLoaded", false];
		_Object enableSimulation true;

		//// Animate ramp
		sleep 1;
		_Transporter animate ["ramp_top", 1];
		_Transporter animate ["ramp_bottom", 1];

		//// Detach object (drop)
		sleep 2;
		_Object setVariable ["R3F_LOG_disabled", false];
		deTach _Object;
		_Object attachTo [_Transporter,[0,-21,0]];
		sleep 0.1;
		deTach _Object;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),(getPos _Object select 2)-6];

		//// Create parachute and smoke
		sleep 2;
		_Parachute = "ParachuteBigWest" createVehicle position _Object;
		_Parachute setPos (getPos _Object);
		_BlueSmoke = "SmokeShellBlue" createVehicle position _Object;
		_BlueSmoke setPos (getPos _Object);
		_Object attachTo [_Parachute,[0,0,-1.5]];

		//// Animate ramp again
		sleep 1;
		_Transporter animate ["ramp_top", 0];
		_Transporter animate ["ramp_bottom", 0];
		
		//// BTK_Hint - Dropped
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> dropped.</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Wait until ground reached
		waitUntil {(getPos _Object select 2) < 2};
		deTach _Object;
		sleep 3;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),0.001];

		//// Enable R3F
		_Object setVariable ["R3F_LOG_disabled", false];
		
		//// Delete parachute and smoke
		sleep 15;
		deleteVehicle _BlueSmoke;
		deleteVehicle _Parachute;
	};
};


/******************************************************************************
* Load in - Medium
******************************************************************************/
if ((_Selected == "LoadCargo") && (_SelectedTransporterTypeM)) exitWith {

	//// Get nearest objects
	_TransporterPos = _Transporter modelToWorld [0,0,0];
	_ObjectsInRange = nearestObjects [_Transporter, _ObjectsM, 15];
	
	//// If no objects, exit with
	if (count _ObjectsInRange < 1) exitWith {
	
		//// BTK_Hint - Nothing to load in range
		hint parseText format ["
			<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
			<t align='left' color='#eaeaea' size='1.0'>Nothing to load in range!<br /><br />Please move the object closer to the transporter.</t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		"];
	};
	
	//// Else, select the object from list
	_Object = _ObjectsInRange select 0;
	_Object setVariable ["BTK_CargoDrop_ObjectLoaded", true];
	_Transporter setVariable ["BTK_CargoDrop_TransporterLoaded", true];
	
	
	//// Get the object name
	_ObjectName = getText (configFile >> "CfgVehicles" >> (typeOf _Object) >> "displayName");

	//// BTK_Hint - Loading in...
	hint parseText format ["
	<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	<t align='left' color='#eaeaea' size='1.0'>Loading <t color='#fdd785'>%1</t> into <t color='#fdd785'>%2</t> ...</t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	",_ObjectName,_TransporterName];

	//// remove the Action
	_Transporter removeAction _Action;

	//// Animate ramp
	sleep 1;
	_Transporter animate ["ramp_top", 1];
	_Transporter animate ["ramp_bottom", 1];

	//// Attach object to transporter
	sleep 3;
	_Object attachTo [_Transporter,[0,1,-0.3]];
		
	//// Disable R3F
	_Object setVariable ["R3F_LOG_disabled", true];

	//// Animate ramp again
	sleep 1;
	_Transporter animate ["ramp_top", 0];
	_Transporter animate ["ramp_bottom", 0];

	//// BTK_Hint - Loaded
	hint parseText format ["
	<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> loaded.</t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	", _ObjectName,_TransporterName];

	//// add unload/drop Action
	_UnloadAction = _Transporter addAction [("<t color=""#fadfbe"">" + ("Unload cargo") + "</t>"),"BTK\Cargo Drop\Engine.sqf",["UnloadCargo"], 5, false, true, "", "player in (assignedVehicle _target)"];

	//// Wait until unload
	waitUntil {UnloadCargo || !(alive _Transporter) || !(alive _Object)};

	
	//// If destroyed
	if (!(alive _Transporter) || !(alive _Object)) exitWith {};
	

	//// If unload
	if (DoUnload) then {
		
		//// Reset variables
		DoUnload = false;
		DoDrop = false;
		UnloadCargo = false;
		_Object setVariable ["BTK_CargoDrop_ObjectLoaded", false];

		//// BTK_Hint - Unloading...
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>Unloading <t color='#fdd785'>%1</t> from <t color='#fdd785'>%2</t> ...</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Animate ramp
		sleep 1;
		_Transporter animate ["ramp_top", 1];
		_Transporter animate ["ramp_bottom", 1];

		//// Detach object
		sleep 3;
		_Object attachTo [_Transporter,[15,0,0]];
		sleep 0.2;
		deTach _Object;
		sleep 0.2;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),0];
		
		//// Enable R3F
		_Object setVariable ["R3F_LOG_disabled", false];

		//// Animate ramp again
		sleep 1;
		_Transporter animate ["ramp_top", 0];
		_Transporter animate ["ramp_bottom", 0];
		
		//// BTK_Hint - Unloaded
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> unloaded.</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];
	};

	//// If drop
	if (DoDrop) then {

		//// BTK_Hint - Dropping...
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>Dropping <t color='#fdd785'>%1</t> ...</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Reset variables
		DoUnload = false;
		DoDrop = false;
		UnloadCargo = false;
		_Object setVariable ["BTK_CargoDrop_ObjectLoaded", false];

		//// Animate ramp
		sleep 1;
		_Transporter animate ["ramp_top", 1];
		_Transporter animate ["ramp_bottom", 1];

		//// Detach object (drop)
		sleep 2;
		_Object setVariable ["R3F_LOG_disabled", false];
		deTach _Object;
		_Object attachTo [_Transporter,[0,-21,0]];
		sleep 0.1;
		deTach _Object;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),(getPos _Object select 2)-6];

		//// Create parachute and smoke
		sleep 2;
		_Parachute = "ParachuteBigWest" createVehicle position _Object;
		_Parachute setPos (getPos _Object);
		_BlueSmoke = "SmokeShellBlue" createVehicle position _Object;
		_BlueSmoke setPos (getPos _Object);
		_Object attachTo [_Parachute,[0,0,-1.5]];

		//// Animate ramp again
		sleep 1;
		_Transporter animate ["ramp_top", 0];
		_Transporter animate ["ramp_bottom", 0];
		
		//// BTK_Hint - Dropped
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> dropped.</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Wait until ground reached
		waitUntil {(getPos _Object select 2) < 2};
		deTach _Object;
		sleep 3;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),0.001];

		//// Enable R3F
		_Object setVariable ["R3F_LOG_disabled", false];
		
		//// Delete parachute and smoke
		sleep 15;
		deleteVehicle _BlueSmoke;
		deleteVehicle _Parachute;
	};
};


/******************************************************************************
* Load in - Large
******************************************************************************/
if ((_Selected == "LoadCargo") && (_SelectedTransporterTypeL)) exitWith {

	//// Get nearest objects
	_TransporterPos = _Transporter modelToWorld [0,0,0];
	_ObjectsInRange = nearestObjects [_Transporter, _ObjectsL, 15];
	
	//// If no objects, exit with
	if (count _ObjectsInRange < 1) exitWith {
	
		//// BTK_Hint - Nothing to load in range
		hint parseText format ["
			<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
			<t align='left' color='#eaeaea' size='1.0'>Nothing to load in range!<br /><br />Please move the object closer to the transporter.</t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		"];
	};
	
	//// Else, select the object from list
	_Object = _ObjectsInRange select 0;
	_Object setVariable ["BTK_CargoDrop_ObjectLoaded", true];
	_Transporter setVariable ["BTK_CargoDrop_TransporterLoaded", true];
	
	
	//// Get the object name
	_ObjectName = getText (configFile >> "CfgVehicles" >> (typeOf _Object) >> "displayName");

	//// BTK_Hint - Loading in...
	hint parseText format ["
	<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	<t align='left' color='#eaeaea' size='1.0'>Loading <t color='#fdd785'>%1</t> into <t color='#fdd785'>%2</t> ...</t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	",_ObjectName,_TransporterName];

	//// remove the Action
	_Transporter removeAction _Action;

	//// Animate ramp
	sleep 1;
	_Transporter animate ["ramp_top", 1];
	_Transporter animate ["ramp_bottom", 1];

	//// Attach object to transporter
	sleep 3;
	
	//// Chinook/Car fix
	if ((_Transporter isKindOf "CH47_base_EP1") ) then {
	if (_Object isKindOf "Car") then {
		_Object attachTo [_Transporter,[0,1.5,-0.5]];
	} else {
		_Object attachTo [_Transporter,[0,1.4,-0.8]];
	};
	
	} else {
		_Object attachTo [_Transporter,[0,1.4,-0.2]];
	};
		
	//// Disable R3F
	_Object setVariable ["R3F_LOG_disabled", true];

	//// Animate ramp again
	sleep 1;
	_Transporter animate ["ramp_top", 0];
	_Transporter animate ["ramp_bottom", 0];

	//// BTK_Hint - Loaded
	hint parseText format ["
	<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> loaded.</t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	", _ObjectName,_TransporterName];

	//// add unload/drop Action
	_UnloadAction = _Transporter addAction [("<t color=""#fadfbe"">" + ("Unload cargo") + "</t>"),"BTK\Cargo Drop\Engine.sqf",["UnloadCargo"], 5, false, true, "", "player in (assignedVehicle _target)"];

	//// Wait until unload
	waitUntil {UnloadCargo || !(alive _Transporter) || !(alive _Object)};

	
	//// If destroyed
	if (!(alive _Transporter) || !(alive _Object)) exitWith {};
	

	//// If unload
	if (DoUnload) then {
		
		//// Reset variables
		DoUnload = false;
		DoDrop = false;
		UnloadCargo = false;
		_Object setVariable ["BTK_CargoDrop_ObjectLoaded", false];

		//// BTK_Hint - Unloading...
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>Unloading <t color='#fdd785'>%1</t> from <t color='#fdd785'>%2</t> ...</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Animate ramp
		sleep 1;
		_Transporter animate ["ramp_top", 1];
		_Transporter animate ["ramp_bottom", 1];

		//// Detach object
		sleep 3;
		_Object attachTo [_Transporter,[0,-20,0]];
		sleep 0.2;
		deTach _Object;
		sleep 0.2;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),0];
		
		//// Enable R3F
		_Object setVariable ["R3F_LOG_disabled", false];

		//// Animate ramp again
		sleep 1;
		_Transporter animate ["ramp_top", 0];
		_Transporter animate ["ramp_bottom", 0];
		
		//// BTK_Hint - Unloaded
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> unloaded.</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];
	};

	//// If drop
	if (DoDrop) then {

		//// BTK_Hint - Dropping...
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>Dropping <t color='#fdd785'>%1</t> ...</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Reset variables
		DoUnload = false;
		DoDrop = false;
		UnloadCargo = false;
		_Object setVariable ["BTK_CargoDrop_ObjectLoaded", false];

		//// Animate ramp
		sleep 1;
		_Transporter animate ["ramp_top", 1];
		_Transporter animate ["ramp_bottom", 1];

		//// Detach object (drop)
		sleep 2;
		_Object setVariable ["R3F_LOG_disabled", false];
		deTach _Object;
		_Object attachTo [_Transporter,[0,-21,0]];
		sleep 0.1;
		deTach _Object;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),(getPos _Object select 2)-6];

		//// Create parachute and smoke
		sleep 2;
		_Parachute = "ParachuteBigWest" createVehicle position _Object;
		_Parachute setPos (getPos _Object);
		_BlueSmoke = "SmokeShellBlue" createVehicle position _Object;
		_BlueSmoke setPos (getPos _Object);
		_Object attachTo [_Parachute,[0,0,-1.5]];

		//// Animate ramp again
		sleep 1;
		_Transporter animate ["ramp_top", 0];
		_Transporter animate ["ramp_bottom", 0];
		
		//// BTK_Hint - Dropped
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> dropped.</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Wait until ground reached
		waitUntil {(getPos _Object select 2) < 2};
		deTach _Object;
		sleep 3;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),0.001];

		//// Enable R3F
		_Object setVariable ["R3F_LOG_disabled", false];
		
		//// Delete parachute and smoke
		sleep 15;
		deleteVehicle _BlueSmoke;
		deleteVehicle _Parachute;
	};
};


/******************************************************************************
* Load in - Xtra Large
******************************************************************************/
if ((_Selected == "LoadCargo") && (_SelectedTransporterTypeXL)) exitWith {

	//// Get nearest objects
	_TransporterPos = _Transporter modelToWorld [0,0,0];
	_ObjectsInRange = nearestObjects [_Transporter, _ObjectsXL, 20];
	
	//// If no objects, exit with
	if (count _ObjectsInRange < 1) exitWith {
	
		//// BTK_Hint - Nothing to load in range
		hint parseText format ["
			<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
			<t align='left' color='#eaeaea' size='1.0'>Nothing to load in range!<br /><br />Please move the object closer to the transporter.</t>
			<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		"];
	};
	
	//// Else, select the object from list
	_Object = _ObjectsInRange select 0;
	_Object setVariable ["BTK_CargoDrop_ObjectLoaded", true];
	_Transporter setVariable ["BTK_CargoDrop_TransporterLoaded", true];
	
	
	//// Get the object name
	_ObjectName = getText (configFile >> "CfgVehicles" >> (typeOf _Object) >> "displayName");

	//// BTK_Hint - Loading in...
	hint parseText format ["
	<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	<t align='left' color='#eaeaea' size='1.0'>Loading <t color='#fdd785'>%1</t> into <t color='#fdd785'>%2</t> ...</t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	",_ObjectName,_TransporterName];

	//// remove the Action
	_Transporter removeAction _Action;

	//// Animate ramp
	sleep 1;
	_Transporter animate ["ramp_top", 1];
	_Transporter animate ["ramp_bottom", 1];

	//// Attach object to transporter
	sleep 3;
	
	//// Fix for cars/apc/trucks
	if (_Object isKindOf "Car" || _Object isKindOf "Truck" || _Object isKindOf "Wheeled_APC") then {
	
		if (_Object isKindOf "Car") then {
			_Object attachTo [_Transporter,[0,1,-2.1]];
		};	
		if (_Object isKindOf "Truck") then {
			_Object attachTo [_Transporter,[0,1.4,-2.6]];
		};
		if (_Object isKindOf "Wheeled_APC") then {
			_Object attachTo [_Transporter,[0,2.2,-1.8]];
		};
	}
	else {
		_Object attachTo [_Transporter,[0,1,-2.7]];
	};
		
	//// Disable R3F
	_Object setVariable ["R3F_LOG_disabled", true];

	//// Animate ramp again
	sleep 1;
	_Transporter animate ["ramp_top", 0];
	_Transporter animate ["ramp_bottom", 0];

	//// BTK_Hint - Loaded
	hint parseText format ["
	<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> loaded.</t>
	<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
	", _ObjectName,_TransporterName];

	//// add unload/drop Action
	_UnloadAction = _Transporter addAction [("<t color=""#fadfbe"">" + ("Unload cargo") + "</t>"),"BTK\Cargo Drop\Engine.sqf",["UnloadCargo"], 5, false, true, "", "player in (assignedVehicle _target)"];

	//// Wait until unload
	waitUntil {UnloadCargo || !(alive _Transporter) || !(alive _Object)};

	
	//// If destroyed
	if (!(alive _Transporter) || !(alive _Object)) exitWith {};
	

	//// If unload
	if (DoUnload) then {
		
		//// Reset variables
		DoUnload = false;
		DoDrop = false;
		UnloadCargo = false;
		_Object setVariable ["BTK_CargoDrop_ObjectLoaded", false];

		//// BTK_Hint - Unloading...
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>Unloading <t color='#fdd785'>%1</t> from <t color='#fdd785'>%2</t> ...</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Animate ramp
		sleep 1;
		_Transporter animate ["ramp_top", 1];
		_Transporter animate ["ramp_bottom", 1];

		//// Detach object
		sleep 3;
		_Object attachTo [_Transporter,[0,-20,0]];
		sleep 0.2;
		deTach _Object;
		sleep 0.2;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),0];
		
		//// Enable R3F
		_Object setVariable ["R3F_LOG_disabled", false];

		//// Animate ramp again
		sleep 1;
		_Transporter animate ["ramp_top", 0];
		_Transporter animate ["ramp_bottom", 0];
		
		//// BTK_Hint - Unloaded
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> unloaded.</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];
	};

	//// If drop
	if (DoDrop) then {

		//// BTK_Hint - Dropping...
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'>Dropping <t color='#fdd785'>%1</t> ...</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Reset variables
		DoUnload = false;
		DoDrop = false;
		UnloadCargo = false;
		_Object setVariable ["BTK_CargoDrop_ObjectLoaded", false];

		//// Animate ramp
		sleep 1;
		_Transporter animate ["ramp_top", 1];
		_Transporter animate ["ramp_bottom", 1];

		//// Detach object (drop)
		sleep 2;
		_Object setVariable ["R3F_LOG_disabled", false];
		deTach _Object;
		_Object attachTo [_Transporter,[0,-21,0]];
		sleep 0.1;
		deTach _Object;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),(getPos _Object select 2)-6];

		//// Create parachute and smoke
		sleep 2;
		_Parachute = "ParachuteBigWest" createVehicle position _Object;
		_Parachute setPos (getPos _Object);
		_BlueSmoke = "SmokeShellBlue" createVehicle position _Object;
		_BlueSmoke setPos (getPos _Object);
		_Object attachTo [_Parachute,[0,0,-1.5]];

		//// Animate ramp again
		sleep 1;
		_Transporter animate ["ramp_top", 0];
		_Transporter animate ["ramp_bottom", 0];
		
		//// BTK_Hint - Dropped
		hint parseText format ["
		<t align='left' color='#e5b348' size='1.2'><t shadow='1'shadowColor='#000000'>Cargo Drop</t></t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		<t align='left' color='#eaeaea' size='1.0'><t color='#fdd785'>%1</t> dropped.</t>
		<img color='#ffffff' image='BTK\Cargo Drop\Images\img_line_ca.paa' align='left' size='0.79' />
		",_ObjectName,_TransporterName];

		//// Wait until ground reached
		waitUntil {(getPos _Object select 2) < 2};
		deTach _Object;
		sleep 3;
		_Object setPos [(getPos _Object select 0),(getPos _Object select 1),0.001];

		//// Enable R3F
		_Object setVariable ["R3F_LOG_disabled", false];
		
		//// Delete parachute and smoke
		sleep 15;
		deleteVehicle _BlueSmoke;
		deleteVehicle _Parachute;
	};
};