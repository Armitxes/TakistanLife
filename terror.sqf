if("bomb" call INV_HasLicense)then
{
  if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
  ctrlSetText [1,"Are you sure that you want to declare terrorism?"];
  waitUntil{(not(ctrlVisible 1023))};
  
  if (Antwort == 1) then {
    (format["server globalchat ""%1 DECLARED TERRORISM!"";", name player]) call toClients;
    ["addWarrant",player,"Terrorism",18000] execVM "warrant.sqf";
    INV_LizenzOwner = INV_LizenzOwner - ["bomb"];
    isterror = false;
    player removeAction action123;
  };
  
  Antwort = 2;
};