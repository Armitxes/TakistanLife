_weaponfactory = [
	"M9_Civ", "Rnd_9x19_M9",
	"glock17_EP1","Rnd_9x19_glock17",
	"Makarov","Rnd_9x18_Makarov",
	"Colt1911", "Rnd_45ACP_1911",
	"revolver_EP1", "Rnd_45ACP",
	"LeeEnfield","x_303",
	"Saiga12K","8Rnd_B_Saiga12_Pellets",
	"M8_compact","Rnd_556x45_G36",
	"m8_carbine",
	"MakarovSD","8Rnd_9x18_MakarovSD",
	"Huntingrifle","x_22_LR_17_HMR",
	"AKS_74_UN_Kobra","30Rnd_545x39_AKSD",
	"AKS_GOLD","Rnd_762x39_AK47",
	"G36_C_SD_Camo","30Rnd_556x45_G36SD",
	"SCAR_L_CQC_Holo","30Rnd_556x45_Stanag",
	"M8_HOLO_SD","M4A1_AIM_SD_CAMO","30Rnd_556x45_StanagSD",
	"RPK_74","75Rnd_545x39_RPK",
	"VSS_Vintorez","10Rnd_9x39_SP5_VSS"
];

_terrorfactoryitems = [
	"Binocular",
	"NVGoggles",
	"Binocular_Vector",
	"GPS",
	"lockpick",
	"medikit",
	"M9",
	"Rnd_9x19_M9",
	"Colt1911",
	"Rnd_45ACP_1911",
	"AK74",
	"AK74GL",
	"AKS74U",
	"AKS_GOLD",
	"AKS74pso",
	"30Rnd_545x39_AK",
	"30Rnd_762x39_AK47",
	"1Rnd_HE_GP25",
	"SVD",
	"10Rnd_762x54_SVD",
	"RPG7V",
	"PG7VR",
	"MAAWS",
	"MAAWS_HEAT",
	"MAAWS_HEDP",
	"HandGrenade_East",
	"PipeBomb"
];

_terrorfactory= [
	"Pickup_PK_INS",
	"Offroad_DSHKM_INS",
	"Offroad_SPG9_Gue",
	"BRDM2_TK_GUE_EP1",
	"Ural_ZU23_TK_GUE_EP1",
	"BTR40_MG_TK_INS_EP1",
	"UH1H_TK_EP1"
];

_vehiclefactory= [
	"Old_bike_TK_CIV_EP1",
	"Old_moto_TK_Civ_EP1",
	"TT650_TK_CIV_EP1",
	"ATV_CZ_EP1",
	"Volha_1_TK_CIV_EP1",
	"Volha_2_TK_CIV_EP1",
	"SkodaBlue",
	"Lada1_TK_CIV_EP1",
	"Lada2_TK_CIV_EP1",
	"UAZ_Unarmed_TK_CIV_EP1",
	"S1203_TK_CIV_EP1",
	"hilux1_civil_3_open_EP1",
	"LandRover_TK_CIV_EP1",
	"Ural_TK_CIV_EP1",
	"Kamaz",
	"KamazOpen",
	"V3S_Open_TK_CIV_EP1",
	"V3S_Repair_TK_GUE_EP1",
	"V3S_Refuel_TK_GUE_EP1",
	"V3S_TK_EP1",
	"Ikarus_TK_CIV_EP1",
	"TowingTractor",
	"AH6X_EP1",
	"An2_1_TK_CIV_EP1",
	"C130J_US_EP1",
	"Mi17_Civilian"
];

_itemfactory= [
	"Binocular",
	"NVGoggles",
	"GPS",
	"handy",
	"reparaturkit",
	"kanister",
	"lockpick",
	"medikit",
	"lighter",
	"fishingpole",
	"JackHammer",
	"supgrade"
];

_tairfactory = [
	"UH1H_TK_EP1",
	"Mi17_TK_EP1",
	"Pickup_PK_TK_GUE_EP1",
	"UAZ_MG_TK_EP1",
	"Offroad_DSHKM_TK_GUE_EP1",
	"BTR40_MG_TK_INS_EP1",
	"Ural_ZU23_TK_GUE_EP1",
	"BRDM2_TK_GUE_EP1",
	"T55_TK_GUE_EP1",
	"BMP2_TK_EP1",
	"An2_2_TK_CIV_EP1"
];

_alcoholfactory = ["beer","beer2","vodka","smirnoff","wiskey","wine","wine2"];

