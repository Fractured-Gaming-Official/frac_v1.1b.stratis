// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow, AgentRev
# @@Create Date: 2013-09-16 20:40:58
# @@Edited by: Mokey & Huskey622 
# THIS FILE IS NOT THE ORIGINAL
#*********************************************************/

// This tracks which store owner the client is interacting with
currentOwnerName = "";

// Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost

pistolArray = compileFinal str
[
	// Handguns
	["P07 Pistol", "hgun_P07_F", 100],
	["Rook-40 Pistol", "hgun_Rook40_F", 100],
	["ACP-C2 Pistol", "hgun_ACPC2_F", 150],
	["Zubr Revolver", "hgun_Pistol_heavy_02_F", 150],
	["4-Five Pistol", "hgun_Pistol_heavy_01_F", 200]
];

smgArray = compileFinal str
[
	["PDW2000 SMG", "hgun_PDW2000_F", 350],
	["Sting SMG", "SMG_02_F", 325],
	["Vermin SMG", "SMG_01_F", 450]
];

rifleArray = compileFinal str
[
	// Underwater Gun
	["SDAR Underwater Rifle", "arifle_SDAR_F", 300],

	// Assault Rifles
	["Mk20 Carbine", "arifle_Mk20C_plain_F", 450],
	["Mk20 Carbine (Camo)", "arifle_Mk20C_F", 450],
	["Mk20 Rifle", "arifle_Mk20_plain_F", 600],
	["Mk20 Rifle (Camo)", "arifle_Mk20_F", 600],
	["Mk20 EGLM Rifle", "arifle_Mk20_GL_plain_F", 750],
	["Mk20 EGLM Rifle (Camo)", "arifle_Mk20_GL_F", 750],
	["TRG-20 Carbine", "arifle_TRG20_F", 450],
	["TRG-21 Rifle ", "arifle_TRG21_F", 600],
	["TRG-21 EGLM Rifle", "arifle_TRG21_GL_F", 750],

	["Katiba Carbine", "arifle_Katiba_C_F", 450],
	["Katiba Rifle", "arifle_Katiba_F", 600],
	["Katiba GL Rifle", "arifle_Katiba_GL_F", 750],

	["MX Carbine", "arifle_MXC_F", 450],
	["MX Carbine (Black)", "arifle_MXC_Black_F", 525],
	["MX Rifle", "arifle_MX_F", 600],
	["MX Rifle (Black)", "arifle_MX_Black_F", 675],
	["MX 3GL Rifle", "arifle_MX_GL_F", 750],
	["MX 3GL Rifle (Black)", "arifle_MX_GL_Black_F", 825],

	// Markman Rifles
	["MXM Rifle", "arifle_MXM_F", 600],
	["MXM Rifle (Black)", "arifle_MXM_Black_F", 650],
	["DMR Rifle", "srifle_DMR_01_F", 725],
	["Mk14 7.62 mm (Camo)", "srifle_DMR_06_camo_F", 900], // DLC Sniper Rifle
	["Mk14 7.62 mm (Olive)", "srifle_DMR_06_olive_F", 900], // DLC Sniper Rifle
	["Mk18 ABR Rifle", "srifle_EBR_F", 900],
	["Mk-1 EMR 7.62 mm (Camo)", "srifle_DMR_03_multicam_F", 1000], // DLC Sniper Rifle
	["Mk-1 EMR 7.62 mm (Khaki)", "srifle_DMR_03_khaki_F", 1000], // DLC Sniper Rifle
	["Mk-1 EMR 7.62 mm (Sand)", "srifle_DMR_03_tan_F", 1000], // DLC Sniper Rifle
	["Mk-1 EMR 7.62 mm (Woodland)", "srifle_DMR_03_woodland_F", 1000], // DLC Sniper Rifle
	["Mk-1 EMR 7.62 mm (Black)", "srifle_DMR_03_F", 1000], // DLC Sniper Rifle
	
	// Sniper Rifles
	["MAR-10 .338 (Black)", "srifle_DMR_02_F", 1500], // DLC Sniper Rifle
	["MAR-10 .338 (Camo)", "srifle_DMR_02_camo_F", 1500], // DLC Sniper Rifle
	["MAR-10 .338 (Sand)", "srifle_DMR_02_sniper_F", 1500], // DLC Sniper Rifle
	["M320 LRR Sniper", "srifle_LRR_LRPS_F", 1400],
	["M320 LRR Sniper (Camo)", "srifle_LRR_camo_LRPS_F", 1450],
	["Cyrus 9.3 mm (Black)", "srifle_DMR_05_blk_F", 1600], // DLC Sniper Rifle
	["Cyrus 9.3 mm (Hex)", "srifle_DMR_05_hex_F", 1600], // DLC Sniper Rifle
	["Cyrus 9.3 mm (Tan)", "srifle_DMR_05_tan_f", 1600], // DLC Sniper Rifle
	["ASP-1 Kir 12.7 mm (Black)", "srifle_DMR_04_F", 1300], // DLC Sniper Rifle
	["ASP-1 Kir 12.7 mm (Tan)", "srifle_DMR_04_Tan_F", 1300], // DLC Sniper Rifle
	["GM6 Lynx Sniper", "srifle_GM6_LRPS_F", 1800],
	["GM6 Lynx Sniper (Camo)", "srifle_GM6_camo_LRPS_F", 1800]
];

lmgArray = compileFinal str
[
	["MX SW LMG", "arifle_MX_SW_F", 600],
	["MX SW LMG (Black)", "arifle_MX_SW_Black_F", 650],
	["Mk200 LMG", "LMG_Mk200_F", 725],
	["Zafir LMG", "LMG_Zafir_F", 900],
	
	//DLC LMG
	["SPMG .338 (Black)", "MMG_02_black_F", 1000],
	["SPMG .338 (MTP)", "MMG_02_camo_F", 1000],
	["SPMG .338 (Sand)", "MMG_02_sand_F", 1000],
	["Navid 9.3 mm (Hex)", "MMG_01_hex_F", 900],
	["Navid 9.3 mm (Tan)", "MMG_01_tan_F", 900]
];

launcherArray = compileFinal str
[
	["RPG-42 Alamut", "launch_RPG32_F", 750],
	["PCML", "launch_NLAW_F", 1500],
	["Titan MPRL Compact (Tan)", "launch_Titan_short_F", 3000],
	["Titan MPRL Compact (Brown)", "launch_O_Titan_short_F", 3000],
	["Titan MPRL Compact (Olive)", "launch_I_Titan_short_F", 3000],
	["Titan MPRL AA (Desert)", "launch_Titan_F", 3000],
	["Titan MPRL AA (Hex)", "launch_O_Titan_F", 3000],
	["Titan MPRL AA (Digi)", "launch_I_Titan_F", 3000]
];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call launcherArray);

staticGunsArray = compileFinal str
[
	// ["Vehicle Ammo Crate", "Box_NATO_AmmoVeh_F", 2500],
	["Static Titan AT 4Rnd (NATO)", "B_static_AT_F", 2500], // Static launchers only have 4 ammo, hence the low price
	["Static Titan AT 4Rnd (CSAT)", "O_static_AT_F", 2500],
	["Static Titan AT 4Rnd (AAF)", "I_static_AT_F", 2500],
	["Static Titan AA 4Rnd (NATO)", "B_static_AA_F", 3000],
	["Static Titan AA 4Rnd (CSAT)", "O_static_AA_F", 3000],
	["Static Titan AA 4Rnd (AAF)", "I_static_AA_F", 3000],
	["Mk30 HMG .50 Low tripod (NATO)", "B_HMG_01_F", 2000],
	["Mk30 HMG .50 Low tripod (CSAT)", "O_HMG_01_F", 2000],
	["Mk30 HMG .50 Low tripod (AAF)", "I_HMG_01_F", 2000],
	// ["Mk30A HMG .50 Sentry (NATO)", "B_HMG_01_A_F", 5000], // "A" = Autonomous = Overpowered
	// ["Mk30A HMG .50 Sentry (CSAT)", "O_HMG_01_A_F", 5000],
	// ["Mk30A HMG .50 Sentry (AAF)", "I_HMG_01_A_F", 5000],
	["Mk30 HMG .50 High tripod (NATO)", "B_HMG_01_high_F", 2550],
	["Mk30 HMG .50 High tripod (CSAT)", "O_HMG_01_high_F", 2550],
	["Mk30 HMG .50 High tripod (AAF)", "I_HMG_01_high_F", 2550],
	["Mk32 GMG 20mm Low tripod (NATO)", "B_GMG_01_F", 5000],
	["Mk32 GMG 20mm Low tripod (CSAT)", "O_GMG_01_F", 5000],
	["Mk32 GMG 20mm Low tripod (AAF)", "I_GMG_01_F", 5000],
	// ["Mk32A GMG 20mm Sentry (NATO)", "B_GMG_01_A_F", 10000],
	// ["Mk32A GMG 20mm Sentry (CSAT)", "O_GMG_01_A_F", 10000],
	// ["Mk32A GMG 20mm Sentry (AAF)", "I_GMG_01_A_F", 10000],
	["Mk32 GMG 20mm High tripod (NATO)", "B_GMG_01_high_F", 2000],
	["Mk32 GMG 20mm High tripod (CSAT)", "O_GMG_01_high_F", 2000],
	["Mk32 GMG 20mm High tripod (AAF)", "I_GMG_01_high_F", 2000]/*,
	["Mk6 Mortar (NATO)", "B_Mortar_01_F", 50000],
	["Mk6 Mortar (CSAT)", "O_Mortar_01_F", 50000],
	["Mk6 Mortar (AAF)", "I_Mortar_01_F", 50000]*/
];

