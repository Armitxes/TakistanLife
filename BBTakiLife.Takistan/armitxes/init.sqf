_funcs = execVM "armitxes\_functions.sqf"; waitUntil {scriptDone _funcs};

if(isServer) then {
  ["db\server",true] call execARM;
  ["init_map",true] call execARM;
};

["handler",true] call execARM;
["veh_functions",true] call execARM;
["plr_functions",true] call execARM;

if(!isDedicated) then 
{
  chatAbbr = "[Bugged ";
  iscop = false;
  isun = false;
  isciv = false;
  PLAYERDATA = [0];
  waitUntil {alive player};

  while {(count PLAYERDATA) != 9} do 
  {
    if (!(createDialog "Portal")) exitWith {hint "Dialog Error! - Portal";};
    ((findDisplay 5000) displayCtrl 1) ctrlSetText format["%1", getPlayerUID player]; 
    waitUntil { !dialog };
  };
   
  ["elections",false] call execARM;
  civstatsdone = true;
};