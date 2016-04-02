private "_num";

if(_this select 4 == "add")then{_num = call compile format["%1", _this select 1]}else{_num = call compile format["-%1", _this select 1]};

format["
if(player == %3) then
	{
		[""%1"",%2] call INV_addinventoryitem;
		[""stealmoney"", ""%4""] execVM ""civmenu.sqf"";
	};
	if(player == %4)then{[""%1"",-(%2)] call INV_addinventoryitem};
", _this select 0, _num, _this select 2, _this select 3] call broadcast;
