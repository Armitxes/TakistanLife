waitUntil {!isnull player && player == player}; sleep 15;
 
fnc_hckhint = {
  private ["_code"];
  _code = _this select 0;
  hint parseText format["<t size='1.25' font='Zeppelin33' color='#ff0000'>! - HACKER - !</t><br /><br />%1", _code];
  systemChat format[" ! ! ! ! Script kiddie found: %1 - [saved in logs]", _code];
  diag_log format["%1", _code];
};
 
"anticheat" addPublicVariableEventHandler {[_this select 1] call fnc_hckhint;};
 
_cfg = configFile >> "CfgPatches";
_patches = [];
for "_i" from 0 to count (_cfg)-1 do
{
  _sel = _cfg select _i;
  if(isClass _sel) then
  {
          _name = configName _sel;
          _patches set[count _patches,_name];
  };
};
 
if("DevCon" in _patches) then
{
  _code = format["%1 is using dev-con to execute scripts.", name player];
  anticheat = _code;
  publicVariable "anticheat";
  disableUserInput true;
};
 
[] spawn
{
  while {true} do
  {
    if(
      !isNil {DZE_StaticConstructionCount} ||
      !isNil {l33thtmlv1} ||
      !isNil {MainScripts} ||
      !isNil {junbut} ||
      !isNil {Lando_Godmode} ||
      !isNil {B1g_B3nProEsp} ||
      !isNil {scroll_m_init_star} ||
      !isNil {exstr1} ||
      !isNil {pathtoscrdir3} ||
      !isNil {Monky_funcs_inited} ||
      !isNil {Monky_initMenu} ||
      !isNil {player_zombieCheck} ||
      !isNil {godlol} ||
      !isNil {playericons} ||
      !isNil {abcdefGEH} ||
      !isNil {wierdo} ||
      !isNil {go_invisible_infiSTAR} ||
      !isNil {serverObjectMonitor} ||
      !isNil {enamearr} ||
      !isNil {initarr3} ||
      !isNil {locdb} ||
      !isNil {sCode} ||
      !isNil {infAmmoIndex} ||
      !isNil {nukeDONEstar} ||
      !isNil {J_ro} ||
      !isNil {executec0de}                    
    ) then
    {
      _code = format["%1 is using cheats. PUID: %2", name player, getPlayerUID player];
      anticheat = _code;
      publicVariable "anticheat";
      sleep 1;
      endMission "Loser";
    };
    sleep 20;
  };
};