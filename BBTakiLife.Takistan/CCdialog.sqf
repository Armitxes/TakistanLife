_art = _this select 0;
if !(ischief) exitwith {hintSilent "You are not the Chief Constable"};
	if (_art == "CCdialog") then {
	if (!(createDialog "CCdialog")) exitWith {hint "Dialog Error!";};
	[2, 1, true, false] call DialogSpielerListe;
	lbSetCurSel [1, 0];
	[5] call GangList;
	lbSetCurSel [5, 0];
	
	    _list = lbAdd [4, "Please select a reason"];
	    _list = lbAdd [4, "Tyres to be shot out"];
	    _list = lbAdd [4, "Air vehicle to be disabled"];
	    _list = lbAdd [4, "Raid Gang Area 1"];
		_list = lbAdd [4, "Raid Gang Area 2"];
		_list = lbAdd [4, "Raid Gang Area 3"];
		
		lbSetCurSel [4, 0];
		while {ctrlVisible 1006} do
	{
		sleep 0.3;
	};
   };
	
	if ((_art == "MarLDialog") && !(mlaw)) then {
	if (!(createDialog "MarLDialog")) exitWith {hint "Dialog Error!";};
	
		_list = lbAdd [1,"Please select a reason"];
		_list = lbAdd [1,"High Crime Rate"];
		_list = lbAdd [1,"High Threat of Terrorism"];
		_list = lbAdd [1,"War"];
	
		lbSetCurSel [1, 0];
	while {ctrlVisible 1106} do
	{
		sleep 0.3
	};
   }; 
   
   if ((_art == "MarLDialog") && (mlaw)) then {
   if (!(createDialog "ja_nein")) exitWith {hint "Dialog Error!"};
	ctrlSetText [1,"Are you sure that you want to revoke Martial Law?"];
	waitUntil{(not(ctrlVisible 1023))};
	if (Antwort == 1) then {
	format ["server globalChat ""Martial Law has been withdrawn"";mlaw = false"] call toClients;};
	
	Antwort = 2;
	};