throwputArray = compileFinal str
[
	["Toxic Gas Grenade", "SmokeShellYellow", 750],
	["Mini Grenade", "MiniGrenade", 250],
	["Frag Grenade", "HandGrenade", 400],
	["APERS Tripwire Mine", "APERSTripMine_Wire_Mag", 300],
	["APERS Bounding Mine", "APERSBoundingMine_Range_Mag", 350],
	["APERS Mine", "APERSMine_Range_Mag", 500],
	["Claymore Charge", "ClaymoreDirectionalMine_Remote_Mag", 450],
	["M6 SLAM Mine", "SLAMDirectionalMine_Wire_Mag", 550],
	["AT Mine", "ATMine_Range_Mag", 600],
	["Explosive Charge", "DemoCharge_Remote_Mag", 600],
	["Explosive Satchel", "SatchelCharge_Remote_Mag", 700],
	["Smoke Grenade (White)", "SmokeShell", 50],
	["Smoke Grenade (Green)", "SmokeShellGreen", 50],
	["Smoke Grenade (Purple)", "SmokeShellPurple", 50],
	["Smoke Grenade (Blue)", "SmokeShellBlue", 50],
	["Smoke Grenade (Orange)", "SmokeShellOrange", 50],
	["Smoke Grenade (Red)", "SmokeShellRed", 50]
];

//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = compileFinal str
[
	["9mm 16Rnd Mag", "16Rnd_9x21_Mag", 20],
	["9mm 30Rnd Mag", "30Rnd_9x21_Mag", 30],
	[".45 ACP 6Rnd Cylinder", "6Rnd_45ACP_Cylinder", 10],
	[".45 ACP 9Rnd Mag", "9Rnd_45ACP_Mag", 20],
	[".45 ACP 11Rnd Mag", "11Rnd_45ACP_Mag", 30],
	[".45 ACP 30Rnd Vermin Mag", "30Rnd_45ACP_MAG_SMG_01", 40],
	[".45 ACP 30Rnd Tracer (Green) Mag", "30Rnd_45ACP_Mag_SMG_01_tracer_green", 30],
	["5.56mm 20Rnd Underwater Mag", "20Rnd_556x45_UW_mag", 20],
	["5.56mm 30Rnd STANAG Mag", "30Rnd_556x45_Stanag", 40],
	["5.56mm 30Rnd Tracer (Green) Mag", "30Rnd_556x45_Stanag_Tracer_Green", 30],
	["5.56mm 30Rnd Tracer (Yellow) Mag", "30Rnd_556x45_Stanag_Tracer_Yellow", 30],
	["5.56mm 30Rnd Tracer (Red) Mag", "30Rnd_556x45_Stanag_Tracer_Red", 30],
	["6.5mm 30Rnd STANAG Mag", "30Rnd_65x39_caseless_mag", 40],
	["6.5mm 30Rnd Tracer (Red) Mag", "30Rnd_65x39_caseless_mag_Tracer", 30],
	["6.5mm 30Rnd Caseless Mag", "30Rnd_65x39_caseless_green", 40],
	["6.5mm 30Rnd Tracer (Green) Mag", "30Rnd_65x39_caseless_green_mag_Tracer", 30],
	["6.5mm 100Rnd Belt Case", "100Rnd_65x39_caseless_mag", 125],
	["6.5mm 100Rnd Tracer (Red) Belt Case", "100Rnd_65x39_caseless_mag_Tracer", 100],
	["6.5mm 200Rnd Belt Case", "200Rnd_65x39_cased_Box", 250],
	["6.5mm 200Rnd Tracer (Yellow) Belt Case", "200Rnd_65x39_cased_Box_Tracer", 225],
	//["7.62mm 10Rnd Mag", "10Rnd_762x51_Mag", 15],
	["7.62mm 10Rnd Mag", "10Rnd_762x54_Mag", 30],
	["7.62mm 20Rnd Mag", "20Rnd_762x51_Mag", 50],
	//["7.62mm 150Rnd Box", "150Rnd_762x51_Box", 150],
	//["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x51_Box_Tracer", 125],
	["7.62mm 150Rnd Box", "150Rnd_762x54_Box", 300],
	["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x54_Box_Tracer", 250],
	[".338 LM 10Rnd Mag", "10Rnd_338_Mag", 100],
	[".338 NM 130Rnd Belt", "130Rnd_338_Mag", 300],
	["9.3mm 10Rnd Mag", "10Rnd_93x64_DMR_05_Mag", 100],
	["9.3mm 150Rnd Belt", "150Rnd_93x64_Mag", 300],
	[".408 7Rnd Cheetah Mag", "7Rnd_408_Mag", 100],
	["12.7mm 5Rnd Mag", "5Rnd_127x108_Mag", 100],
	["12.7mm 5Rnd Armor-Piercing Mag", "5Rnd_127x108_APDS_Mag", 125],
	["12.7mm 10Rnd Subsonic Mag", "10Rnd_127x54_Mag", 125],
	["RPG-42 Anti-Tank Rocket", "RPG32_F", 250],              // Direct damage: high      | Splash damage: low    | Guidance: none
	["RPG-42 High-Explosive Rocket", "RPG32_HE_F", 250],      // Direct damage: medium    | Splash damage: medium | Guidance: none
	["PCML Anti-Tank Missile", "NLAW_F", 400],                // Direct damage: very high | Splash damage: low    | Guidance: laser, ground vehicles
	["Titan Anti-Tank Missile", "Titan_AT", 350],             // Direct damage: high      | Splash damage: low    | Guidance: mouse, laser, ground vehicles
	["Titan Anti-Personnel Missile", "Titan_AP", 350],        // Direct damage: low       | Splash damage: high   | Guidance: mouse, laser
	["Titan Anti-Air Missile", "Titan_AA", 350],              // Direct damage: low       | Splash damage: medium | Guidance: aircraft
	["40mm Toxic Gas Grenade", "1Rnd_SmokeYellow_Grenade_shell", 850],
	["40mm HE Grenade Round", "1Rnd_HE_Grenade_shell", 125],
	["40mm 3Rnd HE Grenades", "3Rnd_HE_Grenade_shell", 250],
	["40mm Smoke Round (White)", "1Rnd_Smoke_Grenade_shell", 50],
	["40mm Smoke Round (Purple)", "1Rnd_SmokePurple_Grenade_shell", 50],
	["40mm Smoke Round (Blue)", "1Rnd_SmokeBlue_Grenade_shell", 50],
	["40mm Smoke Round (Green)", "1Rnd_SmokeGreen_Grenade_shell", 50],
	["40mm Smoke Round (Orange)", "1Rnd_SmokeOrange_Grenade_shell", 50],
	["40mm Smoke Round (Red)", "1Rnd_SmokeRed_Grenade_shell", 50],
	["40mm 3Rnd Smokes (White)", "3Rnd_Smoke_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Purple)", "3Rnd_SmokePurple_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Blue)", "3Rnd_SmokeBlue_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Green)", "3Rnd_SmokeGreen_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Yellow)", "3Rnd_SmokeYellow_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Orange)", "3Rnd_SmokeOrange_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Red)", "3Rnd_SmokeRed_Grenade_shell", 100],
	["40mm Flare Round (White)", "UGL_FlareWhite_F", 25],
	["40mm Flare Round (Green)", "UGL_FlareGreen_F", 25],
	["40mm Flare Round (Yellow)", "UGL_FlareYellow_F", 25],
	["40mm Flare Round (Red)", "UGL_FlareRed_F", 25],
	["40mm Flare Round (IR)", "UGL_FlareCIR_F", 25],
	["40mm 3Rnd Flares (White)", "3Rnd_UGL_FlareWhite_F", 50],
	["40mm 3Rnd Flares (Green)", "3Rnd_UGL_FlareGreen_F", 50],
	["40mm 3Rnd Flares (Yellow)", "3Rnd_UGL_FlareYellow_F", 50],
	["40mm 3Rnd Flares (Red)", "3Rnd_UGL_FlareRed_F", 50],
	["40mm 3Rnd Flares (IR)", "3Rnd_UGL_FlareCIR_F", 50]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
	["Suppressor 9mm", "muzzle_snds_L", 100, "item"],
	["Suppressor .45 ACP", "muzzle_snds_acp", 150, "item"],
	["Suppressor 5.56mm", "muzzle_snds_M", 200, "item"],
	["Suppressor 6.5mm", "muzzle_snds_H", 200, "item"],
	["Suppressor 6.5mm LMG", "muzzle_snds_H_MG", 250, "item"],
	["Suppressor 7.62mm", "muzzle_snds_B", 250, "item"],
	["Suppressor .338 Black", "muzzle_snds_338_black", 300, "item"], // DLC Item
	["Suppressor .338 Green", "muzzle_snds_338_green", 300, "item"], // DLC Item
	["Suppressor .338 Sand", "muzzle_snds_338_sand", 350, "item"], // DLC Item
	["Suppressor 9.3mm Black", "muzzle_snds_93mmg", 350, "item"], // DLC Item
	["Suppressor 9.3mm Tan", "muzzle_snds_93mmg_tan", 350, "item"], // DLC Item
	["Bipod (Black) (NATO)", "bipod_01_F_blk", 500, "item"], // DLC Item
	["Bipod (Black) (CSAT)", "bipod_02_F_blk", 500, "item"], // DLC Item
	["Bipod (Black) (AAF)", "bipod_03_F_blk", 500, "item"], // DLC Item
	["Bipod (MTP) (NATO)", "bipod_01_F_mtp", 500, "item"], // DLC Item
	["Bipod (Hex) (CSAT)", "bipod_02_F_hex", 500, "item"], // DLC Item
	["Bipod (Olive) (AAF)", "bipod_03_F_oli", 500, "item"], // DLC Item
	["Bipod (Sand) (NATO)", "bipod_01_F_snd", 500, "item"], // DLC Item
	["Bipod (Tan) (CSAT)", "bipod_02_F_tan", 500, "item"], // DLC Item 
	["Flashlight", "acc_flashlight", 50, "item"],
	["IR Laser Pointer", "acc_pointer_IR", 50, "item"],
	["Yorris Sight (Zubr Revolver)", "optic_Yorris", 100, "item"],
	["MRD Sight (4-Five Pistol)", "optic_MRD", 100, "item"],
	["ACO (CQB)", "optic_aco_smg", 100, "item"],
	["Holosight (CQB)", "optic_Holosight_smg", 100, "item"],
	["ACO (Red)", "optic_Aco", 150, "item"],
	["ACO (Green)", "optic_Aco_grn", 150, "item"],
	["Holosight", "optic_Holosight", 175, "item"],
	["MRCO", "optic_MRCO", 200, "item"],
	["ARCO", "optic_Arco", 250, "item"],
	["RCO", "optic_Hamr", 300, "item"],
	["DMS", "optic_DMS", 350, "item"],
	["MOS", "optic_SOS", 400, "item"],
	["AMS (Black)", "optic_AMS", 600, "item"], // DLC Item
	["AMS (Khaki)", "optic_AMS_khk", 600, "item"], // DLC Item
	["AMS (Sand)", "optic_AMS_snd", 600, "item"], // DLC Item
	["Kahlia (Black)", "optic_KHS_blk", 800, "item"], // DLC Item
	["Kahlia (Hex)", "optic_KHS_hex", 800, "item"], // DLC Item
	["Kahlia (Old)", "optic_KHS_old", 800, "item"], // DLC Item
	["Kahlia (Tan)", "optic_KHS_tan", 600, "item"], // DLC Item
	["LRPS", "optic_LRPS", 1000, "item"],
	["NVS", "optic_NVS", 2500, "item"]
	//["TWS", "optic_tws", 20000, "item"],
	//["TWS MG", "optic_tws_mg", 20000, "item"],
	//["Nightstalker", "optic_Nightstalker", 30000, "item"]
];

// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
	["Gas Mask (NATO)", "H_CrewHelmetHeli_B", 1000, "hat"],
	["Gas Mask (CSAT)", "H_CrewHelmetHeli_O", 1000, "hat"],
	["Gas Mask (AAF)", "H_CrewHelmetHeli_I", 1000, "hat"],
	["ECH", "H_HelmetB", 100, "hat"],
	["ECH (Ghillie)", "H_HelmetB_camo", 100, "hat"],
	["ECH (Light)", "H_HelmetB_light", 100, "hat"],
	["ECH (Spraypaint)", "H_HelmetB_paint", 100, "hat"],
	["SF Helmet", "H_HelmetSpecB", 100, "hat"],
	["SF Helmet (Black)", "H_HelmetSpecB_blk", 100, "hat"],
	["SF Helmet (Light Paint)", "H_HelmetSpecB_paint1", 100, "hat"],
	["SF Helmet (Dark Paint)", "H_HelmetSpecB_paint2", 100, "hat"],
	["Combat Helmet (Black)", "H_HelmetB_plain_blk", 100, "hat"],
	["Protector Helmet (Hex)", "H_HelmetO_ocamo", 100, "hat"],
	["Protector Helmet (Urban)", "H_HelmetO_oucamo", 100, "hat"],
	["Defender Helmet (Hex)", "H_HelmetLeaderO_ocamo", 100, "hat"],
	["Defender Helmet (Urban)", "H_HelmetLeaderO_oucamo", 100, "hat"],
	["Assassin Helmet (Hex)", "H_HelmetSpecO_ocamo", 100, "hat"],
	["Assassin Helmet (Black)", "H_HelmetSpecO_blk", 100, "hat"],
	["MICH", "H_HelmetIA", 100, "hat"],
	// ["MICH (Camo)", "H_HelmetIA_net", 50, "hat"],
	// ["MICH 2 (Camo)", "H_HelmetIA_camo", 50, "hat"],
	//["Heli Crew Helmet (NATO)", "H_CrewHelmetHeli_B", 50, "hat"],
	["Heli Pilot Helmet (NATO)", "H_PilotHelmetHeli_B", 100, "hat"],
	["Heli Pilot Helmet (CSAT)", "H_PilotHelmetHeli_O", 100, "hat"],
	["Heli Pilot Helmet (AAF)", "H_PilotHelmetHeli_I", 100, "hat"],
	["Crew Helmet (NATO)", "H_HelmetCrew_B", 100, "hat"],
	["Crew Helmet (CSAT)", "H_HelmetCrew_O", 100, "hat"],
	["Crew Helmet (AAF)", "H_HelmetCrew_I", 100, "hat"],
	["Pilot Helmet (NATO)", "H_PilotHelmetFighter_B", 100, "hat"],
	["Pilot Helmet (CSAT)", "H_PilotHelmetFighter_O", 100, "hat"],
	["Pilot Helmet (AAF)", "H_PilotHelmetFighter_I", 100, "hat"],
	["Military Cap (Blue)", "H_MilCap_blue", 50, "hat"],
	["Military Cap (Gray)", "H_MilCap_gry", 50, "hat"],
	["Military Cap (Urban)", "H_MilCap_oucamo", 50, "hat"],
	["Military Cap (Russia)", "H_MilCap_rucamo", 50, "hat"],
	["Military Cap (MTP)", "H_MilCap_mcamo", 50, "hat"],
	["Military Cap (Hex)", "H_MilCap_ocamo", 50, "hat"],
	["Military Cap (AAF)", "H_MilCap_dgtl", 40, "hat"],
	["Rangemaster Cap", "H_Cap_headphones", 40, "hat"],
	["Bandanna (Coyote)", "H_Bandanna_cbr", 20, "hat"],
	["Bandanna (Camo)", "H_Bandanna_camo", 20, "hat"],
	["Bandanna (Gray)", "H_Bandanna_gry", 20, "hat"],
	["Bandanna (Khaki)", "H_Bandanna_khk", 20, "hat"],
	["Bandanna (MTP)", "H_Bandanna_mcamo", 20, "hat"],
	["Bandanna (Sage)", "H_Bandanna_sgg", 20, "hat"],
	["Bandanna (Surfer)", "H_Bandanna_surfer", 20, "hat"],
	// ["Bandanna Mask (Black)", "H_BandMask_blk", 10, "hat"],
	// ["Bandanna Mask (Demon)", "H_BandMask_demon", 10, "hat"],
	// ["Bandanna Mask (Khaki)", "H_BandMask_khk", 10, "hat"],
	// ["Bandanna Mask (Reaper)", "H_BandMask_reaper", 10, "hat"],
	["Beanie (Black)", "H_Watchcap_blk", 20, "hat"],
	["Beanie (Dark blue)", "H_Watchcap_sgg", 20, "hat"],
	["Beanie (Dark brown)", "H_Watchcap_cbr", 20, "hat"],
	["Beanie (Dark khaki)", "H_Watchcap_khk", 20, "hat"],
	["Beanie (Dark green)", "H_Watchcap_camo", 20, "hat"],
	["Beret (Black)", "H_Beret_blk", 20, "hat"],
	["Beret (Colonel)", "H_Beret_Colonel", 20, "hat"],
	["Beret (NATO)", "H_Beret_02", 20, "hat"],
	// ["Beret (Green)", "H_Beret_grn", 10, "hat"],
	// ["Beret (Police)", "H_Beret_blk_POLICE", 10, "hat"],
	// ["Beret (Red)", "H_Beret_red", 10, "hat"],
	// ["Beret (SAS)", "H_Beret_brn_SF", 10, "hat"],
	// ["Beret (SF)", "H_Beret_grn_SF", 10, "hat"],
	// ["Beret (RED)", "H_Beret_ocamo", 10, "hat"],
	// ["Black Turban", "H_TurbanO_blk", 50, "hat"],
	// ["Booniehat (Dirty)", "H_Booniehat_dirty", 10, "hat"],
	// ["Booniehat (Green)", "H_Booniehat_grn", 10, "hat"],
	// ["Booniehat (Khaki)", "H_Booniehat_indp", 10, "hat"],
	["Booniehat (Khaki)", "H_Booniehat_khk", 20, "hat"],
	["Booniehat (Tan)", "H_Booniehat_tan", 20, "hat"],
	["Booniehat (MTP)", "H_Booniehat_mcamo", 20, "hat"],
	["Booniehat (Digi)", "H_Booniehat_dgtl", 20, "hat"],
	["Shemag (white)", "H_ShemagOpen_khk", 20, "hat"],
	["Shemag (Brown)", "H_ShemagOpen_tan", 20, "hat"],
	["Shemag (Khaki)", "H_Shemag_khk", 20, "hat"],
	["Shemag (Olive)", "H_Shemag_olive", 20, "hat"],
	["Fedora (Blue)", "H_Hat_blue", 20, "hat"],
	["Fedora (Brown)", "H_Hat_brown", 20, "hat"],
	["Fedora (Camo)", "H_Hat_camo", 20, "hat"],
	["Fedora (Checker)", "H_Hat_checker", 20, "hat"],
	["Fedora (Gray)", "H_Hat_grey", 20, "hat"],
	["Fedora (Tan)", "H_Hat_tan", 20, "hat"],
	["Cap (Black)", "H_Cap_blk", 20, "hat"],
	["Cap (Blue)", "H_Cap_blu", 20, "hat"],
	["Cap (Green)", "H_Cap_grn", 20, "hat"],
	["Cap (Olive)", "H_Cap_oli", 20, "hat"],
	["Cap (Red)", "H_Cap_red", 20, "hat"],
	["Cap (Tan)", "H_Cap_tan", 20, "hat"],
	["Cap (BI)", "H_Cap_grn_BI", 20, "hat"],
	["Cap (CMMG)", "H_Cap_blk_CMMG", 20, "hat"],
	["Cap (ION)", "H_Cap_blk_ION", 20, "hat"],
	["Cap (Raven Security)", "H_Cap_blk_Raven", 20, "hat"],
	["Cap (SAS)", "H_Cap_khaki_specops_UK", 20, "hat"],
	["Cap (SF)", "H_Cap_tan_specops_US", 20, "hat"],
	["Cap (SPECOPS)", "H_Cap_brn_SPECOPS", 20, "hat"],
	// ["Shemag mask (Tan)", "H_Shemag_tan", 25, "hat"],
	["Racing Helmet (Black)", "H_RacingHelmet_1_black_F", 50, "hat"],
	["Racing Helmet (Blue)", "H_RacingHelmet_1_blue_F", 50, "hat"],
	["Racing Helmet (Green)", "H_RacingHelmet_1_green_F", 50, "hat"],
	["Racing Helmet (Yellow)", "H_RacingHelmet_1_yellow_F", 50, "hat"],
	["Racing Helmet (Orange)", "H_RacingHelmet_1_orange_F", 50, "hat"],
	["Racing Helmet (Red)", "H_RacingHelmet_1_red_F", 50, "hat"],
	["Racing Helmet (White)", "H_RacingHelmet_1_white_F", 50, "hat"],
	["Racing Helmet (Fuel)", "H_RacingHelmet_1_F", 50, "hat"],
	["Racing Helmet (Bluking)", "H_RacingHelmet_2_F", 50, "hat"],
	["Racing Helmet (Redstone)", "H_RacingHelmet_3_F", 50, "hat"],
	["Racing Helmet (Vrana)", "H_RacingHelmet_4_F", 50, "hat"]
];

