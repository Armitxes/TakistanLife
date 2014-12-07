_start = createDialog "SpawnList";

#define SpawnList1 13372
thingdAvailable = [
"Vehicles",
"Static",
"penis"
];

{
	lbAdd [16700, _x];
} forEach thingdAvailable;

normalshit = [
"ClutterCutter_EP1",
"Notebook",
"Stinger_Pod",
"Radio",
"Land_arrows_yellow_L",
"Land_arrows_yellow_R",
"FoldTable"
];

_vList = vehicles;
j = count _vList;
j=j-1;
i = 0;
y = 0;
for "i" from 0 to j do {
v = _vList select i;
vstr = format["%1",v];
typeds = Format["%1",typeOf v];
kinds = "";

varray = ["StaticWeapon","Car","Truck","UAZ_Base","VWGolf","Wheeled_APC","Motorcycle","Tank","Boat","Helicopter","Plane","Thing"];
{
if (typeds isKindOf _x) then {kinds = kinds + " " + _x;};
} forEach varray;
	
owners = format["%1",getvard];
newown = ""; 

typed = typeds;
if (!(typeds in normalshit)) then {
crewlist = "[Kind:" + kinds + "] [Type:" + typed + "]";

y = lbAdd [SpawnList1, crewlist];
lbSetData [SpawnList1, y, str(v)];
};
};