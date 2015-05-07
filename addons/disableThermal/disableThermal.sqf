// disableTheral.sqf
// by CRE4MPIE
// ver 0.2
// 2015-04-29 11:44pm
// contributions from BIStudio Forums, edited by CRE4MPIE


_layer = 85125; 
_launchers =["launch_I_Titan_short_F","launch_O_Titan_short_F","launch_B_Titan_short_F","launch_Titan_short_F","launch_Titan_F","launch_O_Titan_F","launch_I_Titan_F","launch_B_Titan_F","Laserdesignator"];  // launcher array


while {true} do 
{ 
if (currentVisionMode player == 2) then																		// check for TI Mode
{
	if (currentweapon player in _launchers) then															// check if player has launcher as current weapon
		{ 																										
            _layer    cutText ["Thermal Imaging OFFLINE!.","BLACK",-1];										// Blackout screen with Text
			playSound "FD_CP_Not_Clear_F";
            waituntil {currentVisionMode player != 2};
            _layer cutText ["", "PLAIN"];
		}
	else
		{
	if (alive (getConnectedUAV player)) then																// check if player is connected to a UAV			
	{																											
            _layer    cutText ["Thermal Imaging OFFLINE while connected to a UAV terminal!.","BLACK",-1];	// Blackout screen with Text
			playSound "FD_CP_Not_Clear_F";
            waituntil {currentVisionMode player != 2};
            _layer cutText ["", "PLAIN"];
	};
		};
			sleep 1;
};
};
