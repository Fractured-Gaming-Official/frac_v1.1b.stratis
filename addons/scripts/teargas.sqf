//	@file Name: teargas.sqf
//	@file Author: Mokey
//	@file Description: Teargas addon for A3W

/*
While{true} do {
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 10; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;     //fades the sound back to normal


waituntil{
((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10)
and
(getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)
};


"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [15]; // intensity of blur
"dynamicBlur" ppEffectCommit 7; // time till vision is fully blurred
enableCamShake true;     // enables camera shake
addCamShake [10, 45, 10];    // sets shakevalues
player setFatigue 1; // sets the fatigue to 100%
5 fadeSound 0.1;     // fades the sound to 10% in 5 seconds


sleep 5;

};
*/
While{true} do 
{
    "dynamicBlur" ppEffectEnable true; // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0]; // enables normal vision
    "dynamicBlur" ppEffectCommit 13; // time it takes to normal
    resetCamShake; // resets the shake
    20 fadeSound 1;     //fades the sound back to normal


    waituntil{
    ((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10)
    and
    (getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)
    };

    if (headgear player != "H_CrewHelmetHeli_B") then
    {
        "dynamicBlur" ppEffectEnable true; // enables ppeffect
        "dynamicBlur" ppEffectAdjust [15]; // intensity of blur
        "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
        enableCamShake true;     // enables camera shake
        addCamShake [10, 45, 10];    // sets shakevalues
        player setFatigue 0; // sets the fatigue to 100%
        5 fadeSound 0.1;     // fades the sound to 10% in 5 seconds
		      while {ppEffectEnable true} do 
        {
            player setDamage (setdamage 0.01);
        };
    };
    
    sleep 5;
};