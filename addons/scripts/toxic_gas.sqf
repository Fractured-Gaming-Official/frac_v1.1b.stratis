//	@file Name: teargas.sqf
//	@file Author: Mokey
//	@file Description: Toxic Gas addon for A3W
//	@web: http://www.fractured-gaming.com
//	@Special Thanks to Pitoucc


_gasMask = ["H_CrewHelmetHeli_B"]; // define the gasmasks here
setNoGasStatus={
    "dynamicBlur" ppEffectEnable true;                  // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0];                   // enables normal vision
    "dynamicBlur" ppEffectCommit 10;                    // time it takes to go back to normal vision
    resetCamShake;                                      // resets the shake
    20 fadeSound 1;                                     // fades the sound back to normal	
};

setGasStatus = { 
    "dynamicBlur" ppEffectEnable true;              	// enables ppeffect
    "dynamicBlur" ppEffectAdjust [15];             	  	// intensity of blur
	"dynamicBlur" ppEffectCommit 5;                 	// time till vision is fully blurred
	enableCamShake true;                             	// enables camera shake
	addCamShake [10, 45, 10];                        	// sets shakevalues
	player setFatigue 0;                            	// sets the fatigue to 100%
	5 fadeSound 0.1;                                 	// fades the sound to 10% in 5 seconds
};

gasDamage = {
   player setDamage (damage player + 0.15);     		//damage per tick
   sleep 3;                                 		    // Timer damage is assigned "seconds"
};


While{true} do{
		call setNoGasStatus;
	waituntil{
		((nearestObject [getPosATL player, "SmokeShell"]) distance player < 5)       // detects if player is within grenade radius
		&&
		(getPosATL (nearestObject [getPosATL player, "SmokeShell"]) select 2 < 0.5)  // detects if grenade is on ground to avoid gassing yourself while throwing.
	};
	
	if !(headgear player in _gasMask) then 
		 {
			call setGasStatus;
			call gasDamage;
		 }
		 else
		 {};
};