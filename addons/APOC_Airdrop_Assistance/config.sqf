//Configuration for Airdrop Assistance
//Author: Apoc

//APOC_AA_coolDownTime = 1; //Debug seconds
APOC_AA_coolDownTime = 180; //Expressed in sec. 1800 = 30 minutes

APOC_AA_VehOptions =
[ // ["Menu Text",		ItemClassname,				Price,	"Drop Type"]
["Quadbike (Civilian)", "C_Quadbike_01_F", 			1000, 	 "vehicle"],
["MH-9 Hummingbird",	"B_Heli_Light_01_F", 		15000,	 "vehicle"],
["Strider HMG", 		"I_MRAP_03_hmg_F", 			25000, 	 "vehicle"],
["MSE-3 Marid", 		"O_APC_Wheeled_02_rcws_F", 	30000,  "vehicle"],
["MBT-52 Kuma", 		"I_MBT_03_cannon_F", 		60000,  "vehicle"]
];

APOC_AA_SupOptions =
[// ["stringItemName", 	"Crate Type for fn_refillBox 	,Price," drop type"]
["Assault Rifles", 		"mission_USSpecial", 			4000, "supply"],
["DLC Rifles", 			"airdrop_DLC_Rifles", 			4500, "supply"],
["DLC LMGs", 			"airdrop_DLC_LMGs", 			5000, "supply"],
["Sniper Rifles", 		"airdrop_Snipers", 				10000, "supply"],
["Launchers", 			"mission_USLaunchers", 			6000, "supply"],

//"Menu Text",			"Crate Type", 			"Cost", "drop type"
["Food",				"Land_Sacks_goods_F",	1000, 	"picnic"],
["Water",				"Land_BarrelWater_F",	1000, 	"picnic"]
];
