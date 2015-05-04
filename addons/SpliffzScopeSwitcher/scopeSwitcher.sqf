/*
*	Spliffz Scope Switcher v0.9c
*
*	By Spliffz <theSpliffz@gmail.com>
*
*	SpliffzScopeSwitcher\scopeSwitcher.sqf © 2013
*	
*	[Information]
*	Thought I would share this with the world, instead of keeping it private, as we find it very usefull in certain situations.
*	I made this little script to switch scopes on-the-fly without having to go into the inventory and drag them to the slot.
*	Currently it works with 2 scopes. 1 on the gun, and one in the inventory.
*	
*	
*	[How it works]
*	Extract the folder and copy it to your mission folder.
*	Run this script in your init.sqf with:
* 	null = [] execVM "SpliffzScopeSwitcher\scope_init.sqf";
*	
*	Once you're in-game, put another scope in your inventory (like acog, SOS, Thermal, etc).
*	When you need to switch, just press 'TAB' once.
*	
*	At the moment it only works with your primary weapon! In the future there will be support for the handgun (when there are more then 1 sights available for them.
*	
*	
*	[credits]
*	Tajin - For his helmet cam script! This showed me it could be done.
*	Whistle, D4nny24, Pek, Sacha - For the endless support in my scripting madness.
*
*/
#define ScopeSwitcher_Key parseNumber (preprocessFile(spliffz_scopeSwitcher_basepath + "ScopeSwitcher_Key"))

private ["_key", "_shift", "_ctrl", "_alt", "_BIS_Scopes", "_curWeapon", "_handgun", "_primary", "_config", "_compatibleScopes", "_wpnAttachments", "_wpnScope", "_gearList", "_invScopes", "_newCompatibleScopes", "_index"];

// Defines - Scopes array
_BIS_Scopes = ["optic_DMS","optic_NVS","optic_Nightstalker","optic_tws","optic_tws_mg","optic_Aco","optic_Aco_smg","optic_ACO_grn","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","optic_SOS","optic_MRCO","optic_Yorris","optic_MRD","optic_Arco","optic_Hamr"];

disableSerialization;

_key = _this select 0;
_shift = _this select 1;
_ctrl = _this select 2;
_alt = _this select 3;

//diag_log format ["## DEBUG ## Key: %1",_key];


// exit if wrong key
if(_key != ScopeSwitcher_Key) exitWith {};


// get current weapon
_curWeapon = currentWeapon player;
_handgun = handgunWeapon player;
_primary = primaryWeapon player;


// 	diag_log format ["## DEBUG ##"];


if(_curWeapon == _handgun) then {
	/* !! STUB !! DOES NOT WORK YET. Reason: There are not enough pistol sights yet. RH is the only one I think so far... */
	// handgun
	diag_log format ["## DEBUG1 ## - Weapon: %1", _curWeapon];
	
	_config = configfile >> "CfgWeapons" >> _curWeapon;
	_compatibleScopes = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");

	// current attachment on weapon
	_wpnAttachments = handgunItems player;
	_wpnScope = _wpnAttachments select 2;
	_gearList = items player;
	_invScopes = [];

	// get inventory attachments and put them in an array
	{
		if((toLower _x) in _compatibleScopes) then {
			_invScopes set [(count _invScopes), _x];
		};
	} foreach _gearList;


	// switch scopes!
	{
		if(_x != _wpnScope) then {
			// remove current scope
			diag_log format ["## DEBUG## - Scope: %1", _x];
			player removeHandgunItem _wpnScope;
			// add it to player inventory
			player addItem _wpnScope;
			
			// put on new one
			player addHandgunItem _x;
			player removeItem _x;
		};
	} foreach _invScopes;

} else {
	// primary
	//diag_log format ["## DEBUG2 ## - Weapon: %1", _curWeapon];

	//_compatibleScopes = [];
	_config = configfile >> "CfgWeapons" >> _curWeapon;
	_compatibleScopes = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");

	// current attachment on weapon
	_wpnAttachments = primaryWeaponItems player;
	_wpnScope = _wpnAttachments select 2;
//	diag_log format ["## DEBUG ## - CurScope: %1", _wpnScope];
	_gearList = items player;
//	diag_log format ["## DEBUG ## - gearList: %1", _gearList];
	
	_invScopes = [];

//	hint format ["count: %1", (count _compatibleScopes)];
	
	
	// !!! WHY U NO WORK!??!?!! - bcuz, optic class name is CaSe-sEnSitIvE
//	if((typename _compatibleScopes) == "ARRAY") then { hint "Array!"; } else { hint "No Array!"; };
//	diag_log format ["## DEBUG ## - _compatibleScopes: %1", _compatibleScopes];
	
	
	// filter out wrong typed BIS scopes from compatibleItems array and replace them with good ones, make new array
	_newCompatibleScopes = [];
	{
		_compat_scope = toLower _x;
		
		//_index = [_BIS_Scopes, _compat_scope] call BIS_fnc_findInPairs;
		_index = [_BIS_Scopes, _compat_scope] call BIS_fnc_arrayFindDeep;
//		diag_log format ["## DEBUG ## _x: %1", _x];
//		diag_log format ["## DEBUG ## _compat_scope: %1", _compat_scope];
//		diag_log format ["## DEBUG ## _index: %1", _index];
		if(typeName _index == "ARRAY") then {
//			diag_log format ["## DEBUG ## Indexed Scope: %1", (_BIS_Scopes select (_index select 0))];
			_newCompatibleScopes set [(count _newCompatibleScopes), (_BIS_Scopes select (_index select 0))];
		};
		
	} foreach _compatibleScopes;
	
//	diag_log format ["## DEBUG ## _newCompatibleScopes: %1", _newCompatibleScopes];
	
	
	// get inventory attachments and put them in an array
	{
//		diag_log format ["## DEBUG ## - item: %1", _x];
		if(_x in _compatibleScopes) then {
			// add it to the array
			_invScopes set [(count _invScopes), _x];
//			hint 'scope added';
//			diag_log format ["## DEBUG ## MSG: SCOPE ADDED! %1", _x];
		} else {
			// if the classname is not spelled properly by the addon makers in the configfile we need to replace it with the correct spelled one.
			if(_x in _newCompatibleScopes) then {
				// add it to the array
				_invScopes set [(count _invScopes), _x];
//				hint 'scope added';
//				diag_log format ["## DEBUG ## MSG: SCOPE ADDED! %1", _x];
			};
		};
	} foreach _gearList;


	// switch scopes!
	{
		if(_x != _wpnScope) then {
			// remove current scope
//			diag_log format ["## DEBUG## - Scope: %1", _x];
			player removePrimaryWeaponItem _wpnScope;

			// add it to player inventory
			player addItem _wpnScope;
			
			// put on new one
			player addPrimaryWeaponItem _x;
			player removeItem _x;
		};
	} foreach _invScopes;
	
};

// EOF