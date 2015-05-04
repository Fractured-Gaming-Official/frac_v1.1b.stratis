/*
*	Spliffz Scope Switcher v0.9c
*
*	By Spliffz <theSpliffz@gmail.com>
*
*	SpliffzScopeSwitcher\scope_init.sqf © 2013
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
*	At the moment it only works with your primary weapon!!! In the future there will be support for the handgun.
*	
*	
*	[credits]
*	Tajin - For his helmet cam script! This showed me it could be done.
*	Whistle, D4nny24, Pek, Sacha - For the endless support in my scripting madness.
*
*/

spliffz_scopeSwitcher_basepath = "addons\SpliffzScopeSwitcher\";


if(isDedicated) exitWith {};

disableSerialization;

// init
waitUntil {!isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown", "null=[_this select 1, _this select 2, _this select 3, _this select 4] execVM (spliffz_scopeSwitcher_basepath+'scopeSwitcher.sqf'); "];



// EOF