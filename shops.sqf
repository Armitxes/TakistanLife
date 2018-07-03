if (isServer) then {
  INV_itemstocks = [
    [5,5,5], //gasstation1 #1
    [5,5,5], //gasstation2 #2
    [5,5,5], //gasstation3 #3
    [5,5,5], //gasstation4 #4
    [5,5,5], //gasstation5 #5
    [5,5,5], //gasstation6 #6
    [5,5,5], //gasstation7 #7
    [5,5,5], //northsupermarket #8
    [5,5,5], //gasstation8
    [5,5,5], //gasstation9
    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //itemshop1 #9
    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //itemshop2 #10
    [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //itemshop3 #11
    [10000,10000,10000,10000,10000,10000,10000], //Barshop #13
	[15, -1, 15, -1, 15, -1, 15, -1, 8, -1, 8, -1, 8, -1, 8, -1, 8, 8, -1, 8, -1, 8, -1, 8, -1, 8, -1, 8, -1, 8, 8, -1, 8, -1, 8, -1], //gunshop #14
    [100,100,100,100,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //equipmentshop #15
    [5,5,5,5,5], //tuning1 #16
    [5,5,5,5,5], //tuning2 #17
    [5,5,5,5,5], //tuning3
    [-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop1 #19
    [-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop2 #20
    [-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop3 #21
    [-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop4 #22
	[-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop5 #22
	[-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //prison car shop #22
    [5,5,5,5,5,5,5,5,-1,-1,-1], //truckshop1 #23
    [5,5,5,5,5,5,5,5,-1,-1,-1], //truckshop2 #24
    [3,5,3,3,3,3,3,-1,-1,-1,-1], //airshop1 #25
    [3,5,3,3,3,3,3,-1,-1,-1,-1], //airshop2 #26
    [-1,5], //miningtools #28
    -1, //resources #29
    -1, //ring shop #30
    -1, //oil dealer #31
    -1, //gangshop1 #32
    -1, //gangshop2 #33
    -1, //gangshop3 #34
    -1, //cocaine #35
    -1, //marijuana #36
    -1, //lsd #37
    -1, //heroin #38
    -1, //copcar #39
    -1, //copair #40
    -1, //SCOcar #41
    -1, //SCOair #41
    -1, // UN Members #43
    -1, // UN Car     #44
    -1, // UN Air     #45
    -1, // UN Equip   #46
    -1, // UN Whitelist #47
    -1, //copbasic #48
    -1, //coppatrol #49
    -1, //copresponse #50
    -1, //SCOitems #51
    -1, //terrorvehicles #52
    -1, //terrorshop #53
    -1, //Mayor #54
    -1, //Mayor #55
    [100,100,100,100,-1,-1], //equipmentshop #56
    -1, //Member troll shop #57
    -1,//southvehshop #66
    -1, //southairshop #67
    -1, //southgovshop #68
    [100,100,100,100,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //equipmentshop 3 #69
    -1, // Trained Cop #70
    -1, // UN NCO #71
    -1,// Clothing Shop #72
    -1,//doc
    -1,//hosair
	-1,// Clothing Shop Basic
	-1,// South Clothing Shop
    -1,// PMC Shop
    -1,// PMC Car
    -1,// PMC Air
    -1, // Pet Shop
    -1,	// RS 2
	[-1,5], // Mining Tools South
    [10,-1,10,-1,10,-1,10,-1,10,-1,10,-1,10,-1,10,-1,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1] // Gunshop 2
];

  publicvariable "INV_itemstocks";
};

INV_itemmaxstocks = [
[5,5,5], //gasstation1 #1
[5,5,5], //gasstation2 #2
[5,5,5], //gasstation3 #3
[5,5,5], //gasstation4 #4
[5,5,5], //gasstation5 #5
[5,5,5], //gasstation6 #6
[5,5,5], //gasstation7 #7
[5,5,5], //northsupermarket #8
[5,5,5], //gasstation8
[5,5,5], //gasstation9
[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //itemshop1 #9
[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //itemshop2 #10
[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //itemshop3 #11
[10000,10000,10000,10000,10000,10000,10000], //Barshop #13
[20, -1, 20, -1, 20, -1, 20, -1, 10, -1, 10, -1, 10, -1, 10, -1, 10, 10, -1, 10, -1, 10, -1, 10, -1, 10, -1, 10, -1, 10, 10, -1, 10, -1, 10, -1], //gunshop #14
[100,100,100,100,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //equipmentshop #15
[5,5,5,5,5], //tuning1 #16
[5,5,5,5,5], //tuning2 #17
[5,5,5,5,5], //tuning3
[-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop1 #19
[-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop2 #20
[-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop3 #21
[-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop4 #22
[-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //carshop5 #22
[-1,-1,10,10,10,-1,-1,5,5,5,5,5,5,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //prison car shop #22
[5,5,5,5,5,5,5,5,-1,-1,-1], //truckshop1 #23
[5,5,5,5,5,5,5,5,-1,-1,-1], //truckshop2 #24
[3,5,3,3,3,3,3,-1,-1,-1,-1], //airshop1 #25
[3,5,3,3,3,3,3,-1,-1,-1,-1], //airshop2 #26
[-1,5], //miningtools #28
-1, //resources #29
-1, //ring shop #30
-1, //oil dealer #31
-1, //gangshop1 #32
-1, //gangshop2 #33
-1, //gangshop3 #34
-1, //cocaine #35
-1, //marijuana #36
-1, //lsd #37
-1, //heroin #38
-1, //copcar #39
-1, //copair #40
-1, //SCOcar #41
-1, //SCOair #41
-1, // UN Members #43
-1, // UN Car     #44
-1, // UN Air     #45
-1, // UN Equip   #46
-1, // UN Whitelist #47
-1, //copbasic #48
-1, //coppatrol #49
-1, //copresponse #50
-1, //SCOitems #51
-1, //terrorvehicles #52
-1, //terrorshop #53
-1, //Mayor #54
-1, //Mayor #55
[100,100,100,100,-1,-1], //equipmentshop #56
-1, //Member troll shop #57
-1,//southvehshop #66
-1, //southairshop #67
-1, //southgovshop #68
[100,100,100,100,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1], //equipmentshop 3 #69
-1, // Trained Cop #70
-1, // UN NCO #71
-1,// Clothing Shop #72
-1,//doc
-1,//hosair
-1,//Clothing Shop Basic
-1,//Clothing Shop South
-1,// PMC Shop
-1,// PMC Car
-1,// PMC Air
-1,
-1, // RS 2
[-1,5], // Mining Tools South
[10,-1,10,-1,10,-1,10,-1,10,-1,10,-1,10,-1,10,-1,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1] // Gunshop 2
];


// Shop items

_emptyshop = [];
//Fuel Shop
_fs = ["Fuelline", "kanister", "reparaturkit"];
//Item Shop
_is = ["perch", "trout", "walleye", "bass", "Bread", "rabbit", "boar", "medikit", "handy", "lighter", "fishingpole", "Pickaxe"];
//Alcohol shop / Pub
_pub = ["beer","beer2","vodka","smirnoff","wiskey","wine","wine2"];
//Gun Shop
//Guns - M9, 1911, Revolver-Silver, Lee Enfield
_gs = ["M9_Civ", "Rnd_9x19_M9","glock17_EP1","Rnd_9x19_glock17","Makarov","Rnd_9x18_Makarov","Colt1911", "Rnd_45ACP_1911", "revolver_EP1", "Rnd_45ACP", "LeeEnfield","x_303","Saiga12K","8Rnd_B_Saiga12_Pellets","M8_compact","Rnd_556x45_G36","m8_carbine","MakarovSD","8Rnd_9x18_MakarovSD","Huntingrifle","x_22_LR_17_HMR","AKS_74_UN_Kobra","30Rnd_545x39_AKSD","AKS_GOLD","Rnd_762x39_AK47","G36_C_SD_Camo","30Rnd_556x45_G36SD","SCAR_L_CQC_Holo","30Rnd_556x45_Stanag","M8_HOLO_SD","M4A1_AIM_SD_CAMO","30Rnd_556x45_StanagSD","RPK_74","75Rnd_545x39_RPK","VSS_Vintorez","10Rnd_9x39_SP5_VSS"];
//Equiptment shop
//Bino's, NVG's, GPS, Lockpick
_es = ["Binocular", "NVGoggles", "GPS","Fuelline","handy","bugfixer","hackkit","medikit","lockpick","NVGoggles","reparaturkit","lighter","handy","Fuelline","kanister","GPS","Binocular","supgrade"];
//Car Upgrades
_cu = ["supgrade","towingtool"];
//Car Shop
//Bike, Old Motorbike, Motorbike, ATV, Vohla Blue, Vohla Grey, Lada, Lada Hippie, S1203 Van, Landrover
_cs = ["Old_bike_TK_CIV_EP1","MMT_Civ","Old_moto_TK_Civ_EP1","TT650_TK_CIV_EP1","ATV_CZ_EP1","Volha_1_TK_CIV_EP1","VWGolf","SkodaBlue","Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1","S1203_TK_CIV_EP1","hilux1_civil_3_open_EP1","LandRover_TK_CIV_EP1","SUV_PMC_BAF","SUV_WHITE","SUV_BLUE","SUV_BLUEWHITE","SUV_RED","TT650_Civ","car_hatchback","datsun1_civil_2_covered","Tractor","TT650_Gue","hilux1_civil_1_open","hilux1_civil_2_covered"];
//Pickup Shop - Unused Arma2
_ps = ["datsun1_civil_1_open", "datsun1_civil_2_covered", "datsun1_civil_3_open", "hilux1_civil_1_open", "hilux1_civil_2_covered"];
//Vehicle Shop - Same as Car Shop, Used for Car Shop 3
_vs = ["Old_bike_TK_CIV_EP1","MMT_Civ","Old_moto_TK_Civ_EP1","TT650_TK_CIV_EP1","ATV_CZ_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","SkodaBlue","Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1","S1203_TK_CIV_EP1","hilux1_civil_3_open_EP1","LandRover_TK_CIV_EP1"];
//Unused - Some sort of terror shop
_av = ["Pickup_PK_INS"];
//Truck Shop
//Ural, V3S Open, V3S Repair, V3S Covered, Bus
_ts = ["Ural_TK_CIV_EP1", "V3S_Open_TK_CIV_EP1", "V3S_Repair_TK_GUE_EP1", "V3S_Refuel_TK_GUE_EP1", "V3S_TK_EP1", "Ikarus_TK_CIV_EP1", "Kamaz", "KamazOpen", "MtvrRepair_DES_EP1","MtvrRefuel_DES_EP1","UralOpen_CDF"];
//Air Shops
_as = ["AH6X_EP1","An2_1_TK_CIV_EP1","C130J_US_EP1","V3S_Repair_TK_GUE_EP1","V3S_Refuel_TK_GUE_EP1","TowingTractor","Mi17_Civilian","Ka137_PMC","MH6J_EP1","BAF_Merlin_HC3_D","MV22"];
//Mining Shop
_ms = ["Pickaxe","JackHammer"];
//Resource Shop
_rs = ["Platinum","Gold","Silver","Rubies","iron","copper","steel","glass"];
//Diamond Sell
_gds = ["Diamondring","EDiamondring","Platinumring","EPlatinumring"];
//Oil Trader/Seller
_os = ["OilBarrel"];
//Unused - Unsure
_db1 = ["Cannabis","cocaine","lsd"];
_db2 = ["cocaine","lsd"];
_db3 = ["heroin","Cannabis"];
//Cocaine Sell
_dsc = ["cocaine"];
//Cannabis Sell
_dsm = ["Cannabis"];
//LSD Sell
_dsl = ["lsd"];
//Heroin Sell
_dsh = ["heroin"];
//Cop Vehicle Shop
_cv = ["Old_bike_TK_INS_EP1","MMT_USMC","M1030_US_DES_EP1","ATV_US_EP1","VolhaLimo_TK_CIV_EP1","LadaLM","UAZ_Unarmed_TK_EP1","BAF_Offroad_D","SUV_COP","HMMWV_M1035_DES_EP1","MTVR_DES_EP1","MtvrReammo_DES_EP1","MtvrRepair_DES_EP1","MtvrRefuel_DES_EP1"];
//Cop Air Shop
_ca = ["MH6J_EP1","AH6X_EP1_COP"];
//SCO Vehicle Shop
_sv = ["SUV_SCO","HMMWV_DES_EP1","HMMWV_M1151_M2_DES_EP1","M2A3_EP1","BAF_Jackal2_L2A1_D"];
//SCO Air Shop
_sa = ["MH6J_EP1","UH60M_EP1"];
// UN vehicles
_unmemshop = ["FlagCarrierUNO_EP1","BMP2_UN_EP1","BAF_Jackal2_L2A1_D","M113_UN_EP1","LAV25","UH1Y"];
_unveh = ["UAZ_Unarmed_UN_EP1","SUV_UN_EP1","Ural_UN_EP1","M113Ambul_UN_EP1","BTR40_UN_U","M1133_MEV_EP1"];
_unair = ["Mi17_UN_CDF_EP1"];
// South Government Vehicle Shop
_souveh = ["T55_TK_GUE_EP1","T72_TK_EP1","BRDM2_TK_GUE_EP1","Ural_ZU23_TK_GUE_EP1","BTR40_MG_TK_INS_EP1","M113_TK_EP1","BTR60_TK_EP1","LandRover_MG_TK_EP1","UralReammo_TK_EP1","UralRefuel_TK_EP1","UralRepair_TK_EP1"];
// South Government Air Shop
_souair = ["Mi17_Ins","UH1H_TK_GUE_EP1","Mi17_medevac_Ins"];
//Medic Shop
_hos = ["medikit","towingtool","docUni","docUni2","docUni3","docUni4","S1203_ambulance_EP1","HMMWV_Ambulance","GAZ_Vodnik_MedEvac"];
_hosair = ["UH60M_MEV_EP1"];
//South Goverment Shop
_soushop = [
	"Binocular",
	"NVGoggles",
	"GPS",
	"kanister",
	"reparaturkit",
	"medikit",
	"vclammo",
	"US_Backpack_EP1",
	"SouthUni1",
	"SouthUni2",
	"SouthUni3",
	"SouthUni4",
	"SouthUni5",
	"SouthUni6",
	"SouthUni7",
	"AK_107_Kobra",
	"AK_107_GL_Kobra",
	"AK_107_PSO",
	"AK_107_GL_PSO",
	"30Rnd_545x39_AK",
	"1Rnd_HE_GP25",
	"Sa58V_CCO_EP1",
	"Sa58V_RCO_EP1",
	"30Rnd_762x39_SA58",
	"SVD_CAMO",
	"10Rnd_762x54_SVD",
	"KSVK_sou",
	"5Rnd_127x108_KSVK",
	"PK_sou",
	"100Rnd_762x54_PK",
	"RPG7V_sou",
	"PG7V",
	"PG7VR",
	"PG7VL",
	"RPG18",
	"RPG18_mag",
	"Strela_sou",
	"Strela_mag",
	"Igla_sou",
	"Igla_mag",
	"HandGrenade_sou",
	"Land_CamoNetVar_NATO_EP1",
	"Fort_Barricade_EP1",
	"Land_Campfire_burning",
	"US_WarfareBUAVterminal_Base_EP1",
	"CampEast_EP1",
	"Land_HBarrier5",
	"bargate"
];

_copshop        =
[
	"CopUniDef",
	"M9",
	"Rnd_9x19_M9SD",
	"15Rnd_9x19_M9",
	"Binocular",
	"NVGoggles",
	"copreparaturkit",
	"kanister",
	"medikit",
	"handy",
	"SmokeShell"
];

_copshop_patrol =
[
	"copUni",
	"towingtool",
	"roadblock",
	"RoadBarrier",
	"bargate",
	"SearchLight_US_EP1",
	"roadcone",
	"bunkersmall",
	"Spikestrip",
	"Sign_Checkpoint_US_EP1",
	"Land_CamoNetVar_NATO_EP1",
	"Land_HBarrier5",
	"Hedgehog_EP1",
	"supgrade"
];

_copshop_response = [
	"copUni1",
	"M1014",
	"seccam",
	"8Rnd_B_Beneli_Pellets",
	"8Rnd_B_Beneli_74Slug",
	"mp5a5",
	"30rnd_9x19_MP5",
	"30rnd_9x19_MP5SD",
	"glock17_EP1_COP",
	"Rnd_9x19_glock17",
	"vclammo"
];

_copshop_SCO =
[
	"FlagCarrierBLUFOR_EP1",
	"copUni2",
	"copUni3",
	"copUni4",
	"copUni5",
	"copUni6",
	"copUni7",
	"copUni11",
	"copUni12",
	"US_Backpack_EP1",
	"lockpick",
	"copreparaturkit",
	"kanister",
	"medikit",
	"handy",
	"vclammo",
	"NVGoggles",
	"GPS",
	"Binocular_Vector",
	"glock17_EP1_COP",
	"Rnd_9x19_M9SD",
	"M110_NVG_EP1",
	"20rnd_762x51_B_SCAR",
	"M249_EP1",
	"BAF_L110A1_Aim",
    "200Rnd_556x45_M249",
	"M4A1_AIM",
	"m16a4_acg",
	"100Rnd_556x45_BetaCMag",
	"M4A1_HWS_GL_SD_CAMO",
	"30Rnd_556x45_StanagSD",
	"1Rnd_Smoke_M203",
	"BAF_LRR_scoped",
	"5Rnd_86x70_L115A1",
	"SMAW",
	"SMAW_HEAA",
	"M47Launcher_EP1",
	"Dragon_EP1",
	"Stinger",
	"Stinger_mag",
	"PipeBomb",
	"M2StaticMG_US_EP1",
	"supgrade",
	"Spikestrip",
	"bigbagfence",
	"lighter",
	"roadblock",
	"towingtool",
	"seccam",
	"Land_ladderEP1",
	"Land_ladder_half_EP1"
];

_copfo=
[
	"copUni7",
	"copUni6",
	"copUni8",
	"copUni9",
	"copUni10",
	"US_Backpack_EP1",
	"G36C",
	"G36A_camo",
	"G36K_camo",
	"30Rnd_556x45_G36",
	"G36_C_SD_eotech",
	"30Rnd_556x45_G36SD",
	"M4A1_HWS_GL",
	"30Rnd_556x45_Stanag",
	"Mk13_EP1",
	"1Rnd_Smoke_M203",
	"Land_ladderEP1",
	"Land_ladder_half_EP1",
	"AW159_Lynx_BAF",
	"US_WarfareBUAVterminal_Base_EP1",
	"FlagCarrierBLUFOR_EP1"
];

_uns =
[
	"MP5SD",
	"30rnd_9x19_MP5SD",
	"M9",
	"Rnd_9x19_M9SD",
	"15Rnd_9x19_M9",
	"SCAR_L_CQC",
	"30Rnd_556x45_Stanag",
	"NVGoggles",
	"unUni4",
	"GPS",
	"vclammo",
	"copreparaturkit",
	"seccam",
	"kanister",
	"medikit",
	"supgrade",
	"towingtool",
	"handy",
	"SmokeShell",
	"Spikestrip",
	"Sign_Checkpoint_US_EP1",
	"roadblock",
	"bargate",
	"RoadBarrier",
	"SearchLight_US_EP1",
	"roadcone",
	"Land_HBarrier5",
	"Land_CamoNetVar_NATO_EP1",
	"bunkersmall",
	"Hedgehog_EP1",
	"CampEast_EP1"
];

_unms        =
[
	"US_Backpack_EP1",
	"30Rnd_556x45_Stanag",
	"SCAR_H_CQC_CCO",
	"M110_NVG_EP1",
	"20Rnd_762x51_B_SCAR",
	"M24_des_EP1",
	"5Rnd_762x51_M24",
	"M249_EP1",
	"200Rnd_556x45_M249",
	"BAF_L86A2_ACOG",
	"Stinger",
	"Stinger_mag",
	"PipeBomb",
	"MAAWS",
	"MAAWS_HEAT",
	"Land_ladderEP1",
	"Land_ladder_half_EP1"
];

_unnco =
[
	"US_Backpack_EP1",
	"M16A4",
	"SCAR_L_CQC_EGLM_Holo",
	"SCAR_L_STD_Mk4CQT",
	"30Rnd_556x45_Stanag",
	"1Rnd_Smoke_M203",
	"M113_UN_EP1",
	"BTR40_UN"
];

_terrorshop_buy =
[
	"C4",
	"reparaturkit",
	"Binocular",
	"NVGoggles",
	"GPS",
	"lockpick",
	"ziptie",
	"medikit",
	"vclammo",
	"hackkit",
	"TerrorUni1",
	"TerrorUni2",
	"TerrorUni3",
	"TerrorUni4",
	"TerrorUni5",
	"TerrorUni6",
	"TerrorUni7",
	"US_Backpack_EP1",
	"Makarov",
	"Rnd_9x18_Makarov",
	"AK74",
	"AK74GL",
	"AKS74U",
	"AKS74pso",
	"30Rnd_545x39_AK",
	"Rnd_762x39_AK47",
	"1Rnd_HE_GP25",
	"Sa58P_EP1",
	"Sa58V_EP1",
	"30Rnd_762x39_SA58",
	"SVD",
	"10Rnd_762x54_SVD",
	"KSVK",
	"5Rnd_127x108_KSVK",
	"PK",
	"100Rnd_762x54_PK",
	"RPG7V",
	"PG7VR",
	"PG7VL",
	"PG7V",
	"OG7",
	"Strela",
	"Strela_mag",
	"HandGrenade",
	"DSHKM_TK_INS_EP1",
	"Land_CamoNetVar_NATO_EP1",
	"Fort_Barricade_EP1",
	"Land_Campfire_burning",
	"US_WarfareBUAVterminal_Base_EP1",
	"CampEast_EP1",
	"Land_HBarrier5"
];

_terrorvehicles = [
	"Pickup_PK_TK_GUE_EP1",
	"UAZ_MG_TK_EP1",
	"Offroad_DSHKM_TK_GUE_EP1",
	"Mi17_TK_EP1",
	"UH1H_TK_EP1"
];

_gangshop_buy =
[
	"revolver_gold_EP1",
	"Rnd_45ACP",
	"UZI_EP1",
	"Rnd_9x19_UZI",
	"Binocular",
	"NVGoggles",
	"GPS",
	"hackkit",
	"reparaturkit",
	"lockpick",
	"lighter",
	"Fuelline",
	"ziptie",
	"kanister",
	"medikit",
	"bargate",
	"BigbagfenceCorner",
	"bigbagfence",
	"bigbagfenceRound",
	"Land_CamoNetVar_NATO_EP1",
	"bunkersmall",
	"US_WarfareBUAVterminal_Base_EP1",
	"CampEast_EP1",
	"GangUni1","GangUni2","GangUni3",
	"GangUni4","GangUni5","GangUni6"
];
_mayorveh =
[
"ATV_CZ_EP1",
"hilux1_civil_3_open_EP1",
"LandRover_TK_CIV_EP1",
"SUV_PMC_BAF",
"ArmoredSUV_PM",
"Ka60_PM",
"MH6J_EP1"
];
_mayorbox =
[
"medikit",
"reparaturkit",
"supgrade",
"NVGoggles"
];
_memshop =
[
"medikit",
"Binocular",
"handy",
"reparaturkit",
"kanister",
"hackkit",
"Fuelline",
"NVGoggles",
"Makarov",
"Rnd_9x18_Makarov",
"Bizon",
"64Rnd_9x19_Bizon",
"revolver_gold_EP1",
"Rnd_45ACP"
];
_civCloth = [
"civUni1","civUni2",
"civUni3","civUni4",
"civUni5","civUni6",
"civUni7","civUni8",
"DonUni3","DonUni6",
"DonUni2","DonUni7",
"DonUni4","DonUni5",
"DonUni8","DonUni1"
];
_pmcshop = [
"Binocular",
"NVGoggles",
"reparaturkit",
"kanister",
"medikit",
"handy",
"GPS",
"lockpick",
"ziptie",
"Pmcuni1",
"Pmcuni2",
"Pmcuni3",
"Pmcuni4",
"Pmcuni5",
"Pmcuni6",
"Pmcuni7",
"Pmcuni8",
"glock17_EP1_PMC",
"Rnd_9x19_glock17",
"M8_compact_PMC",
"m8_carbine_PMC",
"m8_sharpshooter",
"M4A3_CCO_EP1",
"30Rnd_556x45_Stanag",
"100Rnd_556x45_BetaCMag",
"Sa58V_CCO_EP1_PMC",
"Sa58V_RCO_EP1_PMC",
"30Rnd_762x39_SA58",
"Sign_Checkpoint_US_EP1",
"roadblock",
"bargate",
"RoadBarrier",
"SearchLight_US_EP1",
"roadcone",
"Land_HBarrier5",
"Land_CamoNetVar_NATO_EP1"
];
_pmccar = [
"ATV_CZ_EP1",
"ArmoredSUV_PMC",
"LandRover_TK_CIV_EP1"
];
_pmcair = [
	"Ka60_PMC",
	"MH6J_EP1"
];

_petShop = [
	"Dog","Rabbits",
	"Cow","Goat","Hen",
	"Sheep","WildBoar"
];

INV_ItemShops = [
[gasstation1,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true], // #1
[gasstation2,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true], // #2
[gasstation3,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true], // #3
[gasstation4,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true], // #4
[gasstation5,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true], // #5
[gasstation6,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true], // #6
[gasstation7,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true], // #7
[northsupermarket,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true], // #8
[gasstation8,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
[gasstation9,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],

[shop1,"Item Shop",dummyobj,dummyobj,_is,_is,true], // #9
[shop2,"Item Shop",dummyobj,dummyobj,_is,_is,true], // #10
[shop3,"Item Shop",dummyobj,dummyobj,_is,_is,true], // #11

[pub1,"Pub",dummyobj,dummyobj,_pub,_pub,true], // #13

[gunshop1,"Gun Shop",gunbox1,dummyobj,_gs,_gs,true], // 14

[equipshop1,"Equipment Shop",equipbox,dummyobj,_es,_es,true], // #15

[tuning1,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true], // #16
[tuning2,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true], // #17
[tuning3,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true],

[carshop1,"Car Shop",dummyobj,"carspawn1",_cs,_cs,true],  // #18
[carshop2,"Car Shop",dummyobj,"carspawn2",_cs,_cs,true],  // #19
[carshop3,"Car Shop",dummyobj,"carspawn3",_cs,_cs,true],  // #20
[carshop4,"Car Shop",dummyobj,"carspawn4",_cs,_cs,true],  // #21
[carshop5,"Car Shop",dummyobj,"carspawn5",_cs,_cs,true],
[vehicleShopPrison,"Prison Vehicle Shop",dummyobj,"vehicleShopPrisonSpawn",_cs,_cs,true],


[truckshop,"Truck Shop",dummyobj,"truckspawn",_ts,_ts,true], // #21
[truckshop2,"Truck Shop",dummyobj,"truckspawn2",_ts,_ts,true], // #21

[airshop,"Air Shop",dummyobj,"asairspawn",_as,_as,true],  // #22
[airshop_1,"Loy Manara Air Shop",dummyobj,"asairspawn_1",_as,_as,true], // #23

[Oil_1,"Mining equipment",dummyobj,dummyobj,_ms,_ms,true], // #25

[resourcesell,"Sell Resources",dummyobj,dummyobj,_rs,_rs,true], // #26

[RingShop,"Ring Sell", dummyobj,dummyobj,_gds,_gds,true], // #27

[OilSell1,"Oil Dealer", dummyobj,dummyobj, _emptyshop,_os,true], // #28

[gangarea1,"Gang Shop",gangbox1,dummyobj,_gangshop_buy,_gangshop_buy,false], // #29
[gangarea2,"Gang Shop",gangbox2,dummyobj,_gangshop_buy,_gangshop_buy,false], // #30
[gangarea3,"Gang Shop",gangbox3,dummyobj,_gangshop_buy,_gangshop_buy,false], // #31

[cdrugsell,"Sell Cocaine",dummyobj,dummyobj,_emptyshop,_dsc,true],  // #32
[mdrugsell,"Sell marijuana",dummyobj,dummyobj,_emptyshop,_dsm,true],  // #33
[ldrugsell,"Sell LSD",dummyobj,dummyobj,_emptyshop,_dsl,true],   // #34
[hdrugsell,"Sell Heroin",dummyobj,dummyobj,_emptyshop,_dsh,true],   // #35

[copcar,"Police vehicle Shop",dummyobj, "ccarspawn",_cv,_cv,true],   // #36
[copair,"Police Air-Vehicle Shop",dummyobj, "cairspawn",_ca,_ca,true],  // #37
[swatcar,"SCO Vehicle Shop",dummyobj, "scarspawn",_sv,_sv,true],       // #38
[swatair,"SCO Air Vehicles Shop",dummyobj, "saairspawn",_sa,_sa,true], // #39

[unmemshop,"UN Member Shop",dummyobj, "uncarspawn",_unmemshop,_unmemshop,true], // 40
[uncar,"UN Vehicle Shop",dummyobj, "uncarspawn",_unveh,_unveh,true],  // 41
[unair,"UN Air Shop",dummyobj, "unairspawn",_unair,_unair,true],      // 42
[unbox,"UN Equipment",unbox,dummyobj,_uns,_uns,true],               // 43
[unmembox,"UN Equipment",unmembox,dummyobj,_unms,_unms,true],       // 44

[copbasic,"Police Shop",copbasic,dummyobj, _copshop,_copshop,true], // 45
[coppatrol,"Patrol Officers",coppatrol,dummyobj,_copshop_patrol,_copshop_patrol,true], //46
[copcriminal,"Advanced Officers",copcriminal,dummyobj,_copshop_response,_copshop_response,true], //47
[copswat,"SCO19",copswat,dummyobj,_copshop_SCO,_copshop_SCO,true],   //48

[terrorvehicles33,"Terrorist vehicles",dummyobj,"tairspawn",_terrorvehicles,_terrorvehicles,true],  // 49
[terrorshop,"Terrorist Shop",tgunbox,dummyobj,_terrorshop_buy,_terrorshop_buy,true],              // 50

[mayorveh,"Prime Minister Vehicles",dummyobj,"mayorvehspawn",_mayorveh,_mayorveh,true],             // 51
[mayorbox,"Prime Minister Shop",mayorbox,dummyobj,_mayorbox,_mayorbox,true],                      // 52
[equipshop2,"Equipment Shop",equipbox2,dummyobj,_es,_es,true],    // 53
[memshop,"Member Shop",membox2,dummyobj,_memshop,_memshop,true],  // 54

[southveh, "South Government Vehicles",dummyobj,"soucarspawn", _souveh,_souveh,true], //#63
[southair, "South Government Air",dummyobj,"souairspawn", _souair,_souair,true], //#64
[southshop, "South Government Shop",southbox,dummyobj, _soushop,_soushop,true], //#65
[equipshop3,"Equipment Shop",equipbox3,dummyobj,_es,_es,true], //#70

[coparmed, "Trained Firearms Officer",coparmed,"cairspawn",_copfo,_copfo],
[unnco, "UN NCO Equipment",unnco,"uncarspawn",_unnco,_unnco],
[clothciv, "Clothing Shop",dummyobj,dummyobj,_civCloth,_civCloth,true],
[objNull,"Hospital",dummyobj,"hosSpwn",_hos,_hos,false],
[objNull,"Hospital Air",dummyobj,"hosairSpwn",_hosair,_hosair,false],
[clothcivbase, "Clothing Shop",dummyobj,dummyobj,_civCloth,_civCloth,true],
[objNull, "Clothing Shop",dummyobj,dummyobj,_civCloth,_civCloth,true],
[pmcshop,"PMC Shop",pmcbox,dummyobj,_pmcshop,_pmcshop,true],
[pmccar,"PMC Car Shop",dummyobj,"pmccarspawn",_pmccar,_pmccar,true],
[pmcair,"PMC Air Shop",dummyobj,"pmcairspawn",_pmcair,_pmcair,true],
[petshop,"Pet Shop",dummyobj,dummyobj,_petShop,_petShop,true],
[resourcesell2,"Sell Resources",dummyobj,dummyobj,_rs,_rs,true],
[Oil_2,"Mining equipment",dummyobj,dummyobj,_ms,_ms,true],
[southsupermarket,"Gun Shop",gunbox2,dummyobj,_gs,_gs,true]
];
