_start = createDialog "SpawnList";

#define SpawnList1 13372


pon = compile format["VLISTUP_%1=[];",getplayerUID player];
call pon;
player commandchat format["--- %1 ----",pon];
format["VLISTUP_%1",getplayerUID player] addPublicVariableEventHandler {
player commandchat "Data recieved from host.";
_vList = _this select 1;
j = count _vList;
j=j-1;
for [{i=0},{i<j},{i=i+6}] do {
_object1 = _vList select i;
_owner1 = _vList select (i+1);
_speed1 = _vList select (i+2);
_weapons1 = _vList select (i+3);
_users1 = _vList select (i+5);
_damage1 = _vList select (i+4);
_added = lbAdd [13372, format["[%2] %1",_object1,_owner1]];
lbSetData [13372, _added, format["_object1=%1; _owner1=%2; _speed1=%3; _weapons1=%4; _damage1=%5; _users1=%6;",str(_object1),str(_owner1),str(_speed1),str(_weapons1),str(_damage1),str(_users1)]];
};
pon = compile format["VLISTUP_%1=[];",getplayerUID player];
call pon;
};
player commandchat format["--- %1 ----",pon];
player setVehicleInit format["if (IsServer) then { diag_log ""From VLISTUP_%1 : Wants data for vitems.""; _sendarr = []; a=0; {_sendarr set [(a), _x]; _sendarr set [(a+1), owner str_x]; _sendarr set [(a+2), speed _x]; _sendarr set [(a+3), weapons _x]; _sendarr set [(a+4), damage _x]; _sendarr set [(a+5), crew _x]; a=a+6;} forEach vehicles; VLISTUP_%1=_sendarr; publicVariable ""VLISTUP_%1"";};",getplayerUID player];
processInitCommands;
clearVehicleInit player;