"submitLoad" addPublicVariableEventHandler {
	_plr = (_this select 1);
	_owner = (owner _plr);
	_local = "ArmiNET" callExtension (format ["getplayer#%1",getPlayerUID _plr]);
	PLAYERDATA = _local;

	_owner publicVariableClient "lastElection"; _owner publicVariableClient "PLAYERDATA";
	_owner publicVariableClient "warrantarray"; _owner publicVariableClient "protesters";
};

"submitSave" addPublicVariableEventHandler { "ArmiNET" callExtension (format ["setplayer#%1",(_this select 1)]); };
"nation" addPublicVariableEventHandler { "ArmiNET" callExtension (format ["setnation#%1",(_this select 1)]); };
