_pos = [2681.147217,1277.027832,0.0626717];
_object = createVehicle ["Land_Atm_01_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 250;
_object setPosATL _pos;
_object setVariable ["R3F_LOG_disabled", true, true];
_object enableSimulation false;
_object allowDamage false;