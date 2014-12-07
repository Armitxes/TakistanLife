_selection = ((_this select 3) select 0);

if (_selection == "station 1") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};
["addWarrant",player,"GS robbery",3000] execVM "warrant.sqf";
['dollarz', station1money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station1money];
station1money = 0;
publicvariable "station1money";
};

if (_selection == "station 2") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};
["addWarrant",player,"GS robbery",3000] execVM "warrant.sqf";
['dollarz', station2money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station2money];
station2money = 0;
publicvariable "station2money";
};

if (_selection == "station 3") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

["addWarrant",player,"GS robbery",3000] execVM "warrant.sqf";
['dollarz', station3money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station3money];
station3money = 0;
publicvariable "station3money";
};

if (_selection == "station 4") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

["addWarrant",player,"GS robbery",3000] execVM "warrant.sqf";
['dollarz', station4money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station4money];
station4money = 0;
publicvariable "station4money";
};

if (_selection == "station 5") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

["addWarrant",player,"GS robbery",3000] execVM "warrant.sqf";
['dollarz', station5money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station5money];
station5money = 0;
publicvariable "station5money";
};

if (_selection == "station 6") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

["addWarrant",player,"GS robbery",3000] execVM "warrant.sqf";
['dollarz', station6money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station6money];
station6money = 0;
publicvariable "station6money";
};

if (_selection == "station 7") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

["addWarrant",player,"GS robbery",3000] execVM "warrant.sqf";
['dollarz', station7money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station7money];
station7money = 0;
publicvariable "station7money";
};

if (_selection == "supermarket") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the supermarket!";
	};

["addWarrant",player,"Supermarket robbery",3000] execVM "warrant.sqf";
['dollarz', station8money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed the supermarket!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the supermarket!", station8money];
station8money = 0;
publicvariable "station8money";
};

if (_selection == "station 8") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

["addWarrant",player,"GS robbery",3000] execVM "warrant.sqf";
['dollarz', station9money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station9money];
station9money = 0;
publicvariable "station9money";
};

if (_selection == "station 9") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

["addWarrant",player,"GSrobbery",3000] execVM "warrant.sqf";
['dollarz', station10money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call toClients;
player sidechat format ["You stole $%1 from the gas station!", station10money];
station10money = 0;
publicvariable "station10money";
};