"ArmA2Ext" callExtension "Init";
constitution = call compile ("ArmA2Ext" callExtension "ArmiNET.DB loadLaws");

"submitLoad" addPublicVariableEventHandler {
	_plr = (_this select 1);
	_owner = (owner _plr);
	_local = ("ArmA2Ext" callExtension format ["ArmiNET.DB load#%1",getPlayerUID _plr]); 
	PLAYERDATA = _local;

	_owner publicVariableClient "lastElection"; _owner publicVariableClient "PLAYERDATA";
	_owner publicVariableClient "warrantarray"; _owner publicVariableClient "protesters";
	_owner publicVariableClient "constitution";
};

"submitSave" addPublicVariableEventHandler { "ArmA2Ext" callExtension format ["ArmiNET.DB save#%1",(_this select 1)]; };
"constitution" addPublicVariableEventHandler {_arr = _this select 1; "ArmA2Ext" callExtension format ["ArmiNET.DB addLaw#%1",_arr select (count(_arr)-1)];};
"nation" addPublicVariableEventHandler { "ArmA2Ext" callExtension format ["ArmiNET.DB setNation#%1",(_this select 1)]; };