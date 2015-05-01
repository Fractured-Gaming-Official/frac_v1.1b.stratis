// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow

// Notes: Gun and general stores have position of spawned crate, vehicle stores have an extra air spawn direction
//
// Array contents are as follows:
// Name, Building Position, Desk Direction (or [Desk Direction, Front Offset]), Excluded Buttons
storeOwnerConfig = compileFinal str
[
	["GenStore1", 2, 260, []],
	["GenStore2", 4, 310, []],
	["GenStore4", 1, 80, []],
	["GenStore5", 1, 115, []],
	["GenStore6", 1, 330, []],
	["GenStore7", 2, 15, []],
	["GenStore8", 0, 1, []],

	["GunStore1", 0, 195, []],
	["GunStore2", 1, 130, []],
	["GunStore3", 5, 85, []],
	["GunStore4", 2, 315, []],
	["GunStore5", 3, 140, []],
	["GunStore6", 3, 210, []],
	["GunStore9", 5, 85, ["Armament"]],

	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes"
	["VehStore1", 0, 195, ["Planes"]],
	["VehStore2", 2, 285, ["Boats"]],
	["VehStore3", 4, 340, ["Planes"]],
	["VehStore4", 3, 240, ["Planes","Boats"]],
	["VehStore5", 2, 130, ["Planes","Boats"]],
	["VehStore6", 1, 42, ["Planes","Boats"]]
	
];

// Outfits for store owners
storeOwnerConfigAppearance = compileFinal str
[
	["GenStore1", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GenStore2", [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	["GenStore4", [["weapon", ""], ["uniform", "U_IG_Guerilla3_1"]]],
	["GenStore5", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GenStore6", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GenStore7", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],

	["GunStore1", [["weapon", ""], ["uniform", "U_B_SpecopsUniform_sgg"]]],
	["GunStore2", [["weapon", ""], ["uniform", "U_O_SpecopsUniform_blk"]]],
	["GunStore3", [["weapon", ""], ["uniform", "U_I_CombatUniform_tshirt"]]],
	["GunStore4", [["weapon", ""], ["uniform", "U_IG_Guerilla1_1"]]],
	["GunStore5", [["weapon", ""], ["uniform", "U_IG_Guerilla1_1"]]],
	["GunStore6", [["weapon", ""], ["uniform", "U_IG_Guerilla1_1"]]],
	["GunStore9", [["weapon", ""], ["uniform", "U_IG_Guerilla1_1"]]],

	["VehStore1", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore2", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore3", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore4", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore5", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore6", [["weapon", ""], ["uniform", "U_Competitor"]]]
];