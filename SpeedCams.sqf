private ["_penalty"];

while {isciv} do
{
  if (!ismedic) then {
    _car    = vehicle player;
    _speed  = speed _car;
    _type   = typeof _car;

    {
	    if ((player == driver _car) and (_car distance _x < 30) and (_speed >= 95) and !(_car iskindof "Air")) then {
		  _infos   = _type call INV_getitemArray;
		  _license = (_infos select 4) select 1;

		  titleCut [" ","white in",1];

		  if(_speed >= 95  and _speed < 110) then {_penalty = 1};
		  if(_speed >= 110 and _speed < 120) then {_penalty = 2};
		  if(_speed >= 120 and _speed < 130) then {_penalty = 3};
		  if(_speed >= 130) then {_penalty = 4};


		  hintSilent format["You have just been caught speeding! (Limit: 90, Speed: %1)", round _speed];

		  sleep 2;

		  if (_car isKindOf "truck") then {
		      if(truckDemerits == 0 || !("truck" call INV_HasLicense)) exitWith {};
		      truckDemerits = truckDemerits - _penalty;
		      if(truckDemerits <= 0) then {
			  truckDemerits = 0;
			  ["addWarrant",player,"Driving Without a License",250] execVM "warrant.sqf";
			  INV_LizenzOwner = INV_LizenzOwner - ["truck"];
		      };
		      hintSilent format["Truck Demerit points lost: %1. Truck Demerit points remaining: %2", _penalty, truckDemerits];
		  } else {
		      if(demerits == 0 || !("car" call INV_HasLicense)) exitWith {};
		      demerits = demerits - _penalty;
		      if(demerits <= 0) then {
			  demerits = 0;
			  ["addWarrant",player,"Driving Without a License",200] execVM "warrant.sqf";
			  INV_LizenzOwner = INV_LizenzOwner - ["car"];
		      };
		      hintSilent format["Demerit points lost: %1. Demerit points remaining: %2", _penalty, demerits];
		  };
	    };
    } foreach speedcamarray;
  };
  sleep 0.5;
};
