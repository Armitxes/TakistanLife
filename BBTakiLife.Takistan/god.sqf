
cursel = 14098;
ctrltxt = ctrlText(14098);
 if (ctrltxt == "God") then { 
	ctrlSetText[cursel, "Turn God Off"];
	player commandChat "God is on.";
	(vehicle player) removeAllEventHandlers "handleDamage";
	(vehicle player) addEventHandler ["handleDamage", { false }];
	(vehicle player) addEventHandler ["hit", {player setdammage 0}];
	(vehicle player) addEventHandler ["dammaged", {player setdammage 0}];
	(vehicle player) allowDamage false;
} else {
	ctrlSetText[cursel, "God"];
	player commandChat "God is off.";
	(vehicle player) removeAllEventHandlers "handleDamage";
	(vehicle player) removeAllEventHandlers "hit";
	(vehicle player) removeAllEventHandlers "dammaged";
	(vehicle player) allowDamage true;
	(vehicle player) addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun.sqf";}];
	(vehicle player) addEventHandler ["handleDamage", {_this call compile preprocessfile "armitxes\setHit.sqf"}];
};
