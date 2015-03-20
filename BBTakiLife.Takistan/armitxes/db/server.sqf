"ArmA2Ext" callExtension "Init";

"submitLoad" addPublicVariableEventHandler {
  _plr = (_this select 1);
  _local = ("ArmA2Ext" callExtension format ["ArmiNET.DB load#%1",getPlayerUID _plr]); 
  PLAYERDATA = _local;
  
  (owner _plr) publicVariableClient "lastElection";
  (owner _plr) publicVariableClient "PLAYERDATA";
  (owner _plr) publicVariableClient "warrantarray";
  (owner _plr) publicVariableClient "protesters";
};

"submitSave" addPublicVariableEventHandler { ("ArmA2Ext" callExtension format ["ArmiNET.DB save#%1",(_this select 1)]); };