_unCP = [["Open/Close Border (West)","noscript.sqf",'[""unCP"",""cpWest""] execVM ""armitxes\remote.sqf""'],["Open/Close Border (East)","noscript.sqf",'[""unCP"",""cpEast""] execVM ""armitxes\remote.sqf""']]; 
// ["Open/Close Border (Central)","CodePad.sqf",[[9,1,4,8,2], {["unCP","cpCentral"] execVM "armitxes\remote.sqf"}, {ctrlSetText [999,"Wrong code!"]; sleep 1; ctrlSetText [999, ""];}]]
_court = [["Open Cell 1","noscript.sqf",'[""door"",cCell1] execVM ""armitxes\remote.sqf""'],["Open Cell 2","noscript.sqf",'[""door"",cCell2] execVM ""armitxes\remote.sqf""'],["UNPOL Terminal","CodePad.sqf",[[9,1,4,8,2], {if(isun)then{createDialog "CopMenuLite";};}, {ctrlSetText [999,"Wrong code!"]; sleep 1; ctrlSetText [999, ""];}]]];

_build = [
  //["Land_A_Hospital",[4398,9579,0],327],
  ["Land_House_C_4_EP1",[6814.44,8905.19,0],-250],
  ["Notebook",[5153,6060,4],75,_unCP],
  ["Notebook",[3507.7, 8343.1,1],47,[(_unCP select 0),(_court select 2)]],
  //["Notebook",[5948.55,7526,1],97,[(_unCP select 1),(_court select 2)]],
  ["Notebook",[9048,5889.7,1],47,[(_unCP select 1),(_court select 2)]],
  ["Notebook",[4146,9478.5,5.2],10,_court]
];

{
  _class = _x select 0;
  _cur = (_class) createVehicle (_x select 1);
  _cur setDir (_x select 2);
  _cur setPos (_x select 1);
  
  if (_class == "Notebook") then {
    _init = ""; 
        
    {
      _init = _init + format["this addAction %1;",_x];
    } forEach (_x select 3);   
    
    _cur setVehicleInit _init;      
  };
} forEach _build;

processInitCommands;