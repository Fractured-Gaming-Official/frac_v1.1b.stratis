// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: spawnAction.sqf
//	@file Author: [404] Deadbeat, [KoS] Bewilderbeest, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args: [int(type of spawn)]

#define respawn_Content_Text 3401
#define respawn_Random_Button 3413
#define respawn_Preload_Checkbox 3416
#define respawn_Locations_Type 3449
#define respawn_Locations_List 3450
#define respawn_Spawn_Button 3453

disableSerialization;

if (!isNil "spawnActionHandle" && {typeName spawnActionHandle == "SCRIPT"} && {!scriptDone spawnActionHandle}) exitWith {};

spawnActionHandle = (_this select 1) spawn
{
	disableSerialization;

	private ["_switch", "_data", "_gearLevel"];
	_switch = _this select 0;
	_data = [_this select 1, false];
	_gearLevel = player getVariable ["glevel", 0];

	if (isNil "playerData_resetPos") then
	{
		// Deal with money here
		_baseMoney = ["A3W_startingMoney", 100] call getPublicVar;
		player setVariable ["cmoney", _baseMoney, true];
		switch (_gearLevel) do
		{
			case 1: { player setVariable ["cmoney", _baseMoney + 100, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 2: { player setVariable ["cmoney", _baseMoney + 200, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 3: { player setVariable ["cmoney", _baseMoney + 300, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 4: { player setVariable ["cmoney", _baseMoney + 400, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 5: { player setVariable ["cmoney", _baseMoney + 500, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 6: { player setVariable ["cmoney", _baseMoney + 600, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 7: { player setVariable ["cmoney", _baseMoney + 700, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 8: { player setVariable ["cmoney", _baseMoney + 800, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 9: { player setVariable ["cmoney", _baseMoney + 900, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			case 10: { player setVariable ["cmoney", _baseMoney + 1000, true]; [MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add; [MF_ITEMS_WATER, 1] call mf_inventory_add; };
			
			default { player setVariable ["cmoney", _baseMoney, true]; };
		};
		
		[] execVM "addons\gear\gearCheck.sqf"; //Cael817, Add extra gear at respawn.

		[MF_ITEMS_CANNED_FOOD, 1] call mf_inventory_add;
		[MF_ITEMS_WATER, 1] call mf_inventory_add;
		[MF_ITEMS_REPAIR_KIT, 1] call mf_inventory_add;
	};

	if (cbChecked ((uiNamespace getVariable "RespawnSelectionDialog") displayCtrl respawn_Preload_Checkbox)) then
	{
		_data set [1, true];
	}
	else
	{
		profileNamespace setVariable ["A3W_preloadSpawn", false];
	};

	switch (_switch) do
	{
		case 1: { _data call spawnInTown };
		case 2: { _data call spawnOnBeacon };
		default { _data call spawnRandom };
	};

	if (isNil "client_firstSpawn") then
	{
		execVM "client\functions\firstSpawn.sqf";
	};
};

private ["_dialog", "_ctrlButton", "_header", "_spawnActionHandle"];
_dialog = uiNamespace getVariable ["RespawnSelectionDialog", displayNull];
_header = _dialog displayCtrl respawn_Content_Text;
//_ctrlButton = (uiNamespace getVariable "RespawnSelectionDialog") displayCtrl (_this select 0);

if (cbChecked (_dialog displayCtrl respawn_Preload_Checkbox)) then
{
	_header ctrlSetStructuredText parseText "<t size='0.5'> <br/></t><t size='1.33'>Preloading spawn...</t>";
};

if (typeName spawnActionHandle == "SCRIPT") then
{
	_spawnActionHandle = spawnActionHandle;
	waitUntil {scriptDone _spawnActionHandle};
	spawnActionHandle = nil;
};

//if (!isNull _ctrlButton) then
//{
	_header ctrlSetStructuredText parseText "It appears there was an error,<br/>please try again.";
	{
		(_dialog displayCtrl _x) ctrlEnable true;
	} forEach [respawn_Random_Button, respawn_Spawn_Button, respawn_Locations_Type, respawn_Locations_List, respawn_Preload_Checkbox];
//};
