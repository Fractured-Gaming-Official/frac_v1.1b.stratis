//	@file Name: teargas.sqf
//	@file Author: Mokey
//	@file Description: Toxic Gas addon for A3W
//	@web: http://www.fractured-gaming.com
//	@Special Thanks to Pitoucc & Creampie!


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
//	player setFatigue 1;                            	// sets the fatigue to 100%
	5 fadeSound 0.1;                                 	// fades the sound to 10% in 5 seconds
};

gasDamage = {
   player setDamage (damage player + 0.15);     		//damage per tick
   sleep 3;                                 		    // Timer damage is assigned "seconds"
};


While{true} do{
		call setNoGasStatus;
	waituntil{
        _smokeShell = nearestObject [getPosATL player, "SmokeShellYellow"];
        _smokeShell distance player < 10
        &&
        velocity _smokeShell isEqualTo [ 0, 0, 0 ]
    };  
	
	if !(headgear player in _gasMask) then 
		 {
			call setGasStatus;
			call gasDamage;
		 }
		 else
		 {};
};