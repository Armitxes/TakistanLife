_machine = _this select 0;
_gambler = _this select 1;
_art = ((_this select 3) select 0);
_dollarz = 'dollarz' call INV_GetItemAmount;
_winner = floor(random 500);

if(_art == "slotmachine") then
{
if (_dollarz < 2000) exitwith {player groupchat "You do not have enough money to play!"};
if ((_winner >= 465) && !(_winner <= 7)) then {
    ['dollarz', -2000] call INV_AddInventoryItem;
	player groupchat "Congratulations you have won the jackpot of $5000";
	['dollarz', 5000] call INV_AddInventoryItem;
	isbet = true;
	sleep 2;
	isbet = false;
	};
if  ((_winner < 465) && (_winner > 7)) then {
	['dollarz', -2000] call INV_AddInventoryItem;
	player groupchat "Unlucky you have not won this time please try again";
	isbet = true;
	sleep 2;
	isbet = false;
	};
if ((_winner <= 7) && (_winner > 2)) then {
	['dollarz', -2000] call INV_AddInventoryItem;
	player groupchat "Congratulations you have won the Super Jackpot of $25000";
	['dollarz', 25000] call INV_AddInventoryItem;
	isbet = true;
	sleep 2;
	isbet = false;
	};
if (_winner <= 2) then {
	['dollarz', -2000] call INV_AddInventoryItem;
	player groupchat "Congratulations you have won the Mega Jackpot of $60000";
	(format['server globalchat "%1 has won the Mega Jackpot of $60000!!";',name _gambler]) call toClients;
	['dollarz', 60000] call INV_AddInventoryItem;
	isbet = true;
	sleep 2;
	isbet = false;
  };
};
if(_art == "slotmachineb") then
{
if (_dollarz < 100) exitwith {player groupchat "You do not have enough money to play!"};
if ((_winner >= 465) && !(_winner <= 7)) then {
    ['dollarz', -100] call INV_AddInventoryItem;
	player groupchat "Congratulations you have won the jackpot of $500";
	['dollarz', 500] call INV_AddInventoryItem;
	isbet = true;
	sleep 2;
	isbet = false;
	};
if  ((_winner < 465) && (_winner > 7)) then {
	['dollarz', -100] call INV_AddInventoryItem;
	player groupchat "Unlucky you have not won this time please try again";
	isbet = true;
	sleep 2;
	isbet = false;
	};
if ((_winner <= 7) && (_winner > 2)) then {
	['dollarz', -100] call INV_AddInventoryItem;
	player groupchat "Congratulations you have won the Super Jackpot of $2500";
	['dollarz',2500] call INV_AddInventoryItem;
	isbet = true;
	sleep 2;
	isbet = false;
	};
if (_winner <= 2) then {
	['dollarz', -100] call INV_AddInventoryItem;
	player groupchat "Congratulations you have won the Mega Jackpot of $5000";
	(format['server globalchat "%1 has won the Mega Jackpot of $5000!!";',name _gambler]) call toClients;
	['dollarz', 5000] call INV_AddInventoryItem;
	isbet = true;
	sleep 2;
	isbet = false;
  };
};

	



