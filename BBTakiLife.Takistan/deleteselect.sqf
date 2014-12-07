PlayersSelect = lbCurSel 13372;
PSID = lbData [13372, PlayersSelect];
_pList = vehicles;
j = count _pList;
j=j-1;
i = 0;
player commandChat format ["%1 ----",PSID];

for "i" from 0 to j do {
v = _pList select i;
if (str(v) == PSID) then {
player commandChat "Deleting vehicle";
{
_x leaveVehicle v;
} forEach crew v;
deleteVehicle v;
};
};