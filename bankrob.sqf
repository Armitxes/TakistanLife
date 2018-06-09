_this = _this select 3;
_art  = _this select 0;
_safe = _this select 1;

if (_art == "ausrauben") then {
	_robpool = robsafes select 0;
	_copplayernumber = playersNumber west;
	if (_copplayernumber < 3)exitWith{hintSilent "There are not enough cops on to rob this safe"};
	if(_robpool < 15000)exitWith{hintSilent "This safe has recently been stolen from and is empty"};
	if(!robenable)exitwith{hintSilent "you are already robbing the bank"};
	if(!(call INV_isArmed) and !enableDebug)exitWith{hintSilent localize "STRS_bank_rob_noweapon";};

	robenable = false;
	_startRob = round(time)+300;
	robsafes set [0,0];
	publicVariable "robsafes";
	hintSilent format[localize "STRS_bank_rob_info"];
	player playmove "AinvPknlMstpSlayWrflDnon_medic";

	('titleText [localize "STRS_bank_rob_titlemsg", "plain"]; _safe say "Bank_alarm";') call toClients;

	while {
		(_startRob > time) &&
		((player distance safe) <= 100) &&
		(!((animationState player) in animRestrained)) &&
		(alive player) &&
		((vehicle player) == player) && !([player] call plr_isUnConscious)
	} do {
		hintSilent format ["%1 seconds until successful robbery!",round(_startRob-time)];
		sleep 1;
	};
	hintSilent "";

	if((animationState player) in animRestrained || ((player distance safe) >= 100) || !(alive player) || ((vehicle player) != player) || ([player] call plr_isUnConscious)) then {
		format['[0,1,2,["busted", "%1"]] execVM "bankrob.sqf";', name player] call toClients;
	} else {
		format['[0,1,2,["opfer", %1, %2]] execVM "bankrob.sqf";', _safe, _robpool] call toClients;
		['dollarz', _robpool] call INV_AddInventoryItem;
		hintSilent format[localize "STRS_bank_rob_success"];
		stolencash = stolencash + _robpool;
		local_useBankPossible = false;
		robenable = true;
		rblock = rblock + ((_robpool/5000)*60);
		_rblock = rblock;

		sleep 2;

		if(_rblock != rblock)exitwith{};

		for [{rblock}, {rblock > -1}, {rblock=rblock-1}] do {sleep 1;};

		local_useBankPossible = true;
		rblock	   = 0;
		stolencash = 0;
	};

	robenable = true;
};


if (_art == "opfer") then
{
	if (isun) exitWith {};
	server globalchat format["The thief stole $%1!", (_this select 2)];
	sleep 4;

	_moneyz = PLAYERDATA select 1;
	_verlust = round(_moneyz*_verlust = round(_moneyz*MaxbankrobpercentlostB););

	if (_moneyz >  _verlust) then {
		if (_moneyz >= 100000) then {
			_verlust = round(_moneyz*MaxbankrobpercentlostA);

			if (_moneyz >= 1000000) then {
				_verlust = round(_moneyz*MaxbankrobpercentlostB);
			};
		};

		[-_verlust] call setMoney;
		hintSilent format[localize "STRS_bank_rob_somemoneylost", (_verlust call ISSE_str_IntToStr), (_moneyz call ISSE_str_IntToStr)];
	} else {
		PLAYERDATA set [1,0];
		hintSilent localize "STRS_bank_rob_allmoneylost";
	};
};

if (_art == "busted") then {
	server globalchat format["%1 was caught robbing the bank!", _safe];
};
