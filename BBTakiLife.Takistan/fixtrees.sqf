_art = _this select 0;
_range = 10;

if (_art == "use") then
{
	if (vehicle player == player) then
	{
		player groupChat "Attempting fix...";
		player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
		{
			if ((typeOf _x == "") && (damage _x > 0)) then
			{
				_x setdamage 0;
			};
		} forEach (nearestObjects [player,[], _range]);
		player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
	} else
	{
		player groupChat "You must be on foot.";
	};
};
