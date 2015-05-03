_units = _this select 0;
if (isNil {zod_stakedown_showhint}) then {zod_stakedown_showhint = false;};
if (isNil {zod_stakedown_showtext}) then {zod_stakedown_showtext = true;};

if (isNil {_units}) then{ 
_units = allUnits;
};

_killtime = 1;
_killchance = 1;
_mindamage = 0.5;
_usesalute = true;


zod_stakedown_script = {
  private ["_unit"];
  _unit = _this;


if (zod_stakedown_showtext) then {  
  _unit addAction [("<img image='client\icons\stab.paa'/> Slit Throat"), "addons\takedown\zod_stakedown.sqf","", 6, true, true, "Salute", "(_target == _this)&&((cursorTarget distance _this)<2)&&(alive cursorTarget)&&(side cursorTarget != side _this)&&(cursorTarget isKindOf 'Man')"];
} else{
  _unit addAction [("<img image='client\icons\stab.paa'/> Slit Throat"), "addons\takedown\zod_stakedown.sqf","", 6, false, true, "Salute", "(_target == _this)&&((cursorTarget distance _this)<2)&&(alive cursorTarget)&&(side cursorTarget != side _this)&&(cursorTarget isKindOf 'Man')"];
}


};

{ 
  _x addEventHandler [
    "Respawn",	// Respawn event handler
	{
	// Find the newly-respawned unit
	  private ["_unit"];
	  _unit = _this select 0;
          _unit call zod_stakedown_script;	
	}
	];
  _x call zod_stakedown_script;

  _x setVariable["zod_stakedown_killtime", _killtime];
  _x setVariable["zod_stakedown_killchance", _killchance];
  _x setVariable["zod_stakedown_mindamage", _mindamage];
  _x setVariable["zod_stakedown_usesalute", _usesalute];

} foreach _units;