uniformArray = compileFinal str
[
	["Ghillie Suit (NATO)", "U_B_GhillieSuit", 600, "uni"],
	["Ghillie Suit (CSAT)", "U_O_GhillieSuit", 600, "uni"],
	["Ghillie Suit (AAF)", "U_I_GhillieSuit", 600, "uni"],
	["Wetsuit (NATO)", "U_B_Wetsuit", 400, "uni"],
	["Wetsuit (CSAT)", "U_O_Wetsuit", 400, "uni"],
	["Wetsuit (AAF)", "U_I_Wetsuit", 400, "uni"],
	["Default Uniform (NATO)", "U_B_CombatUniform_mcam", 100, "uni"],
	["Default Uniform (CSAT)", "U_O_CombatUniform_ocamo", 100, "uni"],
	["Default Uniform (AAF)", "U_I_CombatUniform", 100, "uni"],
	["Combat Fatigues (MTP) (Tee)", "U_B_CombatUniform_mcam_tshirt", 100, "uni"],
	["Recon Fatigues (MTP)", "U_B_CombatUniform_mcam_vest", 100, "uni"],
	["Recon Fatigues (Sage)", "U_B_SpecopsUniform_sgg", 100, "uni"],
	["CTRG Combat Uniform (UBACS)", "U_B_CTRG_1", 100, "uni"],
	["CTRG Combat Uniform (UBACS2)", "U_B_CTRG_2", 100, "uni"],
	["CTRG Combat Uniform (Tee)", "U_B_CTRG_3", 100, "uni"],
	["Recon Fatigues (Hex)", "U_O_SpecopsUniform_ocamo", 100, "uni"],
	["Fatigues (Urban)", "U_O_CombatUniform_oucamo", 100, "uni"],
	["Combat Fatigues Short (Digi)", "U_I_CombatUniform_shortsleeve", 100, "uni"],
	["Combat Fatigues Shirt (Digi)", "U_I_CombatUniform_tshirt", 100, "uni"],
	["Officer Fatigues (Hex)", "U_O_OfficerUniform_ocamo", 100, "uni"],
	["Officer Fatigues (Digi)", "U_I_OfficerUniform", 100, "uni"],
	["Pilot Coveralls (NATO)", "U_B_PilotCoveralls", 100, "uni"],
	["Pilot Coveralls (CSAT)", "U_O_PilotCoveralls", 100, "uni"],
	["Pilot Coveralls (AAF)", "U_I_pilotCoveralls", 100, "uni"],
	["Heli Pilot Coveralls (NATO)", "U_B_HeliPilotCoveralls", 100, "uni"],
	["Heli Pilot Coveralls (AAF)", "U_I_HeliPilotCoveralls", 100, "uni"],
	["Guerilla Smocks 1", "U_BG_Guerilla1_1", 50, "uni"], // BLUFOR
	["Guerilla Smocks 2", "U_BG_Guerilla2_1", 50, "uni"],
	["Guerilla Smocks 3", "U_BG_Guerilla2_2", 50, "uni"],
	["Guerilla Smocks 4", "U_BG_Guerilla2_3", 50, "uni"],
	["Guerilla Smocks 5", "U_BG_Guerilla3_1", 50, "uni"],
	["Guerilla Smocks 6", "U_BG_Guerilla3_2", 50, "uni"],
	["Guerilla Smocks 7", "U_BG_leader", 50, "uni"],
	["Guerilla Smocks 1", "U_OG_Guerilla1_1", 50, "uni"], // OPFOR
	["Guerilla Smocks 2", "U_OG_Guerilla2_1", 50, "uni"],
	["Guerilla Smocks 3", "U_OG_Guerilla2_2", 50, "uni"],
	["Guerilla Smocks 4", "U_OG_Guerilla2_3", 50, "uni"],
	["Guerilla Smocks 5", "U_OG_Guerilla3_1", 50, "uni"],
	["Guerilla Smocks 6", "U_OG_Guerilla3_2", 50, "uni"],
	["Guerilla Smocks 7", "U_OG_leader", 50, "uni"],
	["Guerilla Smocks 1", "U_IG_Guerilla1_1", 50, "uni"], // Independent
	["Guerilla Smocks 2", "U_IG_Guerilla2_1", 50, "uni"],
	["Guerilla Smocks 3", "U_IG_Guerilla2_2", 50, "uni"],
	["Guerilla Smocks 4", "U_IG_Guerilla2_3", 50, "uni"],
	["Guerilla Smocks 5", "U_IG_Guerilla3_1", 50, "uni"],
	["Guerilla Smocks 6", "U_IG_Guerilla3_2", 50, "uni"],
	["Guerilla Smocks 7", "U_IG_leader", 50, "uni"],
	/*["Worker Coveralls", "U_C_WorkerCoveralls", 25, "uni"], // can only be worn by civilian units
	["T-Shirt (Blue)", "U_C_Poor_1", 25, "uni"],
	["Polo (Red/white)", "U_C_Poloshirt_redwhite", 25, "uni"],
	["Polo (Salmon)", "U_C_Poloshirt_salmon", 25, "uni"],
	["Polo (Tri-color)", "U_C_Poloshirt_tricolour", 25, "uni"],
	["Polo (Navy)", "U_C_Poloshirt_blue", 25, "uni"],
	["Polo (Burgundy)", "U_C_Poloshirt_burgundy", 25, "uni"],
	["Polo (Blue/green)", "U_C_Poloshirt_stripped", 25, "uni"],*/
	["Polo (Competitor)", "U_Competitor", 50, "uni"],
	["Polo (Rangemaster)", "U_Rangemaster", 50, "uni"],
	/*["Racing Suit (Black)", "U_C_Driver_1_black", 25, "uni"], // can only be worn by civilian units
	["Racing Suit (Blue)", "U_C_Driver_1_blue", 25, "uni"],
	["Racing Suit (Green)", "U_C_Driver_1_green", 25, "uni"],
	["Racing Suit (Yellow)", "U_C_Driver_1_yellow", 25, "uni"],
	["Racing Suit (Orange)", "U_C_Driver_1_orange", 25, "uni"],
	["Racing Suit (Red)", "U_C_Driver_1_red", 25, "uni"],
	["Racing Suit (White)", "U_C_Driver_1_white", 25, "uni"],
	["Racing Suit (Fuel)", "U_C_Driver_1", 25, "uni"],
	["Racing Suit (Bluking)", "U_C_Driver_2", 25, "uni"],
	["Racing Suit (Redstone)", "U_C_Driver_3", 25, "uni"],
	["Racing Suit (Vrana)", "U_C_Driver_4", 25, "uni"],*/
	["Full Ghillie (Arid) (NATO)", "U_B_FullGhillie_ard", 2000, "uni"], //DLC Uniform
	["Full Ghillie (Arid) (CSAT)", "U_O_FullGhillie_ard", 2000, "uni"], //DLC Uniform
	["Full Ghillie (Arid) (AAF)", "U_I_FullGhillie_ard", 2000, "uni"], //DLC Uniform
	["Full Ghillie (Lush) (NATO)", "U_B_FullGhillie_lsh", 2000, "uni"], //DLC Uniform
	["Full Ghillie (Lush) (CSAT)", "U_O_FullGhillie_lsh", 2000, "uni"], //DLC Uniform
	["Full Ghillie (Lush) (AAF)", "U_I_FullGhillie_lsh", 2000, "uni"], //DLC Uniform
	["Full Ghillie (Semi-Arid) (NATO)", "U_B_FullGhillie_sard", 2000, "uni"], //DLC Uniform
	["Full Ghillie (Semi-Arid) (CSAT)", "U_O_FullGhillie_sard", 2000, "uni"], //DLC Uniform
	["Full Ghillie (Semi-Arid) (AAF)", "U_I_FullGhillie_sard", 2000, "uni"] //DLC Uniform
	//["Tron Light Suit (Blue)", "U_B_Protagonist_VR", 5000, "uni"],
	//["Tron Light Suit (Red)", "U_O_Protagonist_VR", 5000, "uni"],
	//["Tron Light Suit (Green)", "U_I_Protagonist_VR", 5000, "uni"]
];

