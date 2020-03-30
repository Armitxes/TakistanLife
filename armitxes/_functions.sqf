execString = { _code = _this select 0; if(_code != "") then { call compile _code; }; };
msg_pd = { titleText [_this select 0, "plain down"]; };

setHeightASL = {
	private ["_obj","_pos","_y"];
	_obj = _this select 0; _y = _this select 1;
	_pos = getPosASL _obj;
	_obj setPosASL [_pos select 0, _pos select 1, _y];
};

if(!isDedicated) then {
	setMoney = {
		PLAYERDATA set [1, (PLAYERDATA select 1) + (_this select 0)];
	};

	setHeight = {
		private ["_obj","_pos","_y"];
		_obj = _this select 0; _y = _this select 1; _sim = _this select 2;
		_pos = getPosATL _obj;
		_obj setPosATL [_pos select 0, _pos select 1, _y];
	};

	fnc_ClearWarrantsArray = {
		for [{_i=0}, {_i < (count warrantarray)}, {_i=_i+1}] do {
			if ( isNull((warrantarray select _i) select 0) ) then {
				warrantarray set [_i,-1];
			};
		};
		warrantarray = warrantarray - [-1];
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

	fnc_isInMarker = {
		private ["_p","_m", "_px", "_py", "_mpx", "_mpy", "_msx", "_msy", "_rpx", "_rpy", "_xmin", "_xmax", "_ymin", "_ymax", "_ma", "_res", "_ret"];

		_p = _this select 0; // object
		_m = _this select 1; // marker

		if (typeName _p == "OBJECT") then {
			_px = position _p select 0;
			_py = position _p select 1;
		} else {
			_px = getMarkerPos _p select 0;
			_py = getMarkerPos _p select 1;
		};

		_mpx = getMarkerPos _m select 0;
		_mpy = getMarkerPos _m select 1;
		_msx = getMarkerSize _m select 0;
		_msy = getMarkerSize _m select 1;
		_ma = -markerDir _m;
		_rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
		_rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;
		if ((markerShape _m) == "RECTANGLE") then {
			_xmin = _mpx - _msx;_xmax = _mpx + _msx;_ymin = _mpy - _msy;_ymax = _mpy + _msy;
			if (((_rpx > _xmin) && (_rpx < _xmax)) && ((_rpy > _ymin) && (_rpy < _ymax))) then { _ret=true; } else { _ret=false; };
		} else {
			_res = (((_rpx-_mpx)^2)/(_msx^2)) + (((_rpy-_mpy)^2)/(_msy^2));
			if ( _res < 1 ) then{ _ret=true; }else{ _ret=false; };
		};
		_ret;
	};

	ARM_bannedTimer = 0;
	ARM_fnc_betterChat = {
		_banTime = (ARM_bannedTimer-time);
		if(_banTime > 0) exitWith { systemChat format["You have been banned from this chat. %1 seconds(s) left.",floor(_banTime)]; };
		_param = (_this select 0);
		if ((typeName _param) == "STRING" && _param != "") then {
			_thisArr = toArray(_param);
			if (_thisArr select 0 == 47) exitWith { [_param] execVM "armitxes\chatcmd.sqf"; };

			if( !(34 in _thisArr) ) then {
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
			} else { systemChat "You are not allowed to use '' in global chat!";};
		};
	};

	fnc_isBusy = {
		private ["_moveBusy","_ret"];
		_ret = false;
		_moveBusy = [
			"ainvpknlmstpsnonwrfldnon_ainvpknlmstpsnonwrfldnon_medic",
			"ainvpknlmstpsnonwrfldnon_medicend",
			"amovpercmstpsnonwnondnon_ainvpknlmstpsnonwnondnon",
			"ainvpknlmstpsnonwrfldnon_medic"
		];
		if ( (animationState player) in _moveBusy ) then { _ret = true; };
		_moveBusy = nil; _ret;
	};

	fnc_timer = {
		private ["_dsp","_op","_rt","_time","_smove","_txt"];
		_time = _this select 0;
		_txt =  _this select 1;
		_smove = _this select 2;
		_emove = _this select 3;
		if (typeName _time == "SCALAR") then {
			if (!(createDialog "progressBar")) exitWith {hint "Dialog Error!"; true};
			if (!isNil "_smove") then { player playMove _smove; };
			disableSerialization;
			_dsp = findDisplay 2459;
			(_dsp displayCtrl 1) progressSetPosition 1;
			(_dsp displayCtrl 2) ctrlSetText _txt;
			_op = ( _time / 100 );
			_rt = _time;
			while { _time >= 1 } do {
				_time = _time - 1;
				sleep 1;
				_rt = _time / _op;
				(_dsp displayCtrl 1) progressSetPosition (_rt/100);
			};
			if (!isNil "_emove") then { player playMove _emove; };
			closeDialog 2459;
		} else {diag_log "ERROR: fnc_timer - param not scalar";};
		true;
	};

	fnc_prof_setDescr = {
		_display = findDisplay 1602;
		_listbox = (_display displayCtrl 1);
		_data = (call compile (_listbox lbData (_this select 1)));
		(_display displayCtrl 2) ctrlSetText (localize (_data select 1));
	};
};
