while {iscop} do
{
	sleep 170;
	hintSilent format[localize "STRS_dollarz_countdown", "2"];
	sleep 60;
	hintSilent format[localize "STRS_dollarz_countdown", "1"];
	sleep 50;
	
	_income = 350 + extrapay;
	
	if ("patrol_training" call INV_HasLicense) then { _income = _income + 25; };
	if ("response_training" call INV_HasLicense) then { _income = _income + 50; };
	if ("SCO_training" call INV_HasLicense) then { _income = _income + 75; };
	if ("copAir" call INV_HasLicense) then { _income = _income + 50; };
	
	if (!(convoywinner == "Cops and UN") && !(convoywinner == "Neither")) then  
	{
		hintSilent format["No paychecks have been delivered by the last convoy, you'll receive less payment!"];
		_income = _income - 150;
	};
	
	if (ischief) then { _income = _income + chiefExtraPay; };
	if((vehicle player) != player && iscop && !siren) then {
		_district = (player getVariable "pubPlrData") select 3;
		_disName = districts select _district;
		if(_district > 0 && _district < 5) then {
			if(!([player,_disName] call fnc_isInMarker)) then {
				_income = _income - 150;
				server globalChat format["You are not in the %1 district. You received $150 less payment.",_disName];
			};
		};
	};

	_coptax = round(INV_SteuernGezahlt * 0.05);
	[(round _income) + (round _coptax)] call setMoney;
	INV_SteuernGezahlt = 0;
	
	hintSilent format["You received $%1. as payment including taxes.", ((round _income) call ISSE_str_IntToStr)];
	
	sleep 1;
	if(ischief)then{hintSilent format["As the Chief Constable you get an extra paycheck of $%1.", (chiefExtraPay call ISSE_str_IntToStr)]};
	["save"] execVM "armitxes\_db.sqf"; 
};

while {isun} do
{
	sleep 170;
	hintSilent format[localize "STRS_dollarz_countdown", "2"];
	sleep 60;
	hintSilent format[localize "STRS_dollarz_countdown", "1"];
	sleep 50;
	
	_untax = round(INV_SteuernGezahlt * 0.025);
	INV_SteuernGezahlt = 0;  
	
	_incomeun = 100 + extrapay;
	_incomeun = _incomeun + 400 + _untax;
	
	if (!(convoywinner == "Cops and UN") && !(convoywinner == "Neither")) then  
	{
		hintSilent format["No paychecks have been delivered by the last convoy, you'll receive less payment!"];
	  _incomeun = _incomeun - 150;
	};
	hintSilent format["The United Nations gave you a paycheck of $%1 and an extra of $%2 as bonus.",_incomeun,paybonus];
	[(_incomeun + paybonus)] call setMoney;
	paybonus = 0;
	["save"] execVM "armitxes\_db.sqf";
};

while {isciv} do
{
  sleep 170;
  hintSilent format[localize "STRS_dollarz_countdown", "2"];
  sleep 60;
  hintSilent format[localize "STRS_dollarz_countdown", "1"];
  sleep 50;
  
  if ((alive player) and (deadcam == 0)) then

	{

	_workplacepaycheck = 0;
	_uniPaycheck       = 0;
	_unimsg            = "";
	_atworkplacemsg    = localize "STRS_dollarz_nowere";
	_hashideoutmsg     = "";
	
	_income            = 100 + extrapay;

	if (convoywinner == "Civs" && !(convoywinner == "Neither")) then
	{
		hintSilent format["The robbers are sharing the robbed Paychecks! You receive extra money."];
		_income = _income + 100;
	};
	if (ispmc || isjudge) then {_income = _income + 500;};	
	
	if (timeinworkplace > 0) then {
		_workplacepaycheck = (round(add_workplace/180*timeinworkplace));
		_income = _income + _workplacepaycheck;
		_atworkplacemsg     = localize "STRS_dollarz_were";
	};

	if(gangmember) then {
		if(gangarea1 getVariable "control" == group player)then{_income = _income + gangincome;};
		if(gangarea2 getVariable "control" == group player)then{_income = _income + gangincome;};
		if(gangarea3 getVariable "control" == group player)then{_income = _income + gangincome;};
	};

	timeinworkplace = 0;
	_income = round _income;
	[_income] call setMoney;
	hintSilent format[localize "STRS_dollarz_civmoneyadd", rolestring, (_income call ISSE_str_IntToStr)];
	
  if (isMayor) then {
  	MayorSteuern = MayorSteuern + INV_SteuernGezahlt;
  	MayorSteuern = round((MayorSteuern / 100) * MayorBekommtSteuern);
  	[MayorSteuern + MayorExtraPay] call setMoney;
  	hintSilent format["As a Prime Minister you get an extra paycheck of $%1. You also got $%2 taxes.", (MayorExtraPay call ISSE_str_IntToStr), (MayorSteuern call ISSE_str_IntToStr)];
	}
	else
	{ 
    if (INV_SteuernGezahlt > 0) then { (format["if (isMayor) then {MayorSteuern = MayorSteuern + %1;};", INV_SteuernGezahlt]) call toClients; };
	};

	MayorSteuern   = 0;
	INV_SteuernGezahlt = 0;

	} else { hintSilent format[localize "STRS_dollarz_paycheckdead"]; };
  ["save"] execVM "armitxes\_db.sqf";
};
