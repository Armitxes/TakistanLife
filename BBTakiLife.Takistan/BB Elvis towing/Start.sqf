// ****************************************************************
// Script file for ArmA II
// Start BB Elvis towing Init 
// Created by: BB Elvis + cptrick
// ****************************************************************
// ****************************************************************
// Usage: 	  execVM "BB Elvis towing\Start.sqf"
// Arguments: none
// Returns:	  none
// ****************************************************************

// Start the towing

// Wait until player ready, exit if server
waitUntil {!isNull player};
if (!local player) exitWith {};

// Launch the init once
execVM "BB Elvis towing\Init.sqf";