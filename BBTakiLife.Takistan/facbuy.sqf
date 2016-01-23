_num     = ((_this select 3) select 0);
_fabname = ((INV_ItemFabriken select _num) select 1);
_cost    = ((INV_ItemFabriken select _num) select 6);

if (_fabname in INV_Fabrikowner) exitWith {hintSilent localize "STRS_inv_alreadygotshop";};
if ((PLAYERDATA select 1) < _cost) exitWith { hintSilent localize "STRS_inv_kein_dollarz"; };
 
INV_Fabrikowner = INV_Fabrikowner + [ _fabname ];
_fabwork = ((INV_ItemFabriken select _num) select 8);

call compile format['%1workers = %1workers + 1;', _fabwork];
(PLAYERDATA select 8) set [_num,((PLAYERDATA select 8) select _num) + 1];

[-(_cost)] call setMoney;

hintSilent format[localize "STRS_inv_gotshop", player, (_cost call ISSE_str_IntToStr)];