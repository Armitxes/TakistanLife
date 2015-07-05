execARM = { _scr = execVM (format ["armitxes\%1.sqf",_this select 0]); if((_this select 1)) then { waitUntil {scriptDone _scr}; } };
execString = { _code = _this select 0; if(_code != "") then { call compile _code; }; }; 
msg_pd = { titleText [_this select 0, "plain down"]; };

ARM_fnc_countDown = {
  _c = _this select 0;
  for [{_x=0},{_x<=_c},{_x=_x+1}] do { sleep 1; };
  true
};

if(!isDedicated) then
{
	setMoney = {
		PLAYERDATA set [1, (PLAYERDATA select 1) + (_this select 0)];
	};
	
	getFactionRank = {
		_facID = _this select 0; _rnkID = _this select 1;
		_result = ["Factionless","-"];
		switch (_facID) do {
			case 1: {
				_result set [0, "Police Force"];
				switch (_rnkID) do {
					case 0:{_result set [1,"Recruit"];};
					case 3:{_result set [1,"Cadet"];};
					case 5:{_result set [1,"Constable"];};
					case 7:{_result set [1,"Sergeant"];};
					case 9:{_result set [1,"Inspector"];};
					case 11:{_result set [1,"Chief Inspector"];};
					case 15:{_result set [1,"Superintendent"];};
					case 16:{_result set [1,"Chief Superintendent"];};
					case 19:{_result set [1,"Commander"];};
					case 49:{_result set [1,"Deputy Comissioner"];};
					case 50:{_result set [1,"Commissioner"];};
					case 100:{_result set [1,"SCO19 Recruit"];};
					case 101:{_result set [1,"SCO19 Officer"];};
					case 102:{_result set [1,"SCO19 Commander"];};
					case 150:{_result set [1,"Internal Affairs"];};
				};
			};
			case 2: {
				_result set [0, "United Nations"];
				switch (_rnkID) do {
					case 0:{_result set [1,"Recruit"];};
					case 1:{_result set [1,"Private First Class"];};
					case 2:{_result set [1,"Corporal"];};
					case 3:{_result set [1,"Sergeant"];};
					case 4:{_result set [1,"Sergeant Major"];};
					case 10:{_result set [1,"Lieutenant"];};
					case 20:{_result set [1,"Major"];};
					case 50:{_result set [1,"General"];};
				};
			};
		};
		_result
	};
	
	ARM_bannedTimer = 0;
	ARM_fnc_betterChat = {
		_banTime = (ARM_bannedTimer-time);
		if(_banTime > 0) exitWith { systemChat format["You have been banned from this chat. %1 seconds(s) left.",floor(_banTime)]; };
		
		_param = (_this select 0);
		if ((typeName _param) == "STRING" && _param != "") then {
			_thisArr = toArray(_param);
			if( !(39 in _thisArr) &&  !(34 in _thisArr) ) then {
				_abbr = chatAbbr;
				_fcabbr = "| UN]";
				if(iscop) then {
					_fcabbr = "| Cop]";
					if(ischief) then { _fcabbr = "| CC]"; };
				} else {
					if(isciv) then {
						_fcabbr = "| Civ]";
						if(ismedic) then { _fcabbr = "| MEDIC]"; } else {
							if(ispmc) then { _fcabbr = "| PMC]"; } else {
								if(isMayor) then { _fcabbr = "| PM]"; } else {
									if(isjudge) then { _fcabbr = "| Judge]"; } else {
										if(islawyer) then { _fcabbr = "| Lawyer]"; };
									};
								};
							};
						};
					};
				};
			    _abbr = _abbr + _fcabbr;
		     
				_message = format ["systemChat ""%1 (%2): %3"";",_abbr, name player, _param];
				(_message) call toClients;
			} else { systemChat "You are not allowed to use '' or ' in global chat! ";};
		};
	};
  
	fnc_prof_setDescr = {
		_display = findDisplay 1602;
		_listbox = (_display displayCtrl 1);
		_data = (call compile (_listbox lbData (_this select 1)));
		(_display displayCtrl 2) ctrlSetText (localize (_data select 1));
	};
};