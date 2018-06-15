_civ = civmenuciv;

if(animationState _civ in animRestrained) exitWith {
	(format ["%1 switchmove ""%2"";", _civ, "boundCaptive_unaErc"]) call toClients;
	hintSilent "You released the player";
};

if(vehicle _civ != _civ)exitwith{hintSilent "the civ is in a vehicle!"};
if (!(_civ call ISSE_IsVictim)) exitwith {hintSilent localize "STRS_inventory_checknohands"};
if(animationstate _civ == "CivilSitting") exitwith {hintSilent "Already ziptied"};
if("ziptie" call INV_GetItemAmount < 1) exitwith {hintSilent "You need a zip tie in your inventory in order to use this function."};
["ziptie", -1] call INV_AddInvItem;
(format['%1 switchMove "CivilSitting"; server globalchat "%3 was zip tied by %2"; if (rolestring == "%1") then {execVM "Unziptie.sqf";}', _civ, name player, name _civ]) call toClients;
