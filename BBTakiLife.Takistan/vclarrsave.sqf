_arrStr1 = "";
_arrStr2 = "";

while {true} do

{

for [{_i=0}, {_i < (count INV_PLAYERSTRINGLIST)}, {_i=_i+1}] do {INV_PLAYERLIST SET [_i, call compile (INV_PLAYERSTRINGLIST select _i)]};

for [{_i=0}, {_i < (count INV_VehicleArray)}, {_i=_i+1}]do{if (isNull (INV_VehicleArray select _i))then{INV_VehicleArray set [_i, ""];INV_VehicleArray = INV_VehicleArray - [""];};};

if (INV_SaveVclArray) then

	{

	if (  (_arrStr2 != format["%1", INV_VehicleArray]) and ((count INV_VehicleArray) > 0)  ) then

		{

		_arrStr2 = format["%1", INV_VehicleArray];

		};

	};

for [{_i=0}, {_i < (count INV_ServerVclArray)}, {_i=_i+1}]do{if(isNull (INV_ServerVclArray select _i))then{INV_ServerVclArray set [_i, ""];INV_ServerVclArray = INV_ServerVclArray - [""];};};

if(isServer and INV_JIP)then{_arrStr1 = format["%1", INV_ServerVclArray];publicVariable "INV_ServerVclArray";};

if (INV_JIP) then {INV_JIP = false;};

sleep 5;

};