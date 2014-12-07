PlayersSelect = lbCurSel 13371;
PSID = lbData [13371, PlayersSelect];
thiss = _this select 0;

_pList = allUnits;
j = count _pList;
j=j-1;
i = 0;
check = 0;
for "i" from 0 to j do {
v = _pList select i;
if (str(v) == PSID) then {
target = v;
nice = i;
check = 1;
};
};
if (check == 0) then {exit;};
thistxt = ctrlText(19001);

if (thiss == 9) then {
  if(thistxt call ISSE_str_isInteger) then {
    _banTime = time + ((call compile thistxt)*60);
    (format ["if (player == %1) then { ARM_bannedTimer = %2; };",target,_banTime]) call toClients;
  };
};

closeDialog 0;