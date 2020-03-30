while {iscop} do {
	_income = 250;
	sleep 300;
	if ("patrol_training" call INV_HasLicense) then { _income = _income + 25; };
	if ("response_training" call INV_HasLicense) then { _income = _income + 50; };
	if ("SCO_training" call INV_HasLicense) then { _income = _income + 75; };
	if ("copAir" call INV_HasLicense) then { _income = _income + 50; };
	if (!(convoywinner == "Cops and UN") && !(convoywinner == "Neither")) then { _income = _income - 150; };

	if (ischief) then { _income = _income + chiefExtraPay; };

	_vcl = vehicle player;
	if(_vcl != player && iscop) then {
		hasSiren = _vcl getVariable "siren";

		if (isNil "hasSiren") then { hasSiren = false; };
		_district = (player getVariable "pubPlrData") select 3;
		_disName = districts select _district;
		if(_district > 0 && _district < 5 && !hasSiren) then {
			if(!([player,_disName] call fnc_isInMarker)) then {
				_income = _income - 50;
				server globalChat format["You are not in the %1 district. You received $50 less payment.",_disName];
			};
		};
	};

	_income = round (_income + (INV_SteuernGezahlt * 0.5));
	[_income] call setMoney;
	INV_SteuernGezahlt = 0;

	["add","finances",format ["You received $%1 as payment including taxes.", _income],true] execVM "armitxes\logs.sqf";
	sleep 1; ["save"] execVM "armitxes\_db.sqf";
};

while {isun} do
{
	_income = 200;
	sleep 300;
	if (!(convoywinner == "Cops and UN") && !(convoywinner == "Neither")) then { _income = _income - 150; };
	["add","finances",format ["The United Nations gave you a paycheck of $%1 and an extra of $%2 as bonus.",_income,paybonus],true] execVM "armitxes\logs.sqf";
	[(_income + paybonus)] call setMoney; paybonus = 0;
	sleep 1; ["save"] execVM "armitxes\_db.sqf";
};

while {isciv} do
{
	_income = 350;
	sleep 300;
	_workplacepaycheck = 0;
	_uniPaycheck       = 0;
	_unimsg            = "";
	_atworkplacemsg    = localize "STRS_dollarz_nowere";
	_hashideoutmsg     = "";

	if (convoywinner == "Civs" && !(convoywinner == "Neither")) then { _income = _income + 100; };
	if (ispmc || isjudge) then {_income = _income + 500;};

	if (timeinworkplace > 0) then {
		_workplacepaycheck = (round(add_workplace/180*timeinworkplace));
		_income = _income + _workplacepaycheck;
		_atworkplacemsg     = localize "STRS_dollarz_were";
	};

	if(gangmember) then {
		if(gangarea1 getVariable "control" == group player)then{_income = _income + 100;};
		if(gangarea2 getVariable "control" == group player)then{_income = _income + 100;};
		if(gangarea3 getVariable "control" == group player)then{_income = _income + 100;};
	};

	if (isMayor) then {
		MayorSteuern = MayorSteuern + INV_SteuernGezahlt;
		MayorSteuern = round((MayorSteuern / 100) * MayorBekommtSteuern);
		_income = _income + (MayorSteuern + MayorExtraPay);
	} else {
		if (INV_SteuernGezahlt > 0) then { (format["if (isMayor) then {MayorSteuern = MayorSteuern + %1;};", INV_SteuernGezahlt]) call toClients; };
	};

	timeinworkplace = 0;
	_income = round _income;
	[_income] call setMoney;
	["add","finances",format ["%1, you received a paycheck of $%2. If you own a gang area you got extra. The Money has been transferred to your account.", rolestring, (_income call ISSE_str_IntToStr)],true] execVM "armitxes\logs.sqf";
	MayorSteuern   = 0;
	INV_SteuernGezahlt = 0;
	sleep 1;
	["save"] execVM "armitxes\_db.sqf";
};
