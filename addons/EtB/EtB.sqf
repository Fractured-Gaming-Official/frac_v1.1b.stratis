/*
	Stealthstick's "Explosive-To-Vehicle" Script
	-Allows players to attach their explosive charges to any vehicle.
*/

EtB_ChargeCheck =
{
	_charge = _this select 0;
	_unit = _this select 1;
	_hasIt = _charge in (magazines _unit);
	_boundingBoxVar = abs (((boundingBoxReal cursorTarget) select 0) select 1) + 3;
	_validBuilding = (cursorTarget isKindOf "Building" && {((cursorTarget distance _unit)<_boundingBoxVar) && {!(cursorTarget getVariable ["allowDamage",true]) && {!((typeOf cursorTarget) in ["Land_Dome_Big_F","Land_Dome_Small_F"])}}});
	_return = (_hasIt && _validBuilding && alive _unit);
	_return
};

EtB_TouchOff =
{
	_array = _this select 3;
	_unit = _array select 0;
	_explosives = _unit getVariable ["Bcharges",[]];
	_Buildings = _unit getVariable ["Bbuildings",[]];

	{	
		if(alive _x) then
		{
		_Building=_Buildings select _forEachIndex;
	
		[[_Building,true], "A3W_fnc_allowDamage", true, false, true] call BIS_fnc_MP;
		_Building setVariable ["allowDamage",true,true];
		
		_isDestructable = (getText(configfile >> "CfgVehicles" >> typeOf _Building >> "destrType")!="destructNo");
		_hasDestructionEffects = (count((configfile >> "CfgVehicles" >> typeOf _Building >> "DestructionEffects" ) call BIS_fnc_getCfgSubClasses)>0);
		sleep 1;
	
      "HelicopterExplobig" createVehicle (position _x);
			"HelicopterExplobig" createVehicle (position _x);
			deleteVehicle _x;

		if (_isDestructable && _hasDestructionEffects) then {
		sleep 1;
		[[_Building,false], "A3W_fnc_allowDamage", true, false, true] call BIS_fnc_MP;
		_Building setVariable ["allowDamage",false,true];
		}else{
		deleteVehicle _Building;
		};
		};
	
	} forEach _explosives;
	
	_unit setVariable ["Bcharges",[]];
	_unit setVariable ["Bbuildings",[]];
};

EtB_UnitCheck =
{
	private "_return";
	_unit = _this select 0;
	_explosives = _unit getVariable ["Bcharges",[]];
	if(count _explosives > 0) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};
	
	_return
};

EtB_AttachCharge =
{
	_array = _this select 3;
	_charge = _array select 0;
	_unit = _array select 1;
	private "_class";
	
	_unit removeMagazine _charge;
	_unit playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	
	switch _charge do
	{
		case "SatchelCharge_Remote_Mag":
		{
			_class = "SatchelCharge_Remote_Ammo";
		};
	};
	
	_Building = cursorTarget;
	_explosive = _class createVehicle (position player);
  _explosive setPosWorld (getPosWorld player);
	//_explosive attachTo [_unit, [0, 0, 0]]; 
	_random0 = random 180;
	_random1 = random 180;
	[_explosive,_random0,_random1] call BIS_fnc_SetPitchBank;
	[_explosive,_Building,_unit,_random0,_random1] spawn
	{		
		_explosive = _this select 0;
		_Building = _this select 1;
		_unit = _this select 2;
		_random0 = _this select 3;
		_random1 = _this select 4;
		
		sleep 1.5;
		//_explosive attachTo [_Building,[0, 0, 0]];
		[_explosive,_random0,_random1] call BIS_fnc_SetPitchBank;
		_unit setVariable ["Bcharges",(_unit getVariable ["Bcharges",[]]) + [_explosive]];
	_unit setVariable ["Bbuildings",(_unit getVariable ["Bbuildings",[]]) + [_Building]];
	};
};

EtB_ClosestExplosive =
{
	_unit = _this select 0;
	_Bcharges = _unit getVariable ["Bcharges",[]];
	_newArray = [];
	{_newArray = _newArray + [player distance _x];} forEach _Bcharges;
	_closest = _newArray call BIS_fnc_lowestNum;
	_selection = _newArray find _closest;
	_charge = _Bcharges select _selection;
	_charge
}; 

//[unit] spawn EtB_Actions;
EtB_Actions =
{
	private ["_unit"];
	_unit = _this select 0;
	_unit addAction ["<t color=""#FFE496"">" +"Attach Explosive Charge", EtB_AttachCharge, ["SatchelCharge_Remote_Mag",_unit], 1, true, true, "","['SatchelCharge_Remote_Mag',_target] call EtB_ChargeCheck"];
	_unit addAction ["<t color=""#FFE496"">" +"Touch off bomb(s)", EtB_TouchOff, [_unit], 1, true, true, "","[_target] call EtB_UnitCheck"];
};
//=======================
EtBInitialized = true;