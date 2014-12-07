_civ = civmenuciv;

if(animationstate _civ == "civilsitting03" or animationstate _civ == "civilsitting02" or animationstate _civ == "civilsitting01" or animationstate _civ == "civilsitting") exitwith

{

(format ["%1 switchmove ""%2"";", _civ, "boundCaptive_unaErc"]) call toClients;
player groupchat "You released the player";

};

if(vehicle _civ != _civ)exitwith{player groupchat "the civ is in a vehicle!"};
if (!(_civ call ISSE_IsVictim)) exitwith {player groupchat localize "STRS_inventory_checknohandszip"};
if(animationstate _civ == "CivilSitting") exitwith {player groupchat "Already ziptied"}; 
if("ziptie" call INV_GetItemAmount < 1) exitwith {player groupchat "You need a zip tie in your inventory in order to use this function."};
(format ["%1 playmove ""%2"";", player, "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"]) call toClients;
(format ["%1 switchmove ""%2"";", _civ, "CivilSitting"]) call toClients;
["ziptie", -1] call INV_AddInvItem;
(format['server globalchat "%3 was zip tied by %2";if (rolestring == "%1") then {execVM "Unziptie.sqf";}', _civ, name player, name _civ]) call toClients;

