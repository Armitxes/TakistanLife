while {true} do {
	_vcl = vehicle player;
	if("bomb" call INV_HasLicense)then{isterror=true;};
	_nextflag = getPos player nearestObject "FlagCarrierUNO_EP1";
	switch(typeOf _nextflag) do {
		case "FlagCarrierUNO_EP1": { 
			titleText ["This area is under full jurisdiction of the United Nations!","plain down"];
			if (isun) then { paybonus = paybonus + 20; };
		};
		case "FlagCarrierBLUFOR_EP1": { titleText ["This area is under full jurisdiction of the Police!","plain down"]; };
	};
	if((driver _vcl) == player && (afk+900) < time) exitWith {endMission "loser";};
	sleep 5;
};