vestArray = compileFinal str
[
	["Rebreather (NATO)", "V_RebreatherB", 200, "vest"],
	["Rebreather (CSAT)", "V_RebreatherIR", 200, "vest"],
	["Rebreather (AAF)", "V_RebreatherIA", 200, "vest"],
	["Carrier Lite (Green)", "V_PlateCarrier1_rgr", -1, "vest"],
	["Carrier Lite (Black)", "V_PlateCarrier1_blk", -1, "vest"],
	["Carrier Rig (Green)", "V_PlateCarrier3_rgr", -1, "vest"],
	["Carrier GL Rig (Green)", "V_PlateCarrierGL_rgr", -1, "vest"],
	//["Carrier GL Rig (Black)", "V_PlateCarrierGL_blk", -1, "vest"], // DLC Vest
	//["Carrier GL Rig (MTP)", "V_PlateCarrierGL_mtp", -1, "vest"], // DLC Vest
	["GA Carrier Lite (Digi)", "V_PlateCarrierIA1_dgtl", -1, "vest"],
	["GA Carrier Rig (Digi)", "V_PlateCarrierIA2_dgtl", -1, "vest"],
	//["GA Carrier GL Rig (Digi)", "V_PlateCarrierIAGL_dgtl", -1, "vest"],
	//["GA Carrier GL Rig (Olive)", "V_PlateCarrierIAGL_oli", -1, "vest"], // DLC Vest
	["LBV Harness", "V_HarnessO_brn", -1, "vest"],
	["LBV Harness (Gray)", "V_HarnessO_gry", -1, "vest"],
	["LBV Grenadier Harness", "V_HarnessOGL_brn", -1, "vest"],
	["LBV Grenadier Harness (Gray)", "V_HarnessOGL_gry", -1, "vest"],
	["ELBV Harness", "V_HarnessOSpec_brn", -1, "vest"],
	["ELBV Harness (Gray)", "V_HarnessOSpec_gry", -1, "vest"],
	["Slash Bandolier (Black)", "V_BandollierB_blk", -1, "vest"],
	["Slash Bandolier (Coyote)", "V_BandollierB_cbr", -1, "vest"],
	["Slash Bandolier (Green)", "V_BandollierB_rgr", -1, "vest"],
	["Slash Bandolier (Khaki)", "V_BandollierB_khk", -1, "vest"],
	["Slash Bandolier (Olive)", "V_BandollierB_oli", -1, "vest"],
	["Chest Rig (Khaki)", "V_Chestrig_khk", -1, "vest"],
	["Chest Rig (Green)", "V_Chestrig_rgr", -1, "vest"],
	["Fighter Chestrig (Black)", "V_Chestrig_blk", -1, "vest"],
	["Fighter Chestrig (Olive)", "V_Chestrig_oli", -1, "vest"],
	["Tactical Vest (Black)", "V_TacVest_blk", -1, "vest"],
	["Tactical Vest (Brown)", "V_TacVest_brn", -1, "vest"],
	["Tactical Vest (Camo)", "V_TacVest_camo", -1, "vest"],
	["Tactical Vest (Khaki)", "V_TacVest_khk", -1, "vest"],
	["Tactical Vest (Olive)", "V_TacVest_oli", -1, "vest"],
	["Tactical Vest (Police)", "V_TacVest_blk_POLICE", -1, "vest"],
	["Tactical Vest (Stavrou)", "V_I_G_resistanceLeader_F", -1, "vest"],
	["Raven Night Vest", "V_TacVestIR_blk", -1, "vest"],
	["CTRG Plate Carrier Rig Mk.1 (Light)", "V_PlateCarrierL_CTRG", -1, "vest"],
	["CTRG Plate Carrier Rig Mk.2 (Heavy)", "V_PlateCarrierH_CTRG", -1, "vest"],
	//["Carrier Special Rig (Green)", "V_PlateCarrierSpec_rgr", -1, "vest"],
	//["Carrier Special Rig (Black)", "V_PlateCarrierSpec_blk", -1, "vest"], // DLC Vest
	//["Carrier Special Rig (MTP)", "V_PlateCarrierSpec_mtp", -1, "vest"], // DLC Vest
	["Press Vest", "V_Press_F", -1, "vest"]
];

backpackArray = compileFinal str
[
	//["Parachute", "B_Parachute", 200, "backpack"],

	["Assault Pack (Black)", "B_AssaultPack_blk", 150, "backpack"],
	["Assault Pack (Green)", "B_AssaultPack_rgr", 150, "backpack"],
	["Assault Pack (MTP)", "B_AssaultPack_mcamo", 150, "backpack"],
	["Assault Pack (Hex)", "B_AssaultPack_ocamo", 150, "backpack"],

	["Field Pack (Black)", "B_FieldPack_blk", 200, "backpack"],
	["Field Pack (Coyote)", "B_FieldPack_cbr", 200, "backpack"],
	["Field Pack (Hex)", "B_FieldPack_ocamo", 200, "backpack"],
	["Field Pack (Khaki)", "B_FieldPack_khk", 200, "backpack"],
	["Field Pack (Olive)", "B_FieldPack_oli", 200, "backpack"],
	["Field Pack (Urban)", "B_FieldPack_oucamo", 200, "backpack"],

	["Kitbag (Coyote)", "B_Kitbag_cbr", 350, "backpack"],
	["Kitbag (Green)", "B_Kitbag_rgr", 350, "backpack"],
	["Kitbag (MTP)", "B_Kitbag_mcamo", 350, "backpack"],
	["Kitbag (Sage)", "B_Kitbag_sgg", 350, "backpack"],

	["Bergen (Black)", "B_Bergen_blk", 350, "backpack"],
	["Bergen (Green)", "B_Bergen_rgr", 350, "backpack"],
	["Bergen (MTP)", "B_Bergen_mcamo", 350, "backpack"],
	["Bergen (Sage)", "B_Bergen_sgg", 350, "backpack"],

	["Carryall (Coyote)", "B_Carryall_cbr", 450, "backpack"],
	["Carryall (Hex)", "B_Carryall_ocamo", 450, "backpack"],
	["Carryall (Khaki)", "B_Carryall_khk", 450, "backpack"],
	["Carryall (MTP)", "B_Carryall_mcamo", 450, "backpack"],
	["Carryall (Olive)", "B_Carryall_oli", 450, "backpack"],
	["Carryall (Urban)", "B_Carryall_oucamo", 450, "backpack"]
];

