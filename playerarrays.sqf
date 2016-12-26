waitUntil {((alive player) or (local server))};

/* Legal Advise!
Script made by Armitxes (Jan Brodersen)
Do not delete this note! */

_playerType = typeOf player;
coptypes = ["Policeman","Soldier_Crew_PMC","BAF_crewman_MTP","BAF_Soldier_L_MTP","TK_Commander_EP1","BAF_Soldier_Marksman_MTP","BAF_Pilot_MTP"];
untypes = ["UN_CDF_Soldier_Officer_EP1","UN_CDF_Soldier_Light_EP1","UN_CDF_Soldier_EP1"];

playerstringarray = ["Civ1","Civ2","Civ3","Civ4","Civ5","Civ6","Civ7","Civ8","Civ9","Civ10","Civ11","Civ12","Civ13","Civ14","Civ15","Civ16","Civ17","Civ18","Civ19","Civ20","Civ21","Civ22","Civ23","Civ24","Civ25","Civ26","Civ27","Civ28","Civ29","Civ30","Civ31","Civ32","Civ33","Civ34","Civ35","Civ36","Civ37","Civ38","Civ39","Civ40","Civ41","Civ42","Civ43","Civ44","Civ45","UN1","UN2","UN3","UN4","UN5","UN6","UN7","UN8","UN9","UN10","Cop1","Cop2","Cop3","Cop4","Cop5","Cop6","Cop7","Cop8","Cop9","Cop10","Cop11","Cop12","Cop13","Cop14","Cop15","Cop16","Cop17","Cop18","Cop19","Cop20","Cop21","Cop22"];

for [{_i=0}, {_i < (count playerstringarray)}, {_i=_i+1}] do {if (isNil (playerstringarray select _i)) then { call compile format["%1 = objNull;", (playerstringarray select _i)]; }; };
playerarray       = [civ1,civ2,civ3,civ4,civ5,civ6,civ7,civ8,civ9,civ10,civ11,civ12,civ13,civ14,civ15,civ16,civ17,civ18,civ19,civ20,civ21,civ22,civ23,civ24,civ25,civ26,civ27,civ28,civ29,civ30,civ31,civ32,civ33,civ34,civ35,civ36,civ37,civ38,civ39,civ40,civ41,civ42,civ43,civ44,civ45,UN1,UN2,UN3,UN4,UN5,UN6,UN7,UN8,UN9,UN10,cop1,cop2,cop3,cop4,cop5,cop6,cop7,cop8,cop9,cop10,cop11,cop12,cop13,cop14,cop15,cop16,cop17,cop18,cop19,cop20,cop21,cop22];
civarray          = [civ1,civ2,civ3,civ4,civ5,civ6,civ7,civ8,civ9,civ10,civ11,civ12,civ13,civ14,civ15,civ16,civ17,civ18,civ19,civ20,civ21,civ22,civ23,civ24,civ25,civ26,civ27,civ28,civ29,civ30,civ31,civ32,civ33,civ34,civ35,civ36,civ37,civ38,civ39,civ40,civ41,civ42,civ43,civ44,civ45];

rolenumber = 0;

for [{_i=0}, {_i < (count playerarray)}, {_i=_i+1}] do
{ call compile format["if ((playerarray select %1) == player) then {rolenumber = (%1 + 1);}", _i]; };
role = player;

if(_playerType in coptypes) then
{
  iscop          = true;
  isun           = false;
  isciv          = false;
  sidenumber      = rolenumber - civscount;
  longrolenumber  = 1100 + sidenumber;
};


if (_playerType in untypes) then
{
  isciv          = false;
  isun           = true;
  iscop          = false;
  sidenumber     = rolenumber - civscount;
  longrolenumber = 1200 + sidenumber;
};

if (player in civarray) then
{
  isciv          = true;
  isun           = false;
  iscop          = false;
  sidenumber     = rolenumber;
  longrolenumber = 1000 + sidenumber;
};

rolestring = str(player);

//Innocent Bystander 2/11
if (typeName player == "OBJECT") then {
	if (!isNull player) then {
		call compile format["old%1 = objnull", player];
	};
};
