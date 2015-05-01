_pos = [3276.00683594,2947.0627441,0.401779];
_object = createVehicle ["Land_Atm_01_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 140;
_object setPosATL _pos;
_object setVariable ["R3F_LOG_disabled", true, true];
_object enableSimulation false;
_object allowDamage false;