_civ = civmenuciv;

//=====================================UNRESTRAIN=========================================

if(animationState _civ in animRestrained) exitWith {
	(format ["%1 switchmove ""%2"";", _civ, "amovppnemstpsnonwnondnon"]) call toClients;
	hintSilent "You released the civilian!";
};

//==================================RESTRAIN=========================================

if(vehicle _civ != _civ)exitwith{hintSilent "the civ is in a vehicle!"};

if (!(_civ call ISSE_IsVictim)) exitwith {hintSilent localize "STRS_inventory_checknohands"};

(format['%1 switchMove "civillying01"; server globalchat "%3 was restrained by %2";if (rolestring == "%1") then {execVM "Unrestrain.sqf";}', _civ, name player, name _civ]) call broadcast;
