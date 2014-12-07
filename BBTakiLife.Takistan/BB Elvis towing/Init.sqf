// ****************************************************************
// Script file for ArmA II
// Init the Towing Action 
// Created by: BTK
// Modified by: BB Elvis + cptrick
// ****************************************************************
// ****************************************************************
// Usage: 	  execVM "BB Elvis towing\Init.sqf"
// Arguments: none
// Returns:	  none
// ****************************************************************

// Init

// Add action to all TowingTraktors, check every 5 seconds
while {true} do {
	{[_x] execVM "BB Elvis towing\InitAction.sqf";} forEach (nearestObjects [player, ["TowingTractor"], 10]);
	sleep 5;
};