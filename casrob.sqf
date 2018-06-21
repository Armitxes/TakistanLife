_this = _this select 3;
_art  = _this select 0;
_safe = _this select 1;

if (_art == "robcas") then {
  _robpool = robsafes select 1;
  if ((playersNumber west) < 3)exitWith{hintSilent "There are not enough cops on to rob this safe"};
  if(_robpool < 15000)exitWith{hintSilent "This safe has recently been stolen from and is empty"};
  if(!robenable)exitwith{hintSilent "You are already robbing the casino"};
  if(!(call INV_isArmed) and !enableDebug)exitWith{hintSilent localize "STRS_casino_rob_noweapon";};

  robenable = false;
  _startRob = round(time)+600;
  robsafes set [1,0];
  publicVariable "robsafes";
  hintSilent format[localize "STRS_casino_rob_info"];
  player playmove "AinvPknlMstpSlayWrflDnon_medic";

  ('titleText [localize "STRS_casino_rob_titlemsg", "plain"]; _safe say "Bank_alarm";') call toClients;

  while {
    (_startRob > time) &&
    ((player distance csafe) <= 60) &&
    (!((animationState player) in animRestrained)) &&
    (alive player) &&
    ((vehicle player) == player) && !([player] call plr_isUnConscious)
  } do {
    hint format ["%1 seconds until successful robbery!",round(_startRob-time)];
    sleep 1;
  };
  hint "";

  if((animationState player) in animRestrained || ((player distance csafe) >= 60) || !(alive player) || ((vehicle player) != player) || ([player] call plr_isUnConscious)) then {
    format['[0,1,2,["busted", "%1"]] execVM "casrob.sqf";', name player] call toClients;
  } else {
    format['[0,1,2,["success", %1, %2]] execVM "casrob.sqf";', _safe, _robpool] call toClients;
    ['dollarz', _robpool] call INV_AddInventoryItem;
    hintSilent format[localize "STRS_casino_rob_success"];
    time_casino_rob_lockdown = time + 600;
    time_bank_lockout = time + ((_robpool/20000)*60);
  };

  robenable = true;
};

if (_art == "success") then {
  time_casino_rob_lockdown = time + 600;
  server globalchat format["The thief stole $%1!", (_this select 2)];
  server globalchat "The Casino has just been robbed successfully all bets are off for 10 minutes!!";
};


if (_art == "busted") then { server globalchat format["%1 was caught robbing the casino!", _safe]; };
