dragging                 = false;
dragciv                  = 0;
attached                 = false;
INV_smscost		           = 5;

fvspam = false;
skipDmg = false;
lastCall = -300;
prioCall = false;

dmgHead = 0;
dmgBody = 0;
dmgHands = 0;
dmgLegs = 0;
usepick = false;
isheal = false;
mlaw = false;
add_workplace		         = 75;
copchoprespawntime       = 120;
CopWaffenAvailable       = 0;
CopIsInPrison            = false;
CopInPrisonTime          = 180;
shooting_self            = 0;
srHinbewegen             = 0;
deadcam                  = 0;
isstunned                = false;
hatGanggebietErobert     = false;
isterror                 = false;
Antwort                  = 2;
CivTimeInPrison          = 0;
CopLog                   = [];
MayorSteuern             = 0;
MayorBekommtSteuern      = 60;
chiefSteuern             = 0;
chiefBekommtSteuern      = 60;
eigene_zeit              = time;
StunActiveTime           = 0;
StunTimePerHit		       = 10;
MaxStunTime		           = 30;
dollarzStehlenMax          = 20000;
demerits                 = 12;
truckDemerits		 = 12;
protesters		= [];
gtbonus 		 = 10;
gtactive		 = false;
keyblock		 = false;
maxboars		 = 35;
maxrabbits		 = 35;
maxmanitime		 = 2400;
powerrestorecost = 1000;
noholster		     = false;
MGcost			     = 1000;
PKcost			     = 1000;
SQUADcost		     = 2000;
maxinfai		     = 16;
firestrikes		   = 3;
totalstrikes		 = 3;
facworkercost		 = 500;
maxfacworkers		 = 20;
firingcaptive		 = false;
pickingup   		 = false;
isbet				 = false;
nobet				 = false;
lockpickchance	 = 40;
planting		     = false;
drugstockinc		 = 900;
druguserate		   = 120;
gangcap  = false;
ismedic = false;
ispmc = false;
paybonus = 0;
//========robbing variables===========
stolenfromtime 		 = 300;
stolenfromtimeractive	 = false;  // dont change
//===============MOTD==================
motdwaittime = 60;
//===============Cop Patrol==================
pmissionactive = false;
patrolwaittime = false;
patrolmoneyperkm = 0.55;  // 1 would be equal to $7,000 for 1KM
//========= government convoy =============
govconvoybonus 		  = 3500;
govconvoythiefbonus	= 15000;
convoyrespawntime   = 30;  // 30 minutes
moneyintruck 	    	= true; //dont change
convoyguardsdead		= false;
convoywinner        = "Cops and UN";
emMarkers = [];
//===== Gas station robbing
maxstationmoney = 2000;
//==============================PETROL/OIL=========================================
petroluse                = 1;
maxpetroluse             = 80;
//oildemand                = 1;
oilsellpricedec          = 0.51;
oilbaseprice		 = 2600;
//==============================MINING=============================================
shoveldur=20;
shovelmax=2;
pickaxedur=50;
pickaxemax=4;
fishingpoledur=20;
fishingpolemax=3;
hammerdur=100;
hammermax=6;
working=false;
//===============================GANGS=============================================
gangincome		 = 100;
gangcreatecost	 = 15000;
gangdeltime		 = 350;
gangsarray		 = [];
gangmember		 = false;
gangleader		 = false;
gangareas		 = [gangarea1,gangarea2,gangarea3];
//=========== cop patrol array ==========
coppatrolarray  =
[
getmarkerpos "patrolpoint1",
getmarkerpos "patrolpoint2",
getmarkerpos "patrolpoint4",
getmarkerpos "patrolpoint5",
getmarkerpos "patrolpoint6",
getmarkerpos "patrolpoint7",
getmarkerpos "patrolpoint8",
getmarkerpos "patrolpoint9",
getmarkerpos "patrolpoint10",
getmarkerpos "patrolpoint12",
getmarkerpos "patrolpoint13"
];
['schluesselbund', 1] call INV_SetItemAmount;
['treefixer', 1] call INV_SetItemAmount;
['handy', 1] call INV_SetItemAmount;
playerWeapons            = [];
playerMagazines          = [];
weaponsloaded		 = false;

CopStartGear_Mags = ["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"];
CopStartGear_Weap = ["M9","ItemGPS","NVGoggles","Binocular"];

UNStartGear_Mags = ["30rnd_9x19_MP5SD","30rnd_9x19_MP5SD","30rnd_9x19_MP5SD","30rnd_9x19_MP5SD","30rnd_9x19_MP5SD","30rnd_9x19_MP5SD","30rnd_9x19_MP5SD"];
UNStartGear_Weap = ["MP5SD","ItemGPS","NVGoggles","Binocular"];

