_art = _this select 0;
_zusatzString = "";
if ((count _this)>1) then {_zusatzString = _this select 1;};

if (_art == "Einstellungen") then {if (!(createDialog "MainMenu")) exitWith {hint "Dialog Error!";};};

if (_art == "GrafikEinstellungen") then {["closedialog 0; [""Einstellungen""] execVM ""settings.sqf"";"] execVM "3442919.sqf";};

if (_art == "TextEinstellungen") then

{

if (_zusatzString == "oeffnen") then

	{

	if (!(createDialog "TextEinstellungenDialog")) exitWith {hint "Dialog Error!";};

	for [{_i=1}, {_i <= 4}, {_i=_i+1}] do

		{

		call compile format["ctrlSetText[%1, RadioTextMsg_%1];", _i];
		call compile format["_index = lbAdd [1%1, 'Global'];lbSetData [1%1, _index, 'global'];if(RadioTextArt_%1 == 'global')then{lbSetCurSel [1%1, 0]};", _i];
		call compile format["_index = lbAdd [1%1, 'Side'  ];lbSetData [1%1, _index, 'side'  ];if(RadioTextArt_%1 == 'side'  )then{lbSetCurSel [1%1, 1]};", _i];
		call compile format["_index = lbAdd [1%1, 'Direct'];lbSetData [1%1, _index, 'direct'];if(RadioTextArt_%1 == 'direct')then{lbSetCurSel [1%1, 2]};", _i];

		};

	};

if ( (_zusatzString == "speichern") and (ctrlVisible 1034) ) then

	{

	for [{_i=1}, {_i <= 4}, {_i=_i+1}] do

		{

		call compile format["RadioTextMsg_%1 = (ctrlText %1);", _i];
		call compile format["RadioTextArt_%1 = lbText[1%1, (lbCurSel 1%1)];", _i];

		};

	hintSilent "Saved!";

	};

};

if (_art == "Tutorial") then {
	if (!(createDialog "InfoDialog")) exitWith {hint "Dialog Error!";};
	ctrlSetText[2, " Tutorial "];
	ctrlSetText[1, " Comming soon "];
};

if (_art == "FAQ") then {
	if (!(createDialog "InfoDialog")) exitWith {hint "Dialog Error!";};
	ctrlSetText[2, " FAQ "];
	ctrlSetText[1, "\nIf you need any help please ask via chat or get on teamspeak."];
};

if (_art == "About") then {
	if (!(createDialog "InfoDialog")) exitWith {hint "Dialog Error!";};
	ctrlSetText[2, " About "];
	ctrlSetText[1, "\nTakistan Life RoS\n\n- DEVELOPERS -\nA big thanks to our developers who made this mission and keep it up2date.\n\n- Tonic\n- Armitxes\n"];
};