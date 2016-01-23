_civnumber      = _this select 0;
_deletekopfgeld = _this select 2;
_civnumber      = _civnumber+1;
_civ            = format["civ%1", _civnumber];
_civvar		      = call compile format["%1", _civ];

disableSerialization;
_display = findDisplay 1603;
_listbox = (_display displayCtrl 4);
_reasonID = (lbCurSel _listbox);

_lbReason = _listbox lbText _reasonID;
_txtReason = ctrlText (_display displayCtrl 2);
_lbBounty = call compile (_listbox lbData _reasonID);
closeDialog 0;

if (!(_civ call ISSE_UnitExists)) exitWith {role groupChat localize "STRS_player_not_ingame";};

if (_deletekopfgeld == 1) exitWith {
	["deleteWarrant",_civvar, "", 0] execVM "warrant.sqf";    
	hintSilent format [localize "STRS_kopfgeld_entfernt", _civ];
};
if (_reasonID == 0) then {
	if (_txtReason == "Crime not in List? Log crime here!" || count (toArray _txtReason) < 3) exitWith {hintSilent "You must enter a description of the crime!"};
	if ((!(alive _civvar)) or (_civarrestedvar == 1)) exitWith {role groupChat format [localize "STRS_kopfgeld_nokopfgeld", _civ];};
	format ["server globalchat ""%2 is wanted for %3 by %1"";", name player, name _civvar, _txtReason] call toClients;
	["addWarrant",_civvar,_txtReason,_lbBounty] execVM "warrant.sqf";
} else {
	if (_lbReason != "") then {
		format ["server globalchat ""%2 is wanted for %3 by %1"";", name player, name _civvar, _lbReason] call toClients;
		["addWarrant",_civvar,_lbReason,_lbBounty] execVM "warrant.sqf";
	};	
};