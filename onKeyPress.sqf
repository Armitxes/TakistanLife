private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

afk = time;

if(isstunned || (([player] call plr_isUnConscious) && _key != 50)) exitWith
{
	if(_key == 50)then{_handled = true};
	if(_key == 11)then{_handled = true};
	_handled
};

switch _key do
{
	// Enter key
	case 28:
	{
    if(!dialog) then {
      createDialog "chat";
    } else {
      _text = ctrlText 1404;
      if(!isNil("_text")) then {
        [_text] call ARM_fnc_betterChat;
      };
      closeDialog 0;
    };
    _handled=true;
  };
	//y key
	case 21:
	{
  	if(dialog)exitwith{closeDialog 0;};
  	if(!INV_shortcuts)exitwith{};
  	_handled=true;
  	[] execVM "animdlgopen.sqf";
  };
  // u key
	case 22: {
	if(dialog || isNil("playerPet") || isNil("petOwner") )exitwith{};
		if(player == playerPet) exitWith {
			if(alive petOwner) then { selectPlayer petOwner; };
		};
		if(player == petOwner) exitWith {
			if(alive playerPet) then { selectPlayer playerPet; };
		};
	};
	//TAB key
	case 15:
	{
    	if(INV_shortcuts)then{
			INV_shortcuts=false; titletext["TKL keys off", "PLAIN DOWN"];[] execVM "actionsRemove.sqs";
		}else{
			INV_shortcuts=true; titletext["TKL keys on", "PLAIN DOWN"];[] execVM "actions.sqf";
			{ player reveal _x; } forEach (nearestObjects [player,["Man","AllVehicles","Infostand_1_EP1","Infostand_2_EP1","Notebook"],10]);
		};
	};

    //L key
  	case 38:
  	{
    	if(!INV_shortcuts)exitWith{};
      if(!keyblock) then {
      	_vcls = nearestobjects [getpos player, ["LandVehicle", "Air", "ship"], 25];
      	_vcl = _vcls select 0;
        _owner = _vcl getVariable "owner";
        if((_owner select 1 == getPlayerUID player) && !(_vcl in INV_VehicleArray)) then { INV_VehicleArray = INV_VehicleArray + [_vcl]; }
        else {
        	if(!(_vcl in INV_VehicleArray)) exitWith { hintSilent "You do not have the keys to this vehicle."; _handled=true; };
        	["schluessel", _vcl, 0] execVM "keys.sqf";
        };
      	_handled=true;
      };
  	};

  	//T key
  	case 20:
  	{
    	if(!INV_shortcuts)exitWith{};

    	if(dialog)exitWith{closeDialog 0;};

    	_vcls = nearestobjects [getpos player, ["LandVehicle", "Air", "ship", "TKOrdnanceBox_EP1"], 25];
    	_vcl = _vcls select 0;

    	if(!(_vcl in INV_VehicleArray) and typeof _vcl == "TKOrdnanceBox_EP1")exitWith{hintSilent "You do not have the keys to this hideout.";};
    	if(!(_vcl in INV_VehicleArray))exitWith{hintSilent "You do not have the keys to this vehicle.";};
    	if(!isNull _vcl)then{call compile format['[0,0,0,["%3", "public", ["vcl", "%2", %1]]] execVM "storage.sqf";', _vcl, (typeOf _vcl), format["%1_storage", _vcl]];};
  	};

	//E key
	case 18: {
		if(!INV_shortcuts)exitWith{};
		if(keyblock)exitWith{};
		if(dialog)exitWith{closeDialog 0;};
		private ["_civ"];

		if (vehicle player == player) then {
			for [{_i=1}, {_i < 3}, {_i=_i+1}] do {
				_range = _i;
				_dirV = vectorDir vehicle player;
				_pos = player modelToWorld [0,0,0];
				_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
				_men    = nearestObjects [_posFind,["Man", "Infostand_1_EP1", "Infostand_2_EP1", "RUBasicAmmunitionBox", "UNBasicAmmunitionBox_EP1"], 1] - [player];
				_atms = nearestObjects [_posFind,["Infostand_1_EP1","Misc_cargo_cont_tiny"],2];
				_civ = _men select 0;
				_atm = _atms select 0;

				if(iscop && !(isNull _civ) && _civ in playerarray) exitWith {
					_i = 4;
					call compile format['[0,0,0, ["civmenu", "%1", %1]] execVM "interact.sqf";', _civ];
					_handled=true;
				};

				if(isun && !(isNull _civ) && _civ in playerarray) exitWith {
					_i = 4;
					call compile format['[0,0,0, ["uninteraktion", "%1", %1]] execVM "interact.sqf";', _civ];
					_handled=true;
				};

				if(isciv && !(isNull _civ) && _civ in playerarray) exitWith {
					_i = 4;
					call compile format['[0,0,0, ["civinteraktion", "%1", %1]] execVM "interact.sqf";', _civ];
					_handled=true;
				};

				if(!(isnull _civ) && _civ in shopusearray) exitWith {
					_i = 4;
					if((iscop || isun) and _civ in drugsellarray)exitWith{_civ execVM "drugsearch.sqf"};
					_id = _civ call INV_getshopnum;
					[0,0,0,[_id]] execVM "shopdialogs.sqf";
					_handled=true;
				};

				if(!(isNull _atm) and _atm in bankflagarray) exitWith {
					_i = 4;
					if (time_bank_lockout > time) exitWith { hint "The ATM rejected your card"; };
					[] execVM "atm.sqf";
					_handled=true;
				};

			};
		};
		if(_handled)exitWith{};

		if(vehicle player == player) then {
			private ["_vcl"];
			for [{_i=1}, {_i < 3}, {_i=_i+1}] do {
				_range = _i;
				_dirV = vectorDir vehicle player;
				_pos = player modelToWorld [0,0,0];
				_posFind = [(_pos select 0)+(_dirV select 0)*_range,(_pos select 1)+(_dirV select 1)*_range,(_pos select 2)+(_dirV select 2)*_range];
				_vcls    = nearestobjects [_posFind,["LandVehicle", "Air", "ship"], 2];
				_vcl     = _vcls select 0;
				if(!(isnull _vcl))exitwith{_i = 4};
			};

			if(locked _vcl)exitWith{ hintSilent "The vehicle is locked."; };

			if(player isKindOf "Animal" && !(isnull _vcl)) then {
				if (!attached) then {
					attached = true;
					player attachTo [_vcl,[0,0,-1]];
				} else {
					if(speed _vcl < 20) then {
						attached = false;
						detach player;
						_apos = getPos player;
						player setPos [(_apos select 0)+4, (_apos select 1)+4, 0];
					} else { hintSilent "The vehicle is moving too fast"; };
				};
			} else {
				if (_vcl isKindOf "StaticWeapon") then { player moveInGunner _vcl; } else {
					if(_vcl emptyPositions "Driver" > 0) exitWith {player action ["getInDriver", _vcl]};
					if(_vcl emptyPositions "Gunner" > 0) exitWith {player action ["getInGunner", _vcl]};
					if(_vcl emptyPositions "Commander" > 0) exitWith {player action ["getInCommander", _vcl]};
					if(_vcl emptyPositions "Cargo" > 0) exitWith {player action ["getInDriver", _vcl]; _vcl spawn {keyblock=true;sleep 0.5;player moveincargo _this; keyblock=false;};};
				};
			};
		} else {
			_vcl  = vehicle player;
			if(locked _vcl)exitWith{hintSilent "The vehicle is locked."};
			if(speed _vcl > 30)exitWith{hintSilent "The vehicle is moving too fast"};
			player action ["getOut", _vcl];
		};
	};

	//R key
	case 19: {
	if(!INV_shortcuts)exitWith{};
		if(_shift && (vehicle player == player) && (count (magazines player) < 12)) then
		{
			player addMagazine "HandGrenade_Stone";
			titleText ["I picked up a stone!", "PLAIN DOWN", 0.5];
		};
	};

	//F key
	case 33: {
		if (_shift and (vehicle player != player)) then { ["switch"] execVM "armitxes\events\onSiren.sqf"; };
		if(!INV_shortcuts)exitwith{};

		if(_shift and (vehicle player == player) and call INV_isArmed) then {
			if(keyblock)exitwith{};
			_men = nearestobjects [getpos player, ["Man"], 2] - [player];
			_men spawn {
				(format ["%1 switchmove ""%2"";", player, "AwopPercMstpSgthWnonDnon_end"]) call toClients;
				sleep 0.2;
				if(count _this > 0) then {
					_civ = _this select 0;
					if((_civ distance player) > 2 || (!isPlayer _civ) || ([_civ] call plr_isUnConscious))exitWith{};
					(format ["if (player == %1) then {[""hit"", %2, ""Melee"", 1] execVM ""stun.sqf""};", _civ, player]) call toClients;
					hintSilent "You stunned this player!";
					keyblock=true; [] spawn {sleep 2; keyblock=false;};
				};
			};
			_handled=true;
		};
	};

	//tilde key
	case 41: {
		if(!INV_shortcuts)exitWith{};
		if(dialog)exitwith{closeDialog 0;_handled=true;};
		if(iscop || isun) then {
			if(vehicle player == player)then{ if(iscop) then { [0,0,0,["copmenulite"]] execVM "maindialogs.sqf"; }; }
			else {[0,0,0,["copmenu"]] execVM "maindialogs.sqf";};
			_handled=true;
		};
	};

	//1 key
	case 2: {
	    if(!INV_shortcuts)exitwith{};
	    _handled=true;
	    if(dialog)exitWith{closeDialog 0;};
	    call fnc_ClearWarrantsArray;
	    if (_shift) then { [0,0,0,["generalstats"]] execVM "maindialogs.sqf"; } else { [0,0,0,["spielerliste"]] execVM "maindialogs.sqf"; };
	};

	//2 key
	case 3: {
		if(!INV_shortcuts)exitwith{};
		_handled=true;
		if(dialog)exitwith{closeDialog 0;};
		execVM "inventory.sqf";
	};

	//3 key
	case 4: {
		if(!INV_shortcuts)exitwith{};
		if(keyblock or vehicle player != player)exitwith{};
		keyblock=true; [] spawn {sleep 2; keyblock=false;};
		player playmove "amovpercmstpssurwnondnon";
		_handled=true;
	};

	//4 key
	case 5: { [0,0,0,["constitution"]] execVM "maindialogs.sqf"; };

	//5 key
	case 6: {
		if (isciv) then {
			if(!INV_shortcuts)exitWith{};
			_handled=true;
			if(dialog)exitWith{closeDialog 0;};
			[0,0,0,["gangmenu"]] execVM "maindialogs.sqf";
		};
	};

   //6 key
	case 7: {
		if (!isciv) then {
			if(!INV_shortcuts)exitwith{};
			_handled=true;
			if(dialog)exitwith{closeDialog 0;};
			[0,0,0,["coplog"]] execVM "maindialogs.sqf";
		};
	};
	// M key
	case 50: {
		_handled=true;
		if(!INV_shortcuts || isciv)exitwith{};
		_array = coptypes;
		_playerType = typeOf player;
		if(isun) then {_array = untypes;};
		{
			_markerName = format ["marker_%1",_x];
			if (getMarkerColor _markerName != "") then {deleteMarkerLocal _markerName;};
			if((typeOf _x) in _array) then {
				_markerlocation = position _x;
				_markerobj = createMarkerLocal [_markerName,_markerlocation];
				_markerobj setMarkerShapeLocal "Icon";
				_markerName setMarkerTypeLocal "dot";
				_markerName setMarkerColorLocal "coloryellow";
			};
		} forEach playableUnits;
	};
	// Space
	case 57: {
		if(!INV_shortcuts)exitwith{};
		_handled=true;
		if(player isKindOf "Animal") then {
			_targets = (nearestObjects [player,["Man"],5])-[player];
			if(count(_targets) > 0 && lastBite+3 < time) then {
				lastBite = time;
				_target = _targets select 0;
				if ((player distance _target) < 3) then {
					if((damage _target) == 0) then {
						_target setHit ["hands",1];
						_target setDamage 0.2;
					} else {
						if (canStand _target) then { _target setHit ["legs",1]; } else {
							if(!(alive _target)) exitWith {};
							_toDeath = ["civillying01","adthpercmstpslowwrfldnon_4","adthppnemstpsraswpstdnon_2"];
							if ( (!dragging && (animationState _target in _toDeath)) || !isPlayer _target ) then {
								_target setDamage 1;
								(format["server globalchat ""%1 bit %2 to death."";", name player, name _target]) call toClients;
							} else {
								(format ["if (player == %1) then {[""hit"", %2, ""Melee"", 1] execVM ""stun.sqf""};", _target, petOwner]) call toClients;
							};
						};
					};
				};
			};
		} else {
			if((iscop) and (vehicle player != player)) exitwith { player commandChat format ["Speedcam: %1 km/h", speed cursorTarget]; };
			if((iscop || isun) and (vehicle player == player)) exitwith {
				_targ = (cursorTarget);
				if(_targ != vehicle _targ) then {hint "No target selected.";} else {
					if (_targ iskindof "man") then {
						for [{_i=0}, {_i <= (count warrantarray)}, {_i=_i+1}] do {
							_singleWarrant = warrantarray select _i;
							_pIdCiv  = _singleWarrant select 0;
							_pReason = _singleWarrant select 1;
							_pBounty = _singleWarrant select 2;

							if(_targ == _pIdCiv) exitWith {
								hintSilent format ["%1(%4) (Bounty: %3) (Reason: %2)", _pIdCiv, _pReason, _pBounty, name _pIdCiv];
							};
						};
					} else {hint "No player selected."};
				};
			};
		};
	};
};

_handled;
