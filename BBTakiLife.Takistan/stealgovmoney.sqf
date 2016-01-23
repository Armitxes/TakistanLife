// written by Gman
convoytruck removeAction action22;
player switchMove "AinvPknlMstpSlayWrflDnon_medic";

["dollarz", govconvoythiefbonus] call INV_addinventoryitem;
hintSilent format ["You got $%1 extra for stealing the Government funds!", govconvoythiefbonus];

["addWarrant",player,"Stole Paychecks",4000] execVM "warrant.sqf";

moneyintruck = false;
publicvariable "moneyintruck";