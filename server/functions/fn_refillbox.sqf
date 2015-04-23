// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]
//  @file Edited by Mokey & Huskey622 :Fractured Gaming, This File is not the original

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box allowDamage false; // No more fucking busted crates
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["launch_RPG32_F", "launch_NLAW_F", "launch_Titan_short_F"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(1,2)],
			["wep", "launch_Titan_F", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			["mag", ["ClaymoreDirectionalMine_Remote_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
		];
	};
	case "mission_USSpecial":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["itm", "NVGoggles", 5],
			["itm", ["optic_MRCO", "optic_Arco", "optic_Hamr", "optic_SOS"], RANDOM_BETWEEN(1,2)],
			["itm", ["optic_Nightstalker", "optic_tws", "optic_tws_mg"], RANDOM_BETWEEN(0,2)],
			["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_acp"], RANDOM_BETWEEN(0,3)],
			["wep", ["arifle_MXM_F", "srifle_EBR_F", "srifle_DMR_01_DMS_F", "arifle_Katiba_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["LMG_Mk200_F", "LMG_Zafir_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,2)],
			["wep", ["MMG_02_black_F", "MMG_01_hex_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,2)]
		];
	};
	case "mission_Main_A3snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["srifle_LRR_LRPS_F", "srifle_LRR_camo_LRPS_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["srifle_DMR_02_LPRS_F", "srifle_DMR_02_camo_LPRS_F", "srifle_DMR_02_sniper_LPRS_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,3)],
			["itm", ["optic_DMS", "optic_SOS", "optic_LRPS"], RANDOM_BETWEEN(0,3)],
			["itm", ["optic_AMS", "optic_KHS_blk"], RANDOM_BETWEEN(0,3)],
			["itm", ["optic_Nightstalker", "optic_tws", "optic_tws_mg"], RANDOM_BETWEEN(0,2)]
		];
	};
	case "mission_Side_Geocache":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F", "srifle_GM6_LRPS_F", "srifle_GM6_camo_LRPS_F"], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(4,6)],
			["wep", ["LMG_Zafir_F", "MMG_02_black_F", "MMG_02_sand_F", "MMG_02_camo_F", "arifle_MX_GL_F", "arifle_Katiba_F"], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(4,6)],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(1,3)],
			["wep", ["launch_B_Titan_F", "launch_I_Titan_F", "launch_O_Titan_F", "launch_Titan_F", "launch_B_Titan_short_F", "launch_I_Titan_short_F", "launch_O_Titan_short_F", "launch_Titan_short_F"], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(1,2)],
			["itm", ["SmokeShell", "MiniGrenade", "HandGrenade", "ItemGPS"], RANDOM_BETWEEN(1,10)],
			["itm", ["optic_Nightstalker", "optic_tws", "optic_tws_mg"], RANDOM_BETWEEN(1,2)],
			["itm", ["optic_Arco", "optic_LRPS", "optic_Holosight", "optic_Hamr"], RANDOM_BETWEEN(1,2)],
			["itm", ["optic_AMS", "optic_KHS_blk"], RANDOM_BETWEEN(0,3)],
			["itm", ["V_PlateCarrierH_CTRG", "V_PlateCarrierL_CTRG", "V_PlateCarrierIA2_dgtl", "V_PlateCarrierSpec_rgr", "V_PlateCarrierSpec_mtp", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_rgr", "V_PlateCarrierGL_blk", "V_PlateCarrierGL_rgr"], RANDOM_BETWEEN(0,3)],
			["itm", ["B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_oli"], RANDOM_BETWEEN(1,3)]		
		];
	};
	case "mission_TOP_Gear1":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["itm", ["V_RebreatherB", "V_PlateCarrierIAGL_dgtl", "V_TacVest_camo", "V_PlateCarrierGL_rgr"], RANDOM_BETWEEN(1,8)],
			["itm", ["B_Carryall_mcamo", "B_Kitbag_mcamo"], RANDOM_BETWEEN(1,5)],
			["itm", ["U_B_HeliPilotCoveralls","U_B_Wetsuit","U_B_CombatUniform_mcam_vest"], RANDOM_BETWEEN(1,4)],
			["itm", ["H_HelmetCrew_B","H_CrewHelmetHeli_B","H_HelmetB_plain_blk","H_HelmetSpecB"], RANDOM_BETWEEN(1,5)]
		];
	};
	case "mission_TOP_Sniper":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["srifle_LRR_SOS_F", "srifle_LRR_camo_SOS_F", "srifle_GM6_SOS_F", "srifle_GM6_camo_SOS_F"], RANDOM_BETWEEN(1,5), RANDOM_BETWEEN(4,6)],
			["wep", ["srifle_EBR_F", "srifle_DMR_01_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,6)],			
			["wep", "Rangefinder", RANDOM_BETWEEN(1,3)],
			["itm", ["optic_DMS","optic_Nightstalker","optic_tws"], RANDOM_BETWEEN(1,5)]
		];
	};		
};

[_box, _boxItems] call processItems;