genItemArray = compileFinal str
[
	["Remote Designator Bag (NATO)", "B_Static_Designator_01_weapon_F", 2000, "backpack"],
	["Remote Designator Bag (CSAT)", "O_Static_Designator_02_weapon_F", 2000, "backpack"],
	["Quadrotor UAV (NATO)", "B_UAV_01_backpack_F", 1500, "backpack"],
	["Quadrotor UAV (CSAT)", "O_UAV_01_backpack_F", 1500, "backpack"],
	["Quadrotor UAV (AAF)", "I_UAV_01_backpack_F", 1500, "backpack"],
	["UAV Terminal (NATO)", "B_UavTerminal", 150, "gps"],
	["UAV Terminal (CSAT)", "O_UavTerminal", 150, "gps"],
	["UAV Terminal (AAF)", "I_UavTerminal", 150, "gps"],
	["GPS", "ItemGPS", 100, "gps"],
	["First Aid Kit", "FirstAidKit", 25, "item"],
	["Medikit", "Medikit", 150, "item"],
	["Toolkit", "ToolKit", 150, "item"],
	["Mine Detector", "MineDetector", 100, "item"],
	["NV Goggles Brown", "NVGoggles", 500, "nvg"],
	["NV Goggles Black", "NVGoggles_OPFOR", 500, "nvg"],
	["NV Goggles Green", "NVGoggles_INDEP", 500, "nvg"],
	["Binoculars", "Binocular", 50, "binoc"],
	["Rangefinder", "Rangefinder", 150, "binoc"],
	["Laser Designator", "Laserdesignator", 1000, "binoc"],
	["Chemlight (Blue)", "Chemlight_blue", 25, "mag"],
	["Chemlight (Green)", "Chemlight_green", 25, "mag"],
	["Chemlight (Yellow)", "Chemlight_yellow", 25, "mag"],
	["Chemlight (Red)", "Chemlight_red", 25, "mag"],
	["Aviator Glasses", "G_Aviator", 25, "gogg"],
	["Diving Goggles", "G_Diving", 100, "gogg"],
	["Balaclava (Black)", "G_Balaclava_blk", 100, "gogg"],
	["Balaclava (Olive)", "G_Balaclava_oli", 100, "gogg"],
	["Balaclava (Combat Goggles)", "G_Balaclava_combat", 100, "gogg"],
	["Balaclava (Low Profile Goggles)", "G_Balaclava_lowprofile", 100, "gogg"],
	["Bandanna (Aviator)", "G_Bandanna_aviator", 100, "gogg"],
	["Bandanna (Beast)", "G_Bandanna_beast", 100, "gogg"],
	["Bandanna (Black)", "G_Bandanna_blk", 100, "gogg"],
	["Bandanna (Khaki)", "G_Bandanna_khk", 100, "gogg"],
	["Bandanna (Olive)", "G_Bandanna_oli", 100, "gogg"],
	["Bandanna (Shades)", "G_Bandanna_shades", 100, "gogg"],
	["Bandanna (Sport)", "G_Bandanna_sport", 100, "gogg"],
	["Bandanna (Tan)", "G_Bandanna_tan", 100, "gogg"],
	["Combat Goggles", "G_Combat", 100, "gogg"],
	["VR Goggles", "G_Goggles_VR", 100, "gogg"],
	["Ladies Shades (ICE)", "G_Lady_Blue", 100, "gogg"],
	["Ladies Shades (Sea)", "G_Lady_Dark", 100, "gogg"],
	["Ladies Shades (Iridium)", "G_Lady_Mirror", 100, "gogg"],
	["Ladies Shades (Fire)", "G_Lady_Red", 100, "gogg"],
	["Low Profile Goggles", "G_Lowprofile", 100, "gogg"],
	["Shades (Black)", "G_Shades_Black", 100, "gogg"],
	["Shades (Blue)", "G_Shades_Blue", 100, "gogg"],
	["Shades (Green)", "G_Shades_Green", 100, "gogg"],
	["Shades (Red)", "G_Shades_Red", 100, "gogg"],
	["Spectacle Glasses", "G_Spectacles", 100, "gogg"],
	["Tinted Spectacles", "G_Spectacles_Tinted", 100, "gogg"],
	["Sport Shades (Vulcan)", "G_Sport_Blackred", 100, "gogg"],
	["Sport Shades (Shadow)", "G_Sport_BlackWhite", 100, "gogg"],
	["Sport Shades (Poison)", "G_Sport_Blackyellow", 100, "gogg"],
	["Sport Shades (Style)", "G_Sport_Checkered", 100, "gogg"],
	["Sport Shades (Yetti)", "G_Sport_Greenblack", 100, "gogg"],
	["Sport Shades (Fire)", "G_Sport_Red", 100, "gogg"],
	["Square Spectacles", "G_Squares", 100, "gogg"],
	["Square Shades", "G_Squares_Tinted", 100, "gogg"],
	["Tactical Shades", "G_Tactical_Black", 100, "gogg"],
	["Tactical Glasses", "G_Tactical_Clear", 100, "gogg"]
];

allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray);

genObjectsArray = compileFinal str
[
	//["Base Re-Locker", "Land_Portable_generator_F", 100000, "object"],  //Cael817, SNAFU,Used for base operations <-- Non destroyable
	//["Base Re-Locker", "Land_Device_assembled_F", 25000, "object"],  //Cael817, SNAFU,Used for base operations <-- Destroyable
	//["Empty Ammo Crate", "Box_NATO_Ammo_F", 200, "ammocrate"],
	//["Metal Barrel", "Land_MetalBarrel_F", 25, "object"],
	//["Toilet Box", "Land_ToiletBox_F", 25, "object"],
	["Lamp Post (Harbour)", "Land_LampHarbour_F", 100, "object"],
	["Lamp Post (Shabby)", "Land_LampShabby_F", 100, "object"],
	["Boom Gate", "Land_BarGate_F", 150, "object"],
	["Pipes", "Land_Pipes_Large_F", 200, "object"],
	["Concrete Frame", "Land_CncShelter_F", 200, "object"],
	["Highway Guardrail", "Land_Crash_barrier_F", 200, "object"],
	["Concrete Barrier", "Land_CncBarrier_F", 200, "object"],
	["Concrete Barrier (Medium)", "Land_CncBarrierMedium_F", 350, "object"],
	["Concrete Barrier (Long)", "Land_CncBarrierMedium4_F", 500, "object"],
	["HBarrier (1 block)", "Land_HBarrier_1_F", 150, "object"],
	["HBarrier (3 blocks)", "Land_HBarrier_3_F", 200, "object"],
	["HBarrier (5 blocks)", "Land_HBarrier_5_F", 250, "object"],
	["HBarrier Big", "Land_HBarrierBig_F", 500, "object"],
	["HBarrier Wall (4 blocks)", "Land_HBarrierWall4_F", 400, "object"],
	["HBarrier Wall (6 blocks)", "Land_HBarrierWall6_F", 500, "object"],
	["HBarrier Watchtower", "Land_HBarrierTower_F", 600, "object"],
	["Concrete Wall", "Land_CncWall1_F", 400, "object"],
	["Concrete Military Wall", "Land_Mil_ConcreteWall_F", 400, "object"],
	["Concrete Wall (Long)", "Land_CncWall4_F", 600, "object"],
	["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 600, "object"],
	//["Shoot House Wall", "Land_Shoot_House_Wall_F", 180, "object"],
	["Canal Wall (Small)", "Land_Canal_WallSmall_10m_F", 400, "object"],
	["Canal Stairs", "Land_Canal_Wall_Stairs_F", 500, "object"],
	["Bag Fence (Corner)", "Land_BagFence_Corner_F", 150, "object"],
	["Bag Fence (End)", "Land_BagFence_End_F", 150, "object"],
	["Bag Fence (Long)", "Land_BagFence_Long_F", 200, "object"],
	["Bag Fence (Round)", "Land_BagFence_Round_F", 150, "object"],
	["Bag Fence (Short)", "Land_BagFence_Short_F", 150, "object"],
	["Bag Bunker (Small)", "Land_BagBunker_Small_F", 250, "object"],
	["Bag Bunker (Large)", "Land_BagBunker_Large_F", 500, "object"],
	["Bag Bunker Tower", "Land_BagBunker_Tower_F", 1000, "object"],
	["Military Cargo Post", "Land_Cargo_Patrol_V1_F", 800, "object"],
	["Military Cargo Tower", "Land_Cargo_Tower_V1_F", 10000, "object"],
	["Military Cargo HQ", "Land_Cargo_HQ_V1_F", 12500, "object"], // Added on player request
	["Concrete Ramp", "Land_RampConcrete_F", 350, "object"],
	["Concrete Ramp (High)", "Land_RampConcreteHigh_F", 500, "object"],
	["Scaffolding", "Land_Scaffolding_F", 250, "object"],
	["Food sacks", "Land_Sacks_goods_F", 5000, "object"], // Added on player request
	["Water Barrel", "Land_BarrelWater_F", 5000, "object"] // Added on player request
];

allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);

