//	@file Name: teargas.sqf
//	@file Author: Mokey
//	@file Description: Toxic Gas addon for A3W
//	@web: http://www.fractured-gaming.com
//	@Special Thanks to Pitoucc

setNoGasStatus={
    "dynamicBlur" ppEffectEnable true;               // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0];                // enables normal vision
    "dynamicBlur" ppEffectCommit 10;                 // time it takes to normal
    resetCamShake;                                   // resets the shake
    20 fadeSound 1;                                  // fades the sound back to normal	
};

setGasStatus = {
    "dynamicBlur" ppEffectEnable true;               // enables ppeffect
    "dynamicBlur" ppEffectAdjust [15];               // intensity of blur
	"dynamicBlur" ppEffectCommit 5;                  // time till vision is fully blurred
	enableCamShake true;                             // enables camera shake
	addCamShake [10, 45, 10];                        // sets shakevalues
	player setFatigue 0;                             // sets the fatigue to 100%
	5 fadeSound 0.1;                                 // fades the sound to 10% in 5 seconds
};

gasDamage = {
    player setDamage (damage player + 0.12);         //damage per tick
	sleep 5;										 // Timer damage is assigned "seconds"
};

_grenSpeed = [];

While{true} do{

	waituntil{
<<<<<<< HEAD
		(nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10       // detects if player is within grenade radius
=======
		((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10)       // detects if player is within grenade radius
		&&
		(getpos (nearestObject [getPosATL player, "SmokeShellYellow"]) select 2 < 0.5)
>>>>>>> parent of c9fb19e... slight fix
	};

	sleep 0.1;
	_grenSpeed = []; = speed (nearestObject [getpos player, "SmokeShellYellow"]);
	
	if ((headgear player != "H_CrewHelmetHeli_B") && (_grenSpeed select 2 == 0)) then{
		
		call setGasStatus;
			
		while {(alive player) && ((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) && (headgear player != "H_CrewHelmetHeli_B")} do{
			
			call gasDamage;
		};
	};
	
	call setNoGasStatus;
	sleep 4.9;
};

