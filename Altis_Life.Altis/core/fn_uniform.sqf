/*
    Uniform Script
    Author: Eldayia
    Created for http://altisdev.com
*/

    #define __GETC__(var) (call var)
    
    if (playerSide != independent) then
	{
		if ((uniform player) == "U_Rangemaster") then
		{
			if (__GETC__(life_coplevel) > 0) then { player setObjectTextureGlobal [0, "textures\uniform_gendarme.jpg"];}; //Tenue gendarme - Cop
		};
		if ((uniform player) == "U_B_CombatUniform_mcam_worn") then
		{
			if (__GETC__(life_coplevel) > 3) then { player setObjectTextureGlobal [0, "textures\uniform_gign.jpg"];}; //Tenue d'interventions - Cop
		};
	} else {
        if ((uniform player) == "U_Rangemaster") then { player setObjectTextureGlobal [0, "textures\medic_uniform.jpg"];}; //Tenue d'intendant - Medic
    };

