// ****************************************************************
// Script file for ArmA II
// Just a few checks and then start tow.sqf
// Created by: BB Elvis + cptrick  
// ****************************************************************
// ****************************************************************
// Usage: 	  addAction [
//			  ("<t color=""#fadfbe"">" + ("Tow Air Vehicle") + "</t>"),
//			  "BB Elvis towing\Atach.sqf",
//			  ["StartTowing"],
//			  5, false, false,
//			  "", "vehicle _this == player"];
// Arguments: none
// Returns:	  none
// ****************************************************************

// Get Air Vehicles in range
_ObjectsInRange = nearestObjects [player, ["Air"], 30];

if (count _ObjectsInRange != 1) then { // More than 1 or no objects in range

	// Display hint: Too many or No Air Vehicles in range!
	hint parseText format [ "<t color=""#fadfbe"">" + ("Too many or No Air Vehicles in range!") + "</t>" ];

} else { // Only 1 Object in Range
	
	// The Object in Range will be towed ( _P )
	_P = (_ObjectsInRange select 0);
	
	// DEBUG: this script refers to the TowingTractor?
	_T = _this select 0; 
	
	// Run towing Script with parameters _T and _P
	null = [_T,_P] execVM "BB Elvis towing\tow.sqf"; 
};