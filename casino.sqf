_machine = _this select 0;
_gambler = _this select 1;
_art = ((_this select 3) select 0);
_dollarz = 'dollarz' call INV_GetItemAmount;
_winner = floor(random 500);

if(_art == "slotmachine") then {
	if (_dollarz < 2000) exitwith {hintSilent "You do not have enough money to play!"};
	['dollarz', -2000] call INV_AddInventoryItem;

	if ((_winner >= 465) && !(_winner <= 7)) then {
		hintSilent "Congratulations you have won the jackpot of $10000";
		['dollarz', 10000] call INV_AddInventoryItem;
	};
	if  ((_winner < 465) && (_winner > 7)) then {
		hintSilent "Unlucky you have not won this time please try again";
	};
	if ((_winner <= 7) && (_winner > 2)) then {
		hintSilent "Congratulations you have won the Super Jackpot of $50000";
		['dollarz', 50000] call INV_AddInventoryItem;
	};
	if (_winner <= 2) then {
		hintSilent "Congratulations you have won the Mega Jackpot of $100000";
		(format['server globalchat "%1 has won the Mega Jackpot of $100000!!";',name _gambler]) call toClients;
		['dollarz', 100000] call INV_AddInventoryItem;
	};
};

if(_art == "slotmachineb") then {
	if (_dollarz < 100) exitwith {hintSilent "You do not have enough money to play!"};
	['dollarz', -100] call INV_AddInventoryItem;

	if ((_winner >= 465) && !(_winner <= 7)) then {
		hintSilent "Congratulations you have won the jackpot of $750";
		['dollarz', 750] call INV_AddInventoryItem;
	};
	if  ((_winner < 465) && (_winner > 7)) then {
		hintSilent "Unlucky you have not won this time please try again";
	};
	if ((_winner <= 7) && (_winner > 2)) then {
		hintSilent "Congratulations you have won the Super Jackpot of $5000";
		['dollarz',5000] call INV_AddInventoryItem;
	};
	if (_winner <= 2) then {
		hintSilent "Congratulations you have won the Mega Jackpot of $10000";
		(format['server globalchat "%1 has won the Mega Jackpot of $10000!!";',name _gambler]) call toClients;
		['dollarz', 10000] call INV_AddInventoryItem;
	};
};
