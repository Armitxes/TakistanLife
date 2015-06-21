execARM = { _scr = execVM (format ["armitxes\%1.sqf",_this select 0]); if((_this select 1)) then { waitUntil {scriptDone _scr}; } };
execString = { _code = _this select 0; if(_code != "") then { call compile _code; }; }; 
msg_pd = { titleText [_this select 0, "plain down"]; };

ARM_fnc_countDown = {
  _c = _this select 0;
  for [{_x=0},{_x<=_c},{_x=_x+1}] do { sleep 1; };
  true
};

//DB
if(!isDedicated) then
{
	setMoney = {
		PLAYERDATA set [1, (PLAYERDATA select 1) + (_this select 0)];
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
						if(isMedic) then { _fcabbr = "| MEDIC]"; };
						if(ispmc) then { _fcabbr = "| PMC]"; };
						if(isMayor) then { _fcabbr = "| PM]"; };
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