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
	default { };
};
