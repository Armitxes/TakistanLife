waitUntil {!isnull player && player == player}; sleep 15;

fnc_hckhint = {
  private ["_code"];
  _code = _this select 0;
  hint parseText format["<t size='1.25' font='Zeppelin33' color='#ff0000'>- Armitxes Network -</t><t size='1.1' font='Zeppelin33' color='#ff0000'><br />AntiCheat Warning</t><br /><br />%1", _code];
  systemChat format["Armitxes Network ~ AntiCheat: %1 - [saved in logs]", _code];
  diag_log format["%1", _code];
};
"anticheat" addPublicVariableEventHandler {[_this select 1] call fnc_hckhint;};

// Set sus functions
bank_transaction = { anticheat = format["Attempted money cheat by %1 (%2)", name player, getPlayerUID player]; publicVariable "anticheat"; };
transaction_bank = bank_transaction;

// Check for sus vars
[] spawn {
	while {true} do {
		if(
			!isNil {DayNightV4} ||
			!isNil {whippyhtmlzV4} ||
			!isNil {htmlzV4} ||
			!isNil {DZE_StaticConstructionCount} ||
			!isNil {l33thtmlv1} ||
			!isNil {MainScripts} ||
			!isNil {junbut} ||
			!isNil {Lando_Godmode} ||
			!isNil {B1g_B3nProEsp} ||
			!isNil {scroll_m_init_star} ||
			!isNil {exstr1} ||
			!isNil {pathtoscrdir3} ||
			!isNil {Monky_funcs_inited} ||
			!isNil {Monky_initMenu} ||
			!isNil {player_zombieCheck} ||
			!isNil {godlol} ||
			!isNil {playericons} ||
			!isNil {abcdefGEH} ||
			!isNil {wierdo} ||
			!isNil {go_invisible_infiSTAR} ||
			!isNil {serverObjectMonitor} ||
			!isNil {enamearr} ||
			!isNil {initarr3} ||
			!isNil {locdb} ||
			!isNil {sCode} ||
			!isNil {infAmmoIndex} ||
			!isNil {nukeDONEstar} ||
			!isNil {J_ro} ||
			!isNil {Dwarden} ||
			!isNil {noblbsivnib} ||
			!isNil {executec0de}
		) exitWith {
			anticheat = format["%1 is using cheats. PUID: %2", name player, getPlayerUID player];
			publicVariable "anticheat";
		};

		if ((unitRecoilCoefficient player) != 1) exitWith {
			anticheat = format["%1 is cheating (no recoil). PUID: %2", name player, getPlayerUID player];
			publicVariable "anticheat";
		};
		sleep 20;
	};
};
