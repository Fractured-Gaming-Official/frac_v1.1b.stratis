// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Description: The main init.

#define DEBUG false

enableSaving [false, false];

// block script injection exploit
inGameUISetEventHandler ["PrevAction", ""];
inGameUISetEventHandler ["Action", ""];
inGameUISetEventHandler ["NextAction", ""];

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

X_Server = false;
X_Client = false;
X_JIP = false;

//disable TAW grass Option 'None'
tawvd_disablenone = true;


// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		if (hasInterface) then // Normal player
		{
			9999 cutText ["Welcome to Fractured Gaming, please wait for your client to initialize", "BLACK", 0.01];

			waitUntil {!isNull player};
			player setVariable ["playerSpawning", true, true];

			removeAllWeapons player;
			client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

			// Reset group & side
			[player] joinSilent createGroup playerSide;

			execVM "client\init.sqf";
		}
		else // Headless
		{
			waitUntil {!isNull player};
			if (typeOf player == "HeadlessClient_F") then
			{
				execVM "client\headless\init.sqf";
			};
		};
		
		player setVehicleVarName ""; // undo BIS_fnc_objectVar crap
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_ground\init.sqf";
[] execVM "addons\scripts\DynamicWeatherEffects.sqf";
[] execVM "addons\vactions\functions.sqf"; //Vehicle Actions
[] execVM "addons\JumpMF\init.sqf";
[] execVM "addons\scripts\servercredits.sqf"; //Intro Credits
[] execVM "addons\outlw_magRepack\MagRepack_init.sqf"; //Mag Repacker
[] execVM "addons\scripts\zlt_fastrope.sqf"; //Fast Rope Addon
[] execVM "addons\Grenades\initGrenades.sqf"; // Toxic Gas Grenades
[] execVM "addons\HvT\HvT.sqf"; // High Value Target
[] execVM "addons\HvT\HvD.sqf"; // High Value Drugs	
[] execVM "addons\EtV\init.sqf"; // Explosives to Vehicles
[] execVM "addons\laptop\init.sqf"; //Hacker Mission
[] execVM "addons\APOC_Airdrop_Assistance\init.sqf"; //Airdrop Assistance
if(hasInterface) then{[] execVM "addons\statusBar\statusbar.sqf"}; //Status Bar
if (isServer) then {call compile preprocessFile "mapconfig\structures\initBuildings.sqf";}; //GID Structures