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
 *  Adds the load cargo action to the vehicle.
 *
 ******************************************************************************/


//// Variables
_Transporter = _this select 0;

//// Check for action
_BTK_CargoDrop_ActionAdded = _Transporter getVariable "BTK_CargoDrop_ActionAdded";
if (_BTK_CargoDrop_ActionAdded) exitWith {};


//// If no action continue here
_Transporter setVariable ["BTK_CargoDrop_ActionAdded", true];
_CargoAction = _Transporter addAction [("<t color=""#fadfbe"">" + ("Load cargo") + "</t>"),"BTK\Cargo Drop\Engine.sqf",["LoadCargo"], 5, false, true, "", "player in (assignedVehicle _target)"];


//// remove Action
waitUntil {((player distance _Transporter) > 20) || !(alive player) || !(alive _Transporter)};
_Transporter removeAction _CargoAction;
_Transporter setVariable ["BTK_CargoDrop_ActionAdded", false];
