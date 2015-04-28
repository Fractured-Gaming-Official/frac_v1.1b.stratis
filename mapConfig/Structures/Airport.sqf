_pos = [1897.79126,5711.791504,-4.76837e-007];
_object = createVehicle ["Land_NavigLight", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;
_object setVariable ["R3F_LOG_disabled", true, true];
_object enableSimulation false;
_object allowDamage false;

