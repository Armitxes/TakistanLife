_scrollParams = _this select 3;
_action = _scrollParams select 0;

switch (_action) do {
	case "freedom": {
		player setDamage 0;
		dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;

		if (bountyToPay > 0) then {
			hintSilent "Request denied";
		} else {
			player setPos getMarkerPos "jail_freemarker";
			hintSilent "You have been released.";
		};
	};
	case "riot": {
		if (riot_end_time+3600 > time) exitWith {hintSilent "There already has been a recent jailbreak.";};
		if (bountyToPay < 45000) exitWith { hintSilent "Your remaining jailtime is too low for the risk."; };
		_other_players = nearestObjects [player, ["Man"], 50];
		if(count _other_players < 3) exitWith { hintSilent "Not enough prisoners."; };

		('server globalchat "Prisoners have started a riot!";') call toClients;
		hintSilent "The security system will fail in about 7 minutes.";
		riot_end_time = time+420; publicVariable "riot_end_time";
		sleep 416;
		if (!(alive player) || ((animationState player) in animRestrained)) exitWith { (format['server globalchat "Riot leader %1 has been caught.";', name player]) call toClients; };
		hintSilent "Got access! Only must access the laptop over the windows and then I'm free!";
		prisondoor setVariable ["hacked",time,true];
		prisonDoor2 setVariable ["hacked",time,true];
	};
	default { };
};