//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
	["Kart", "C_Kart_01_F", 1250, "vehicle"],

	["Quadbike (Civilian)", "C_Quadbike_01_F", 100, "vehicle"],
	["Quadbike (NATO)", "B_Quadbike_01_F", 100, "vehicle"],
	["Quadbike (CSAT)", "O_Quadbike_01_F", 100, "vehicle"],
	["Quadbike (AAF)", "I_Quadbike_01_F", 100, "vehicle"],
	["Quadbike (FIA)", "B_G_Quadbike_01_F", 100, "vehicle"],

	["Hatchback", "C_Hatchback_01_F", 200, "vehicle"],
	["Hatchback Sport", "C_Hatchback_01_sport_F", 250, "vehicle"],
	["SUV", "C_SUV_01_F", 200, "vehicle"],
	["Offroad", "C_Offroad_01_F", 250, "vehicle"],
	["Offroad Camo", "B_G_Offroad_01_F", 250, "vehicle"],
	["Offroad Repair", "C_Offroad_01_repair_F", 250, "vehicle"],
	["Offroad HMG", "B_G_Offroad_01_armed_F", 500, "vehicle"],

	["Truck", "C_Van_01_transport_F", 150, "vehicle"],
	["Truck (Camo)", "B_G_Van_01_transport_F", 150, "vehicle"],
	["Truck Box", "C_Van_01_box_F", 200, "vehicle"],
	["Fuel Truck", "C_Van_01_fuel_F", 200, "vehicle"],
	["Fuel Truck (Camo)", "B_G_Van_01_fuel_F", 210, "vehicle"],

	["HEMTT Tractor", "B_Truck_01_mover_F", 250, "vehicle"],
	["HEMTT Box", "B_Truck_01_box_F", 250, "vehicle"],
	["HEMTT Transport", "B_Truck_01_transport_F", 250, "vehicle"],
	["HEMTT Covered", "B_Truck_01_covered_F", 250, "vehicle"],
	["HEMTT Fuel", "B_Truck_01_fuel_F", 9000, "vehicle"],
	["HEMTT Medical", "B_Truck_01_medical_F", 500, "vehicle"],
	["HEMTT Repair", "B_Truck_01_Repair_F", 750, "vehicle"],
	["HEMTT Ammo", "B_Truck_01_ammo_F", 1000, "vehicle"],

	["Tempest Transport", "O_Truck_03_transport_F", 500, "vehicle"],
	["Tempest Covered", "O_Truck_03_covered_F", 550, "vehicle"],
	["Tempest Fuel", "O_Truck_03_fuel_F", 550, "vehicle"],
	["Tempest Medical", "O_Truck_03_medical_F", 1000, "vehicle"],
	["Tempest Repair", "O_Truck_03_repair_F", 12500, "vehicle"],
	["Tempest Ammo", "O_Truck_03_ammo_F", 1500, "vehicle"],
	["Tempest Device", "O_Truck_03_device_F", 2000, "vehicle"],
	
	["Zamak Transport", "I_Truck_02_transport_F", 400, "vehicle"],
	["Zamak Covered", "I_Truck_02_covered_F", 500, "vehicle"],
	["Zamak Fuel", "I_Truck_02_fuel_F", 750, "vehicle"],
	["Zamak Medical", "I_Truck_02_medical_F", 900, "vehicle"],
	["Zamak Repair", "I_Truck_02_box_F", 1000, "vehicle"],
	["Zamak Ammo", "I_Truck_02_ammo_F", 1500, "vehicle"],

	["UGV Stomper (NATO)", "B_UGV_01_F", 2500, "vehicle"],
	["UGV Stomper RCWS (NATO)", "B_UGV_01_rcws_F", 10000, "vehicle"],
	["UGV Stomper (AAF)", "I_UGV_01_F", 2500, "vehicle"],
	["UGV Stomper RCWS (AAF)", "I_UGV_01_rcws_F", 10000, "vehicle"],
	["UGV Saif (CSAT)", "O_UGV_01_F", 2500, "vehicle"],
	["UGV Saif RCWS (CSAT)", "O_UGV_01_rcws_F", 10000, "vehicle"]
];

