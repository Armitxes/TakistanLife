_start = createDialog "PlayersMenu";

#define PlayersMenu 13371

_pList = playableUnits;
j = count _pList;
j=j-1;
i = 0;

for "i" from 0 to j do {
v = _pList select i;

namestr = name(v) + " [UID:" + getplayerUID(v) + " - ID:" + format["%1",owner v] + "] [Side:" + format["%1",side(v)] + "] [Skin:" + typeOf(v) + "] [Object:" + format["%1",v] + "] [Health:" + format["%1",(((damage v)-100) * -1)] + "%] [Alive:" + format["%1",alive v] + "] [Vehicle:" + Format["%1",typeOf(vehicle v)] + "] [Speed:" + format["%1",round(speed (vehicle v))] + "] [Weap:" + format["%1",currentWeapon (vehicle v)] + "]";
_num1 = lbAdd [PlayersMenu, namestr];
lbSetData [PlayersMenu, _num1, str(v)];
};

_pList = allDead;
j = count _pList;
j=j-1;
i = 0;

for "i" from 0 to j do {
v = _pList select i;

namestr = name(v) + " [UID:" + getplayerUID(v) + " - ID:" + format["%1",owner v] + "] [Side:" + format["%1",side(v)] + "] [Skin:" + typeOf(v) + "] [Object:" + format["%1",v] + "] [Health:" + format["%1",(((damage v)-100) * -1)] + "%] [Alive:" + format["%1",alive v] + "] [Vehicle:" + Format["%1",typeOf(vehicle v)] + "] [Speed:" + format["%1",round(speed (vehicle v))] + "] [Weap:" + format["%1",currentWeapon (vehicle v)] + "]";
_num1 = lbAdd [PlayersMenu, namestr];
lbSetData [PlayersMenu, _num1, str(v)];
};