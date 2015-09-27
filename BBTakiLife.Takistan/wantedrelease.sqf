_civnumber      = _this select 0;
_reason         = _this select 1;
_deletekopfgeld = _this select 2;
_autoReason     = _this select 3;
_civnumber      = _civnumber+1;
_civ            = format["civ%1", _civnumber];
_civvar		      = call compile format["%1", _civ];

//if (_civ == rolestring) exitWith {player groupChat localize "STRS_kopfgeld_notself";};
if (not(_civ call ISSE_UnitExists)) exitWith {role groupChat localize "STRS_player_not_ingame";};

if (_deletekopfgeld == 1) exitWith
{
  ["deleteWarrant",_civvar, "", 0] execVM "warrant.sqf";    
  player groupChat format [localize "STRS_kopfgeld_entfernt", _civ];
};

if (iscop && (_autoReason == 0)) then
{
  if (_reason == "Crime not in List? Log crime here!") exitWith {player groupChat "You must enter a description of the crime!"};
   
  if ((!(alive _civvar)) or (_civarrestedvar == 1)) exitWith {role groupChat format [localize "STRS_kopfgeld_nokopfgeld", _civ];};
  format ["server globalchat ""%2 is wanted for %3 by %1"";", name player, name _civvar, _reason] call toClients;
  ["addWarrant",_civvar,_reason,1000] execVM "warrant.sqf";
} else {
  _bounty = 0;
  _reason = "";
  if (iscop) then { 
    switch (_autoReason) do
    {
      case 1: { _reason = "Murder"; _bounty = 12000; };
      case 2: { _reason = "Hit & Run"; _bounty = 10000; };
      case 3: { _reason = "Bribery"; _bounty = 2000; };
      case 4: { _reason = "VIP Assassination"; _bounty = 18000; };
      case 5: { _reason = "Bank/Casino Robbery"; _bounty = 8000; };
      case 6: { _reason = "Breach of Highway Code"; _bounty = 1000; };
      case 7: { _reason = "Evading a Police Checkpoint"; _bounty = 5000; };
      case 8: { _reason = "Evading the Police"; _bounty = 3000; };
      case 9: { _reason = "Theft of Civilian Vehicle"; _bounty = 4000; };
      case 10: { _reason = "Possession of Class A Drug"; _bounty = 8000; };
      case 11: { _reason = "Possession of Class B Drug"; _bounty = 6000; };
      case 12: { _reason = "Assault"; _bounty = 5000; };
      case 13: { _reason = "Rioting"; _bounty = 3000; };
      case 14: { _reason = "Perverting the Course of Justice"; _bounty = 2000; };
      case 15: { _reason = "Robbery"; _bounty = 4000; };
      case 16: { _reason = "Attempted Murder"; _bounty = 6000; };
      case 17: { _reason = "Attempted Vehicle Theft"; _bounty = 2000; };
      case 18: { _reason = "Possession of Illegal Weapon"; _bounty = 3000; };
      case 19: { _reason = "Anti Social Behaviour"; _bounty = 2000; };
      case 20: { _reason = "Escaping Jail"; _bounty = 16000; };
      case 21: { _reason = "Assisting a Jail Break"; _bounty = 7000; };
      case 22: { _reason = "Arson"; _bounty = 5000; };
      case 23: { _reason = "Kidnap"; _bounty = 9000; };
      case 24: { _reason  = "Manslaughter"; _bounty = 5000;};
      case 25: { _reason  = "Kidnapping a VIP"; _bounty = 11000;};
      case 26: { _reason  = "Breach of Aviation Law"; _bounty = 2500;};
      case 27: { _reason = "Terrorism"; _bounty = 15000; };
	  case 28: { _reason = "Theft of UN/Cop Vehicle"; _bounty = 6000; };
      case 39: { _reason = "Illegal Border Crossing"; _bounty = 5000; };
      case 30: { _reason = "Crimes Against Humanity"; _bounty = 17000; };
      case 31: { _reason = "Abuse of Emergency call"; _bounty = 2500; };
    };
  } else {
    if(isun) then {
      switch (_autoReason) do
      {
        case 0: { _reason = "Theft of UN/Cop Vehicle"; _bounty = 6000; };
        case 1: { _reason = "Illegal Border Crossing"; _bounty = 5000; };
        case 2: { _reason = "Crimes Against Humanity"; _bounty = 17000; };
		case 3: { _reason = "Abuse of Emergency call"; _bounty = 3000; };
		case 4: { _reason = "Slavery"; _bounty = 12000; };
      };
    };
  };
  if (_reason != "") then {
    format ["server globalchat ""%2 is wanted for %3 by %1"";", name player, name _civvar, _reason] call toClients;
    ["addWarrant",_civvar,_reason,_bounty] execVM "warrant.sqf";
  };
};
