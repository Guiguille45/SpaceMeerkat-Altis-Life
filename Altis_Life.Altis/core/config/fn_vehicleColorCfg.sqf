/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"]
		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","vip"],
			[_path + "hatchback_01_ext_sport02_co.paa","vip"],
			[_path + "hatchback_01_ext_sport03_co.paa","vip"],
			[_path + "hatchback_01_ext_sport04_co.paa","vip"],
			[_path + "hatchback_01_ext_sport05_co.paa","vip"],
			[_path + "hatchback_01_ext_sport06_co.paa","vip"],
			["#(ai,64,64,1)Fresnel(1.3,7)","civ"],
			["textures\cop\hayon_gendarme.jpg","cop"],
			["textures\civ\hayon_orange.jpg","vip"],
			["textures\civ\hayon_cocc.jpg","vip"],
			["textures\civ\hayon_tribal.jpg","vip"]
		];
	};
		
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","fed"],
			["#(ai,64,64,1)Fresnel(1.3,7)","fed"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","vip"],
			["textures\cop\offroad_gendarme.jpg","cop"],
			["textures\med\offroad_med.jpg","med"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["textures\civ\hayon_orange.jpg","civ"],
			["textures\civ\hayon_cocc.jpg","civ"],
			["textures\civ\hayon_tribal.jpg","vip"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","fed"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","fed"],
			["textures\cop\suv_gendarme.jpg","cop"],
			["textures\med\suv_medic.jpg","med"],
			["textures\civ\suv_subaru.jpg","vip"],
			["textures\civ\suv_simpson.jpg","civ"],
			["textures\civ\suv_ferrari.jpg","vip"],
			["textures\reb\suv_rebelle.jpg","reb"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","vip"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","vip"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","fed"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","vip"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","vip"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","vip"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"],
			["textures\cop\quad_gendarme.jpg","cop"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","merc"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","vip"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","vip"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["textures\med\humm_medic.jpg","med"],
			["textures\cop\humm_gendarme.jpg","fed"]
		];
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		_ret = 
		[
		["textures\civ\humm_ferme.jpg","vip"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","vip"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","fed"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","vip"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","vip"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
		["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
		["textures\cop\humm_gendarme.jpg","cop"],
		["textures\med\humm_medic.jpg","med"]
		];
		
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","cop"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","merc"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\med\orca_medic.jpg","med"]
		];
	};
	
	case "O_MRAP_02_F":
	{
		_ret = 
		[
			["\A3\soft_F\MRAP_02\Data\mrap_02_ext_01_co.paa","reb","\A3\soft_F\MRAP_02\Data\mrap_02_ext_02_co.paa"],
			["textures\reb\ifrit_av0.jpg","merc","textures\reb\ifrit_ar0.jpg"]
		];
	};
	
	case "O_MRAP_02_hmg_F":
	{
		_ret = 
		[
			["\A3\soft_F\MRAP_02\Data\mrap_02_ext_01_co.paa","reb","\A3\soft_F\MRAP_02\Data\mrap_02_ext_02_co.paa"],
			["textures\reb\ifrit_av0.jpg","merc","textures\reb\ifrit_ar0.jpg"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["textures\cop\hunter_gendarme.jpg","cop"]
		];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_ret = 
		[
			["textures\cop\hunter_gendarme.jpg","cop"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[	
			["textures\cop\Strider_gign.jpg","cop"]
		];
	};

	case "I_MRAP_03_hmg_F":
	{
		_ret = 
		[	
			["textures\cop\Strider_gign.jpg","cop"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret = 
		[	
			["textures\cop\helcat_gign.jpg","cop"]
		];
	};
	
	case "I_Heli_light_03_F":
	{
		_ret = 
		[	
			["textures\cop\helcat_gign.jpg","cop"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
};

_ret;