armoredArray = compileFinal str
[
	["Hunter", "B_MRAP_01_F", 1000, "vehicle"],
	["Hunter HMG", "B_MRAP_01_hmg_F", 5000, "vehicle"],
	["Hunter GMG", "B_MRAP_01_gmg_F", 10000, "vehicle"],
	["Ifrit", "O_MRAP_02_F", 1000, "vehicle"],
	["Ifrit HMG", "O_MRAP_02_hmg_F", 5000, "vehicle"],
	["Ifrit GMG", "O_MRAP_02_gmg_F", 10000, "vehicle"],
	["Strider", "I_MRAP_03_F", 1000, "vehicle"],
	["Strider HMG", "I_MRAP_03_hmg_F", 5000, "vehicle"],
	["Strider GMG", "I_MRAP_03_gmg_F", 12000, "vehicle"],
	["MSE-3 Marid", "O_APC_Wheeled_02_rcws_F", 22500, "vehicle"],
	["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 27500, "vehicle"],
	["AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F", 30000, "vehicle"]
];

tanksArray = compileFinal str
[
	["CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F", 12500, "vehicle"],
	["IFV-6c Panther", "B_APC_Tracked_01_rcws_F", 12000, "vehicle"],
	["FV-720 Mora", "I_APC_tracked_03_cannon_F", 15000, "vehicle"],
	["BTR-K Kamysh", "O_APC_Tracked_02_cannon_F", 15000, "vehicle"],
	["IFV-6a Cheetah AA", "B_APC_Tracked_01_AA_F", 25000, "vehicle"],
	["ZSU-39 Tigris AA", "O_APC_Tracked_02_AA_F", 30000, "vehicle"],
	["M2A1 Slammer", "B_MBT_01_cannon_F", 20000, "vehicle"],
	["M2A4 Slammer HMG", "B_MBT_01_TUSK_F", 25000, "vehicle"], // Commander gun variant
	["T-100 Varsuk", "O_MBT_02_cannon_F", 25000, "vehicle"],
	["MBT-52 Kuma", "I_MBT_03_cannon_F", 35000, "vehicle"]
];


helicoptersArray = compileFinal str
[
	["M-900 Civilian", "C_Heli_Light_01_civil_F", 1000, "vehicle"], // MH-6, no flares
	["MH-9 Hummingbird", "B_Heli_Light_01_F", 1250, "vehicle"], // MH-6
	["PO-30 Orca (Black)", "O_Heli_Light_02_unarmed_F", 1750, "vehicle"], // Ka-60
	["WY-55 Hellcat (Green)", "I_Heli_light_03_unarmed_F", 2000, "vehicle"], // AW159

	["Mi-290 Taru (Crane) [DLC]", "O_Heli_Transport_04_F", 1500, "vehicle"], // CH-54
	["Mi-290 Taru (Box) [DLC]", "O_Heli_Transport_04_box_F", 1750, "vehicle"],
	["Mi-290 Taru (Fuel) [DLC]", "O_Heli_Transport_04_fuel_F", 2000, "vehicle"],
	["Mi-290 Taru (Bench) [DLC]", "O_Heli_Transport_04_bench_F", 1750, "vehicle"],
	["Mi-290 Taru (Transport) [DLC]", "O_Heli_Transport_04_covered_F", 1750, "vehicle"],
	["CH-67 Huron (Black) [DLC]", "B_Heli_Transport_03_unarmed_F", 2000, "vehicle"], // CH-47
	["CH-49 Mohawk", "I_Heli_Transport_02_F", 2000, "vehicle"], // AW101

	["Mi-290 Taru (Medical) [DLC]", "O_Heli_Transport_04_medevac_F",2000, "vehicle"],
	["Mi-290 Taru (Repair) [DLC]", "O_Heli_Transport_04_repair_F", 2000, "vehicle"],
	["Mi-290 Taru (Ammo) [DLC]", "O_Heli_Transport_04_ammo_F", 2000, "vehicle"],
	
	["UH-80 Ghost Hawk (Black)", "B_Heli_Transport_01_F", 7500, "vehicle"], // UH-60 Stealth with 2 side miniguns
	["UH-80 Ghost Hawk (Green)", "B_Heli_Transport_01_camo_F", 7500, "vehicle"], // UH-60 Stealth with 2 side miniguns (green camo)
	["CH-67 Huron (Armed) [DLC]", "B_Heli_Transport_03_F", 7500, "vehicle"], // CH-47 with 2 side miniguns
	["AH-9 Pawnee", "B_Heli_Light_01_armed_F", 20000, "vehicle"], // Armed AH-6
	["PO-30 Orca (Armed, Black)", "O_Heli_Light_02_v2_F", 25000, "vehicle"], // Armed Ka-60 with orca paintjob
	["PO-30 Orca (Armed, Hex)", "O_Heli_Light_02_F", 25000, "vehicle"], // Armed Ka-60
	["WY-55 Hellcat (Armed)", "I_Heli_light_03_F", 30000, "vehicle"] // Armed AW159
	//["AH-99 Blackfoot", "B_Heli_Attack_01_F", 45000, "vehicle"], // RAH-66 with gunner
	//["Mi-48 Kajman (Hex)", "O_Heli_Attack_02_F", 50000, "vehicle"], // Mi-28 with gunner
	//["Mi-48 Kajman (Black)", "O_Heli_Attack_02_black_F", 50000, "vehicle"] // Mi-28 with gunner (black camo)
];

planesArray = compileFinal str
[
	/*["A-143 Buzzard AA", "I_Plane_Fighter_03_AA_F", 50000, "vehicle"],
	["A-143 Buzzard CAS", "I_Plane_Fighter_03_CAS_F", 50000, "vehicle"],
	["A-164 Wipeout CAS", "B_Plane_CAS_01_F", 75000, "vehicle"],
	["To-199 Neophron CAS", "O_Plane_CAS_02_F", 75000, "vehicle"],*/
	["MQ4A Greyhawk ATGM UAV", "B_UAV_02_F", 45000, "vehicle"],
	["MQ4A Greyhawk Bomber UAV", "B_UAV_02_CAS_F", 35000, "vehicle"], // Bomber UAVs are a lot harder to use, hence why they are cheaper than ATGMs
	["K40 Ababil-3 ATGM UAV (CSAT)", "O_UAV_02_F", 45000, "vehicle"],
	["K40 Ababil-3 Bomber UAV (CSAT)", "O_UAV_02_CAS_F", 35000, "vehicle"],
	["K40 Ababil-3 ATGM UAV (AAF)", "I_UAV_02_F", 45000, "vehicle"],
	["K40 Ababil-3 Bomber UAV (AAF)", "I_UAV_02_CAS_F", 35000, "vehicle"]
];

boatsArray = compileFinal str
[
	["Rescue Boat", "C_Rubberboat", 500, "boat"],
	["Rescue Boat (NATO)", "B_Lifeboat", 500, "boat"],
	["Rescue Boat (CSAT)", "O_Lifeboat", 500, "boat"],
	["Assault Boat (NATO)", "B_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (AAF)", "I_Boat_Transport_01_F", 600, "boat"],
	["Assault Boat (FIA)", "B_G_Boat_Transport_01_F", 600, "boat"],
	["Motorboat", "C_Boat_Civil_01_F", 1000, "boat"],
	["Motorboat Rescue", "C_Boat_Civil_01_rescue_F", 900, "boat"],
	["Motorboat Police", "C_Boat_Civil_01_police_F", 1250, "boat"],
	["Speedboat HMG (CSAT)", "O_Boat_Armed_01_hmg_F", 4000, "boat"],
	["Speedboat Minigun (NATO)", "B_Boat_Armed_01_minigun_F", 1500, "boat"],
	["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 1500, "boat"],
	["SDV Submarine (NATO)", "B_SDV_01_F", 1000, "submarine"],
	["SDV Submarine (CSAT)", "O_SDV_01_F", 1000, "submarine"],
	["SDV Submarine (AAF)", "I_SDV_01_F", 1000, "submarine"]
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray);

uavArray = compileFinal str
[
	"UAV_02_base_F",
	"UGV_01_base_F"
];

noColorVehicles = compileFinal str
[
	// Deprecated
];

rgbOnlyVehicles = compileFinal str
[
	// Deprecated
];

colorsArray = compileFinal str
[
	[ // Main colors
		"All",
		[
			["Black", "#(rgb,1,1,1)color(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
			["Grey", "#(rgb,1,1,1)color(0.15,0.151,0.152,1)"], // #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
			["White", "#(rgb,1,1,1)color(0.75,0.75,0.75,1)"], // #(argb,8,8,3)color(1,1,1,0.5)
			["Dark Blue", "#(rgb,1,1,1)color(0,0.05,0.15,1)"], // #(argb,8,8,3)color(0,0.3,0.6,0.05)
			["Blue", "#(rgb,1,1,1)color(0,0.03,0.5,1)"], // #(argb,8,8,3)color(0,0.2,1,0.75)
			["Teal", "#(rgb,1,1,1)color(0,0.3,0.3,1)"], // #(argb,8,8,3)color(0,1,1,0.15)
			["Green", "#(rgb,1,1,1)color(0,0.5,0,1)"], // #(argb,8,8,3)color(0,1,0,0.15)
			["Yellow", "#(rgb,1,1,1)color(0.5,0.4,0,1)"], // #(argb,8,8,3)color(1,0.8,0,0.4)
			["Orange", "#(rgb,1,1,1)color(0.4,0.09,0,1)"], // #(argb,8,8,3)color(1,0.5,0,0.4)
			["Red", "#(rgb,1,1,1)color(0.45,0.005,0,1)"], // #(argb,8,8,3)color(1,0.1,0,0.3)
			["Pink", "#(rgb,1,1,1)color(0.5,0.03,0.3,1)"], // #(argb,8,8,3)color(1,0.06,0.6,0.5)
			["Purple", "#(rgb,1,1,1)color(0.1,0,0.3,1)"], // #(argb,8,8,3)color(0.8,0,1,0.1)
			["NATO Tan", "client\images\vehicleTextures\nato.jpg"], // #(argb,8,8,3)color(0.584,0.565,0.515,0.3)
			["CSAT Brown", "client\images\vehicleTextures\csat.jpg"], // #(argb,8,8,3)color(0.624,0.512,0.368,0.3)
			["AAF Green", "client\images\vehicleTextures\aaf.jpg"], // #(argb,8,8,3)color(0.546,0.59,0.363,0.2)
			["Trippy", "client\images\vehicleTextures\rainbow.jpg"],
			["TMNT", "client\images\vehicleTextures\TMNT.jpg"],
			["Carbon", "client\images\vehicleTextures\carbon.jpg"],
			["Pokemon", "client\images\vehicleTextures\pokemon.jpg"],
			["Rusty", "client\images\vehicleTextures\rusty.jpg"],
			["Denim", "client\images\vehicleTextures\denim.jpg"],
			["Psych", "client\images\vehicleTextures\psych.jpg"],
			["Leopard", "client\images\vehicleTextures\leopard.jpg"],
			["'Murica", "client\images\vehicleTextures\murica.jpg"],
			["Matrix", "client\images\vehicleTextures\matrix.jpg"],
			["Confederate", "client\images\vehicleTextures\confederate.jpg"],
			["Union Jack", "client\images\vehicleTextures\unionjack.jpg"],			
			["Yellow Camo", "client\images\vehicleTextures\camo_fuel.jpg"],
			["Orange Camo", "client\images\vehicleTextures\camo_fack.jpg"],
			["Red Camo", "client\images\vehicleTextures\camo_deser.jpg"],
			["Flame", "client\images\vehicleTextures\flame.jpg"],
			["Pink Camo", "client\images\vehicleTextures\camo_pank.jpg"]
		]
	],
	[ // Kart colors
		"Kart_01_Base_F",
		[
			["Black", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_black_CO.paa"],
			["White", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_white_CO.paa"],
			["Blue", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa"],
			["Green", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_green_CO.paa"],
			["Yellow", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_yellow_CO.paa"],
			["Orange", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_orange_CO.paa"],
			["Red", "\A3\Soft_F_Kart\Kart_01\Data\Kart_01_base_red_CO.paa"]
		]
	]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
// ["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit", "client\icons\medkit.paa", 400, 200],  // not needed since there are First Ait Kits
customPlayerItems = compileFinal str
[
	["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\water.paa", 30, 15],
	["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],
	["Marijuana", "marijuana", localize "STR_WL_ShopDescriptions_Marijuana", "client\icons\marijuana.paa", 2500, 1250],
	["LSD", "lsd", localize "STR_WL_ShopDescriptions_LSD", "client\icons\lsd.paa", 5000, 2500],
	["Cocaine", "cocaine", localize "STR_WL_ShopDescriptions_Cocaine", "client\icons\cocaine.paa", 7500, 3750],
	["Heroin", "heroin", localize "STR_WL_ShopDescriptions_Heroin", "client\icons\heroin.paa", 10000, 5000],
	["Repair Kit", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 500, 250],
	["Jerry Can (Full)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 150, 75],
	["Jerry Can (Empty)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 50, 25],
	["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\briefcase.paa", 1500, 750],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\briefcase.paa", 200, 100],
	["Syphon Hose", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\jerrycan.paa", 200, 100],
	["Energy Drink", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\water.paa", 100, 50],
	["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\briefcase.paa", 1000, 500]
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";