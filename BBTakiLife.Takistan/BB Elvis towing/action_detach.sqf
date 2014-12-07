// ****************************************************************
// Script file for ArmA II
// detach Airvehicle
// Created by: rundll.exe
// Modified by: BB Elvis + cptrick 
// ****************************************************************
// ****************************************************************
// Usage: 	  _action_detach = _T addaction ["Detach",
//            "BB Elvis towing\action_detach.sqf"];
// Arguments: none
// Returns:	  none
// ****************************************************************

_T = _this select 0;

// We are no longer towing
_T setVariable ["dll_tow_towing", false];