RadioTextMsg_1 = "Put your hands up now or you will be stunned!";
RadioTextMsg_2 = "Pull over to the side of the road!";
RadioTextMsg_3 = "Do it now or your dead!";
RadioTextMsg_4 = "Dont shoot I give up!";

RadioTextArt_1 = "direct";
RadioTextArt_2 = "direct";
RadioTextArt_3 = "direct";
RadioTextArt_4 = "direct";

if(isnil "param1")then{param1 = 0};
if(isnil "param2")then{param2 = 1024};

SkipTimeDay	   	 = (floor(param2/100));
SkipTimeNight  	   	 = (param2 mod 100);

isdead			 = 0;
extradeadtime		 = 10;
respawntimeinc		 = 15;
killedplayerinc          = 30;
respawnzeit              = 10;
DeadWaitSec              = respawnzeit;
DeadTimeMax              = 30;
deadtimebonus            = 0.001;
deadtimes                = 0;
suicidepenalty		       = 30;
CopsKilled               = 0;
CivsKilled               = 0;
SelfKilled               = 0;
GesetzAnzahl             = 10;
GesetzArray              = ["Always Drive on the RIGHT side of the road", "Do not fly under 200 meters and Do not land in towns", "Civilians in posession of a weapon MUST have it holstered at all times.","Any vehicle not in car parks will be impounded.", "Speedlimit is 50km/h in town and 90km/h out of town.","" ,"" , "", "" , ""];

isMayor                  = false;
MayorNumber              = -1;
MayorExtraPay            = 100;

ischief                  = false;
chiefNumber              = -1;
chiefExtraPay            = 75;

deadcam_target_array     =

[

[17205.75,99198.17,-49454.65],
[114238.47,12719.49,3040.26],
[114238.47,12719.49,3040.28],
[9396.48,-87407.76,-3495.99],
[9396.48,-87407.76,-3495.72],
[-85499.48,17145.94,-3497.86],
[-81437.91,41177.12,-3500.26],
[-68592.92,68496.92,-3504.91],
[63894.18,99059.27,-3504.91],
[57781.25,102312.13,-3505.24],
[18155.12,112290.52,-3505.59],
[114056.91,13559.94,-3506.64],
[114056.91,13559.94,-3506.63],
[12082.11,112377.59,-3507.94],
[12082.11,112377.59,-3508.13],
[12082.11,112377.59,-3507.88],
[71475.13,94441.38,-3511.65],
[79131.48,88521.11,-3512.17],
[90116.62,77668.10,-3514.78],
[93979.69,72896.55,-3515.45],
[23989.44,112118.31,-3515.51],
[111421.41,-10631.93,-3515.78],
[111421.41,-10631.93,-3515.45],
[111421.41,-10631.93,-3515.62],
[-85207.23,22475.24,-3515.77],
[-85269.09,22481.34,761.18],
[-52542.68,-60176.11,-15820.92],
[66335.50,-71098.57,-15831.98],
[112733.68,9274.25,-15848.19],
[112733.68,9274.25,-15848.03],
[112733.68,9274.25,-15848.01],
[112733.68,9274.25,-15848.28],
[15793.38,-87445.16,-1975.57],
[15793.38,-87445.16,-1975.58],
[-85045.43,23679.19,-1976.55],
[-2976.49,110953.34,-1977.04],
[-2976.49,110953.34,-1976.94],
[25975.48,-86795.57,-1977.29],
[25975.48,-86795.57,-1977.28],
[30152.87,-86219.98,-1977.49],
[114191.58,8919.13,-1977.75],
[114186.95,8335.76,-1978.02],
[13212.45,-87514.59,-1978.28],
[13212.45,-87514.59,-1978.39],
[13328.19,-76559.05,-45508.50]

];

deadcam_position_array   =

