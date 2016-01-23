_victim 		= _this select 0;
_killedbyvehicle 	= _this select 1;
_license 		= _this select 2;

if (player == _victim and (iscop || isun)) exitWith {};

if (_victim in civarray) then
{
  CivsKilled = CivsKilled + 1;
  _gesucht = 0;
  
	extradeadtime = extradeadtime + killedplayerinc;
  
  sleep 1;
};

if ((_victim in coptypes) || (_victim in untypes)) then
{
  CopsKilled = CopsKilled + 1;

  if (iscop || isun) then
	{
  	extradeadtime = extradeadtime + killedplayerinc;
  	hintSilent format [localize "STRS_handlerdeadpub_copkilledbycop", _victim];
	}
	else
	{

	extradeadtime = extradeadtime + killedplayerinc;
	hintSilent format [localize "STRS_handlerdeadpub_copkilled", _victim];

	};

sleep 1;
};