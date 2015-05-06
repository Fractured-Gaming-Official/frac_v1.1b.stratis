//@file Version: 1.2
//@file Name: gearLevel10.sqf
//@file Author: Cael817, based of something i found
private ["_player"];
_player = _this;

if (((getPlayerUID _player) in call gearLevel10)) then {

_player setVariable ["cmoney", (_player getVariable "cmoney") + 1000, true];

{_player removeWeapon _x} forEach weapons _player;
{_player removeMagazine _x} forEach magazines _player;
//removeUniform _player;
//removeallitems _player;
//removeVest _player;
removeBackpack _player;
//removeGoggles _player;
//removeHeadgear _player;

_player addBackpack "B_Carryall_cbr"; //BackPack
_player addUniform ""; //Uniform (must be supported by side)
_player addVest "V_PlateCarrierGL_rgr"; //Vest
_player linkItem "NVGoggles"; //Nightvision, "NVGoggles"
_player linkItem "ItemGPS"; //GPS, "ItemGPS"
_player addWeapon "Rangefinder"; //Binoculars
_player addMagazines ["MiniGrenade", 3]; //Grenades
_player addItem "FirstAidKit"; //Any other stuff that goes in inventory if there is space
_player addItem ""; //Any other stuff that goes in inventory if there is space
_player addItem ""; //Any other stuff that goes in inventory if there is space
_player addItem ""; //Any other stuff that goes in inventory if there is space
_player addItem ""; //Any other stuff that goes in inventory if there is space
_player addGoggles ""; //Glasses or masks. Overwrites, add as item if you want it a an extra item
_player addHeadgear "H_HelmetSpecB_paint2"; //Hat or helmet. Overwrites, add as item if you want it a an extra item

_player addMagazines ["11Rnd_45ACP_Mag", 4]; //Add handgun magazines first so one gets loaded
_player addWeapon "hgun_Pistol_heavy_01_F"; //Handgun
_player addhandGunItem "optic_MRD"; //Handgun Attachments
_player addhandGunItem "muzzle_snds_acp"; //Handgun Attachments

_player addMagazines ["30Rnd_45ACP_Mag_SMG_01", 4]; //Add primary weapon magazines first so one gets loaded
_player addWeapon "SMG_01_F"; //Primary Weapon
_player addPrimaryWeaponItem "optic_Aco_smg"; //Primary Weapon Attachments
_player addPrimaryWeaponItem "muzzle_snds_acp"; //Primary Weapon Attachments
_player addPrimaryWeaponItem ""; //Primary Weapon Attachments

_player addMagazines ["", 0]; //Add secondary Weapon magazines first so one gets loaded
_player addWeapon ""; //Secondary Weapon (Launcher slot)

_player selectWeapon "SMG_01_F"; //Select Active Weapon

switch (true) do
{
	case (["_medic_", typeOf _player] call fn_findString != -1):
	{
		_player addItem "ToolKit";
		_player addItem "MediKit";
		_player removeItem "";
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1):
	{
		_player addItem "ToolKit";
		_player addItem "MediKit";
		_player removeItem "";
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1):
	{
		_player addItem "ToolKit";
		_player addItem "MediKit";
		_player removeItem "";
	};
		case (["_diver_", typeOf _player] call fn_findString != -1):
	{
		_player addItem "ToolKit";
		_player addItem "MediKit";
		_player removeItem "";
		_player addVest "V_RebreatherIA";
	};
};

};
