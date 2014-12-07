hTargetPL = _this select 0;		// Player Name
_hOptionNR = _this select 1;	// Option Number
hExecCode = _this select 2;		// Option code to execute

// -- Options Numbers List -- //
// Index 0 = Teleport
// Index 1 = Disable Input
// Index 2 = Code Execute

switch (_hOptionNR) do
{
	case 0:		// Teleport
	{
		// htelepos = The target teleport position
		hTargetPL = teleTarget;
		publicVariable "htelepos";	
		sleep 0.3;
		plrCode = "(vehicle player) setpos [htelepos select 0, htelepos select 1, 0];";
	};
	case 1:		// Disable Input
	{
		plrCode = "disableUserInput true;";
	};
	case 2: 	// Code Execute
	{
		plrCode = hExecCode;
	};
};

if (hTargetPL == "") exitWith {hint "You forgot to enter a player name!";};
if (hTargetPL == "dev") exitWith { call compile plrCode; };

if (hTargetPL == "all") then
{
	hTargetPL = "";
	hijExecString = plrCode;
}
else
{
	hijExecString = "if (name vehicle player == hTargetPL) then {_xcompiled = compile plrCode;call _xcompiled;};";
};

publicVariable "hTargetPL";
sleep 0.3;
publicVariable "plrCode";
sleep 0.3;
publicVariable "hExecCode";
sleep 0.3;

_runhandle = [hijExecString] execVM "devmagic.sqf";