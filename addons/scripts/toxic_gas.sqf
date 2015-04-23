//	@file Name: teargas.sqf
//	@file Author: Mokey & whoever made the teargas script!
//	@file Description: Toxic Gas addon for A3W
//      @web: http://www.fractured-gaming.com
// ** Special Thanks to Pitoucc
While{true} do 
{
    "dynamicBlur" ppEffectEnable true; 
    "dynamicBlur" ppEffectAdjust [0];
    "dynamicBlur" ppEffectCommit 10; // time to revert to normal state
    resetCamShake;
    20 fadeSound 1;


    waituntil{
    ((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10)
    &&
    (getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)
    };

    if (headgear player != "H_CrewHelmetHeli_B") then
    {
        "dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [10]; // intensity of blur
        "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
        enableCamShake true;     // enables camera shake
        addCamShake [10, 45, 10];
        player setFatigue 0;
        5 fadeSound 0.1;
		while {(alive player) && ((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) && (headgear player != "H_CrewHelmetHeli_B")} do
        {
            player setDamage (damage player + 0.12); //damage per tick 1=100
			sleep 5; // Timer damage is assigned "seconds"
        };
    };
    sleep 5;
};