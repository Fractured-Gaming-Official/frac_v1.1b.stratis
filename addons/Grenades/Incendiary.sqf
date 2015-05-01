//	@file Name: teargas.sqf
//	@file Author: Mokey & CreamPie 
//	@file Description: Incendiary Grenade addon for A3W
//	@web: http://www.fractured-gaming.com
//  @web: http://www.gamersinc.co.za
//	@Special Thanks to Pitoucc, CREAMPIE
/*

private ["_damageRadius"];

gasDamage = {
switch (true) do										// Check if condition is met
	{
	case(_damageRadius < 2.5):							// 2.5m
		{player setDamage (damage player + 0.15);     	// 15 damage per tick
		  sleep 0.5;									// 0.5s Timer damage is assigned "seconds"
		};
  
    case(_damageRadius < 5 && _damageRadius > 2.5):		// 2.5 - 5m
		{player setDamage (damage player + 0.10);     	// 10 damage per tick
		 sleep 1;										// 1s Timer damage is assigned "seconds"
		};
		
    case(_damageRadius < 10 && _damageRadius > 5):		// 5- 10m
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
		
	};

}];	
	
While{true} do{									

	waituntil{
		_smokeShell = nearestObject [getPosATL player, "SmokeShellOrange"];
//	 	hint format["%1", (_this select 6)];
	
//		_flare1= "F_40mm_White" createVehicle getPos _grenadeObj;
//		_flare1 attachTo [_grenadeObj,[0,0,0]];
		
		_curPlayerInvulnState = player getVariable ["isAdminInvulnerable", false];
		_damageRadius = (_smokeShell distance player);
	    _damageRadius < 10 && velocity _smokeShell isEqualTo [ 0, 0, 0 ]
		&& !_curPlayerInvulnState
    };  	
		call gasDamage; 
};