[

[6573.78,2365.67,19.16],
[6563.33,2409.16,3.60],
[6598.98,2409.17,3.60],
[6615.21,2406.75,2.60],
[6616.97,2469.89,3.60],
[6619.17,2455.47,4.36],
[6650.88,2457.08,5.60],
[6719.63,2400.90,6.92],
[6712.46,2403.60,7.08],
[6712.08,2419.00,8.08],
[6727.18,2457.75,20.08],
[6724.96,2465.48,15.08],
[6764.31,2465.91,7.08],
[6771.92,2463.60,20.08],
[6771.38,2538.25,21.08],
[6771.13,2550.88,22.08],
[6769.29,2568.52,23.08],
[6793.91,2598.42,24.08],
[6825.21,2646.20,25.08],
[6839.44,2658.20,25.08],
[6869.00,2658.38,25.08],
[6909.94,2668.50,25.35],
[6942.29,2667.94,25.33],
[6846.04,2627.05,20.37],
[6827.04,2538.54,18.41],
[6742.96,2468.32,18.69],
[6769.18,2697.18,15.22],
[6792.32,2615.79,10.43],
[6679.88,2556.44,6.43],
[6560.67,2516.16,6.43],
[6588.56,2525.49,6.43],
[6551.50,2521.79,6.43],
[6606.49,2523.45,1.69],
[6606.37,2476.85,1.69],
[6602.42,2474.65,1.69],
[6578.19,2474.97,1.69],
[6574.55,2488.17,1.69],
[6574.79,2497.03,1.69],
[6573.99,2491.74,5.46],
[6574.33,2490.64,4.93],
[6574.66,2458.02,4.93],
[6597.66,2457.95,4.93],
[6599.95,2459.04,5.23],
[6599.66,2459.05,18.31],
[6575.55,2451.36,19.46]

];

atmscriptrunning = 0;
shopactivescript = 0;
deadcam_wechsel_dauer    = 5;
deadcam_kameraposition   = round(random (count deadcam_position_array - 1));
slave_cost               = 12500;
slavemoneyprosekunde	   = 250;
maxslave                 = 6;
copslaveallowed          = 0;
localslave               = 0;
localslavecounter        = 0;
huren_cost               = 1000;
hoemoneyprosekunde       = 500;
maxhuren                 = 5;
copworkerallowed         = 0;
pimpactive               = 0;
localhuren               = 0;
localhurencounter        = 0;
hideoutcost		           = 2000;
marker_ausserhalb        = param1;
marker_innerhalb         = 5;
marker_CopDistance       = 50; //controls distance cops need to be to make civ dots appear outside of towns.
CivMarkerUngenau         = 20;
copmarker_on             = 1;
despawnarray	 	 = [["EvMoney", 300], ["Suitcase", 300]];
workplacearray           = [[workplace1, 80], [workplace2, 80], [workplace3, 60]];
huntingarray             = [["boarhunting", 300]];
nonlethalweapons	 = ["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];
slavearray               = workplacearray;
timeinworkplace          = 0;
wpcapacity               = 10;
INV_hasitemshop          = 0;
INV_haswepshop           = 0;
BuildingsOwnerArray 	 = [];

if(isciv) then
{

BuyAbleBuildingsArray    =

[

["wp1", "Workplace 1", workplace_getjobflag_1, 3000, 150, "wp", "WpAblage_1"],
["wp2", "Workplace 2", workplace_getjobflag_2, 3000, 150, "wp", "WpAblage_2"],
["wp3", "Workplace 3", workplace_getjobflag_3, 3000, 150, "wp", "WpAblage_3"]

];

};
// array used in taxi missions
civclassarray		 =

[

"TK_CIV_Takistani01_EP1",
"TK_CIV_Takistani02_EP1",
"TK_CIV_Takistani03_EP1",
"TK_CIV_Takistani04_EP1",
"TK_CIV_Takistani05_EP1",
"TK_CIV_Takistani06_EP1",
"TK_CIV_Woman01_EP1",
"TK_CIV_Woman02_EP1",
"TK_CIV_Woman03_EP1",
"TK_CIV_Worker01_EP1",
"TK_CIV_Worker02_EP1",
"Citizen2_EP1",
"Citizen3_EP1",
"CIV_EuroMan01_EP1",
"CIV_EuroMan02_EP1",
"Dr_Hladik_EP1",
"Functionary1_EP1",
"Functionary2_EP1",
"Haris_Press_EP1",
"Profiteer2_EP1"

];

civslavearray		 = ["TK_CIV_Worker01_EP1","TK_CIV_Worker01_EP1","TK_CIV_Worker01_EP1","TK_CIV_Worker01_EP1","TK_CIV_Worker01_EP1"];
civworkerarray	 = ["Worker1","Worker2","Worker3","Worker4"];
terroristarray	 = ["TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_AAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_HAT_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_EP1"];
profs = [
	["Judge","STR_prof_judge",2000],
	["Lawyer","STR_prof_lawyer",1000],
	["Medic","STR_prof_medic",200]
];

if(isServer)then
{
  TankenCost = 10; publicvariable "TankenCost";
  
  onplayerconnected '
  publicVariable "convoywinner";
  publicVariable "GesetzArray";
  publicVariable "INV_ItemTypenArray";
  publicVariable "INV_itemstocks";
  currentTime = daytime; publicVariable "currentTime";
  
  format["if(%1)then{power1 setdamage 0};if(%2)then{power2 setdamage 0};", alive power1, alive power2] call broadcast;
';
};