vehiclequeue  	= [];
tvehiclequeue 	= [];
weaponqueue 	= [];
itemqueue 	= [];
avehiclequeue	= [];
tavehiclequeue	= [];
alcoholfactoryqueue  = [];
terrorfactoryitemsqueue = [];
diamondqueue = [];

INV_Lizenzen = [
	["adminlicense",[adminbank,adminbank,adminbank],"Admin",0],
	["car",[atm4,atm1,adminbank],localize "STRS_license_car",100],
	["truck",[atm4,atm1,adminbank],localize "STRS_license_truck",1400],
	["air",[atm4,atm1,adminbank],localize "STRS_license_air",15000],
	["Pistollicense",[gunlicsouth,licenseflag2,adminbank],"Pistol License",10000],
	["Riflelicense",[gunlicsouth,licenseflag2,adminbank],"Rifle License",20000],
	["automatic",[gunlicsouth,adminbank,licenseflag2,adminbank],"Automatic Rifle License",50000],
	["engineer",[atm4,atm1,memshop,memshop],"Engineer Training",750],
	["bomb",[adminbank,atm12,objnull],"Terrorist License",100000],
	["probator",[adminbank,copbank,copbank],localize "STRS_license_probator",100],
	["patrol_training",[adminbank,copbank,copbank],localize "STRS_license_coppatrol",2000],
	["response_training",[adminbank,copbank,copbank],"Advanced Officer Training",10000],
	["SCO_training",[adminbank,copswat,copswat],"SCO19 Training",12500],
	["copAir",[adminbank,copbank,copbank],"Air Support Training",13000],
	["passport_civilian",[passseller,passseller3,objNull],"Passport",100],
	["southgov",[objNull,objNull,objNull], "South Government License",60000],
	["PMClicense",[adminbank,pmcshop,pmcshop], "PMC License",5000]
];

INV_ItemFabriken = [
	[vehiclefactory,"factory1","Vehicle Factory",dummyobj,vfacspawn,_vehiclefactory,20000,"Fabrikablage1", "vehiclequeue"],
	[ItemFabrik_1,"factory3","General Factory",igunbox,dummyobj,_itemfactory,10000,"Fabrikablage3", "itemqueue"],
	[weaponfactory,"factory4","Weapon Factory",wfgunbox,dummyobj,_weaponfactory,100000,"Fabrikablage4", "weaponqueue"],
	[alcoholfactory,"factory7","Alcohol Factory",dummyobj,dummyobj,_alcoholfactory,1000,"Fabrikablage7", "alcoholfactoryqueue"]
];

INV_FarmItemArray = [
	[[["fishingwhale",400]],"Whale",2,1,["Ship"]],
	[[["fishingbass",400]],"bass",7,4,["Ship"]],
	[[["fishingblowfish",200]],"blowfish",15,8,["Ship"]],
	[[["fishingherring",200]],"herring",15,8,["Ship"]],
	[[["fishingmackerel",200]],"mackerel",15,8,["Ship"]],
	[[["cocafield",30]],"Unprocessed_cocaine",20,9,["Man"]],
	[[["marifield",30]],"Unprocessed_Cannabis",20,9,["Man"]],
	[[["lsdfield",30]],"Unprocessed_lsd",20,9,["Man"]],
	[[["heroinfield",30]],"Unprocessed_heroin",20,9,["Man"]],
	[[["quarry1",150]],"sand",20,10,["truck"]],
	[[["quarry2",150]],"sand",20,10,["truck"]],
	[[["quarry3",150]],"sand",20,10,["truck"]]
];

Miningarray = [
	[["OilArea1",15],"Oil",12],
	[["OilArea2",15],"Oil",12],
	[["OilArea3",15],"Oil",12],
	[["IronArea",15],"iron",12],
	[["CopperArea",15],"copper",12],
	[["GlassArea",30],"glass",12],
	[["GoldArea",15],"Gold",12],
	[["DiamondArea",15],"Diamond rock",15],
	[["SilverArea",15],"Silver",15],
	[["RubiesArea",15],"Rubies",15],
	[["PlatinumArea",15],"Platinum",10],
	[["SiliconArea",30],"silicon",12],
	[["BlackPowderArea",30],"black powder",12],
	[["WoodArea",30],"wood",12]
];

fishingarray = [
	[["bassarea",30], "bass",12],
	[["percharea",30], "perch",12],
	[["walleyearea",30], "walleye",12],
	[["troutarea",30], "trout",12]
];
