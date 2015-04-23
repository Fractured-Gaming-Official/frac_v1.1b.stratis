//	@file Name: teargas.sqf
//	@file Author: Mokey & whoever made the teargas script!
//	@file Description: Toxic Gas addon for A3W
//  @web: http://www.fractured-gaming.com
// ** Special Thanks to Pitoucc
<<<<<<< HEAD
_counter = 0;                                                 
_fuseDelay = 2;                                               // fuse delay in "seconds" until grenade is active

While{true} do{
    "dynamicBlur" ppEffectEnable true;                       // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0];                        // enables normal vision
    "dynamicBlur" ppEffectCommit 10;                         // time it takes to normal
    resetCamShake;                                           // resets the shake
    20 fadeSound 1;                                          // fades the sound back to normal	
	
	if (_counter < _fuseDelay) then{
        sleep 1;	
		hint str _counter;ad
	    _counter = _counter +1;		                         // counter augments by 1, for each 1 second sleep
	}
    else{
	hint "enter gas phase";
		waituntil{
			((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10)       // detects if player is within grenade radius
		};
=======
While{true} do 
{
    "dynamicBlur" ppEffectEnable true; 
    "dynamicBlur" ppEffectAdjust [0];
    "dynamicBlur" ppEffectCommit 10; // time to revert to normal state
    resetCamShake;
    20 fadeSound 1;

>>>>>>> parent of c31de2c... edit on Toxic Grenade

    waituntil{
    ((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10)
    &&
    (getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)
    };

    if (headgear player != "H_CrewHelmetHeli_B") then
    {
        "dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [15]; // intensity of blur
        "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
        enableCamShake true;     // enables camera shake
        addCamShake [10, 45, 10];
        player setFatigue 0;
        5 fadeSound 0.1;
		while {(alive player) && ((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) && (headgear player != "H_CrewHelmetHeli_B")} do
        {
            player setDamage (damage player + 0.12); //damage per tick
			sleep 5; // Timer damage is assigned "seconds"
        };
    };
    sleep 5;
};