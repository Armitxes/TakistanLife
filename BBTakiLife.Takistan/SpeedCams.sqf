private ["_penalty"];

while {isciv} do
{

_car    = vehicle player;
_speed  = speed _car;
_type   = typeof _car;

{
	if ((player == driver _car) and (_car distance _x < 30) and (_speed >= 95) and !(_car iskindof "Air")) then
	{
		_infos   = _type call INV_getitemArray;
		_license = (_infos select 4) select 1;

		titleCut [" ","white in",1];

		if(_speed >= 95  and _speed < 110) then {_penalty = 1};
		if(_speed >= 110 and _speed < 120) then {_penalty = 2};
		if(_speed >= 120 and _speed < 130) then {_penalty = 3};
		if(_speed >= 130) then {_penalty = 4};
		

		player groupchat format["You have just been caught speeding! (Limit: 90, Speed: %1)", round _speed];

		sleep 2;

		if(demerits == 0)exitwith{};
		demerits = demerits - _penalty;
		if(demerits < 0)then{demerits = 0; ["addWarrant",player,"Driving Without a License",2000] execVM "warrant.sqf";};

		player groupchat format["Demerit points lost: %1. Demerit points remaining: %2", _penalty, demerits];

		(format['if(%4 == 0) then {server globalchat "%1(%2) has lost his %3 license!";if(player == %1)then{INV_LizenzOwner = INV_LizenzOwner - ["%3"];}', player, name player, _license, demerits]) call toClients;
	};
} foreach speedcamarray;

sleep 0.5;

};
