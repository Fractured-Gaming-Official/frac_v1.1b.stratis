//	@file Name: Incendiary.sqf
//	@file Author: Mokey & CreamPie 
//	@file Description: Incendiary Grenade addon for A3W
//	@web: http://www.fractured-gaming.com
//  @web: http://www.gamersinc.co.za
//	@Special Thanks to Pitoucc, CREAMPIE


private ["_damageRadius", "_smokeShell", "_grenadeObj", "_flare1"];

burnDamage = {
switch (true) do										// Check if condition is met
	{
	case(_damageRadius < 2):							// 2.5m
		{player setDamage (damage player + 0.15);     	// 15 damage per tick
		  sleep 0.5;									// 0.5s Timer damage is assigned "seconds"
		};
  
    case(_damageRadius < 4):
		{player setDamage (damage player + 0.10);     	// 10 damage per tick
		 sleep 1;										// 1s Timer damage is assigned "seconds"
		};
		
    case(_damageRadius < 8):
		 {player setDamage (damage player + 0.05);     	// 5 damage per tick
		  sleep 2;									    // 2s Timer damage is assigned "seconds"
		 };
	};
};

player addEventHandler ["Fired",
{
	if ((_this select 4) isEqualTo "SmokeShellOrange") then
	{
		_grenadeObj = (_this select 6);
		flare1= "F_40mm_White" createVehicle getPos _grenadeObj;
        _flare1 attachTo [_grenadeObj,[0,0,0]];
	};

}];	
	
While{true} do{									

	waituntil{
		_smokeShell = nearestObject [getPosATL player, "SmokeShellOrange"];
		_curPlayerInvulnState = player getVariable ["isAdminInvulnerable", false];
		_damageRadius = (_smokeShell distance player);
	    _damageRadius < 8 && velocity _smokeShell isEqualTo [ 0, 0, 0 ]
		&& !_curPlayerInvulnState
    };  	
		call burnDamage; 
};