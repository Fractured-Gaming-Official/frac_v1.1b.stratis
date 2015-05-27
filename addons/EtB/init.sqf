waitUntil {time > 0};
execVM "addons\Explosives-To-Building\EtB.sqf";
waitUntil {!isNil "EtBInitialized"};
[player] call EtB_Actions;