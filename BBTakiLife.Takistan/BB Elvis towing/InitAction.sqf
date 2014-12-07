// ****************************************************************
// Script file for ArmA II
// Add the Towing Action
// Created by: BTK
// Modified by: BB Elvis + cptrick 
// ****************************************************************
// ****************************************************************
// Usage: 	  [_x] execVM "BB Elvis towing\InitAction.sqf";
// Arguments: none
// Returns:	  none
// ****************************************************************


// Variables
_Transporter = _this select 0;
_Unit = _this select 1;

// Check for action
_towing_ActionAdded = _Transporter getVariable "towing_ActionAdded";
if (_towing_ActionAdded) exitWith {};

// If no action continue here
_Transporter setVariable ["towing_ActionAdded", true];
_TowingAction = _Transporter addAction [("<t color=""#fadfbe"">" + ("Tow Air Vehicle") + "</t>"),"BB Elvis towing\Attach.sqf",["StartTowing"], 5, false, false, "", "vehicle _this == player"];

// remove Action
waitUntil {(_Unit distance _Transporter > 20) || !(alive _Unit) || !(alive _Transporter)};
_Transporter removeAction _TowingAction;
_Transporter setVariable ["towing_ActionAdded", false];
