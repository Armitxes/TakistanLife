INV_CanUseInventory     = true;
INV_CanUseItem          = true;
INV_CanDropItem         = true;
INV_CanGiveItem         = true;
INV_Tragfaehigkeit	= 60;
_vipLvl = PLAYERDATA select 3;
if (_viplvl == 1) then {INV_Tragfaehigkeit	= 65;};
if (_viplvl == 2) then {INV_Tragfaehigkeit	= 70;};
if (_viplvl == 3) then {INV_Tragfaehigkeit	= 75;};
if (_viplvl == 4) then {INV_Tragfaehigkeit	= 80;};
INV_InventarArray   = [];
INV_SteuernGezahlt	= 0;

INV_inactive_vcl_maxtime  = 45;