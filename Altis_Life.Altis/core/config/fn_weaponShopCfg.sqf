#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_recrue":
	{
		switch(true) do
		{
			case (playerSide != west): {"vous n'etes pas gendarme!"};
			default
			{
				["Altis Cop 1er classe",
					[
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["Laserdesignator",nil,2500],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",100],
						["ItemRadio","CellPhone",500]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"vous n'etes pas medecin!"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000],
						["ItemRadio","CellPhone",500]
					]
				];
			};
		};
	};

	case "cop_brigadier":
	{
		switch(true) do
		{
			case (playerSide != west): {"vous n'etes pas gendarme!"};
			case (__GETC__(life_coplevel) < 2): {"vous n'avez pas ce grade!"};
			default
			{
				["Altis brigadier Shop",
					[
						["SMG_02_ACO_F",nil,30000],
						["30Rnd_9x21_Mag",nil,100],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000]
					]
				];
			};
		};
	};

	case "cop_gendarme":
	{
		switch(true) do
		{
			case (playerSide != west): {"vous n'etes pas gendarme!"};
			case (__GETC__(life_coplevel) < 3): {"vous n'avez pas ce grade!"};
			default
			{
				["Altis gendarme Shop",
					[
						["arifle_MXC_Holo_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000]
						
					]
				];
			};
		};
	};
	
	case "cop_adjudant":
	{
		switch(true) do
		{
			case (playerSide != west): {"vous n'etes pas gendarme!"};
			case (__GETC__(life_coplevel) < 4): {"vous n'avez pas ce grade!"};
			default
			{
				["Altis adjudant Shop",
					[
						["arifle_MX_Hamr_pointer_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Arco",nil,1500],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000]
					]
				];
			};
		};
	};
	
	case "cop_major":
	{
		switch(true) do
		{
			case (playerSide != west): {"vous n'etes pas gendarme!"};
			case (__GETC__(life_coplevel) < 5): {"vous n'avez pas ce grade!"};
			default
			{
				["Altis major Shop",
					[
						["arifle_MX_SW_Hamr_pointer_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Arco",nil,1500],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000]
					]
				];
			};
		};
	};
	
	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"vous n'etes pas gendarme!"};
			case (__GETC__(life_coplevel) < 6): {"vous n'avez pas ce grade!"};
			default
			{
				["Altis lieutenant Shop",
					[
						["arifle_MXM_Hamr_pointer_F",nil,30000],
						["30Rnd_65x39_caseless_mag",nil,100],
						["optic_Arco",nil,1500],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["launch_NLAW_F",Bazooka,200000],
						["NLAW_F",Roquette,50000]
					]
				];
			};
		};
	};
	
	case "cop_capitaine":
	{
		switch(true) do
		{
			case (playerSide != west): {"vous n'etes pas gendarme!"};
			case (__GETC__(life_coplevel) < 7): {"vous n'avez pas ce grade!"};
			default
			{
				["Altis Capitaine Shop",
					[
						["srifle_EBR_Hamr_pointer_F",nil,30000],
						["20Rnd_762x51_Mag",nil,100],
						["optic_Arco",nil,1500],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000]
						
					]
				];
			};
		};
	};
	
	case "cop_gign":
	{
		switch(true) do
		{
			case (playerSide != west): {"vous n'etes pas gendarme!"};
			case (!license_civ_gign): {"vous ne faite pas parti du GIGN!"};
			default
			{
				["Altis GIGN Shop",
					[
						["hgun_Pistol_heavy_02_Yorris_F",nil,5000],
						["srifle_EBR_Hamr_pointer_F",nil,30000],
						["LMG_Mk200_MRCO_F",nil,80000],
						["srifle_GM6_LRPS_F",nil,80000],
						["srifle_LRR_LRPS_F",nil,80000],
						["6Rnd_45ACP_Cylinder",nil,100],
						["20Rnd_762x51_Mag",nil,100],
						["200Rnd_65x39_cased_Box",nil,200],
						["5Rnd_127x108_Mag",nil,200],
						["7Rnd_408_Mag",nil,200],
						["muzzle_snds_B",nil,1000],
						["muzzle_snds_L",nil,1000],
						["muzzle_snds_H_MG",nil,1000],
						["optic_Arco",nil,1500],
						["optic_LRPS",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_tws",nil,1500],
						["optic_DMS",nil,1500],
						["optic_Nightstalker",nil,1500],
						["HandGrenade_Stone","Flashbang",1500],
						["MiniGrenade",nil,1500],
						["NVGoggles_OPFOR",nil,2000],
						["ItemRadio","CellPhone",500],
						["B_UavTerminal","telecommande",500],
						["Laserbatteries",nil,500]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Vous n'avez pas l'entrainement rebelle!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
                    	["NVGoggles",nil,2000],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,150],
                        ["ItemRadio","CellPhone",500],
						["arifle_TRG20_F",nil,45000],
						["arifle_Katiba_F",nil,80000],
						["srifle_DMR_01_F",nil,90000],
						["arifle_SDAR_F",nil,45000],
						["LMG_Zafir_F",nil,180000],
						["srifle_GM6_F",nil,500000],
						["muzzle_snds_L",nil,1500],
						["muzzle_snds_M",nil,1500],
						["muzzle_snds_B",nil,1500],
						["muzzle_snds_H",nil,1500],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["optic_Arco",nil,3600],
						["optic_SOS",nil,10000],
						["optic_MRCO",nil,3500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275],
						["150Rnd_762x51_Box",nil,450],
						["5Rnd_127x108_Mag",nil,500],
						["ItemRadio","CellPhone",500]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["ItemRadio","CellPhone",500]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["ItemRadio","CellPhone",500]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300],
				["ItemRadio","CellPhone",500]
			]
		];
	};

	case "merc":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'etes pas civil!"};
			case (!license_civ_mercenaire): {"Vous ne faite pas parti de la milice!"};
			case (!license_civ_rebel): {"Vous n'avez pas l'entrainement rebelle!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Altis Milice Store",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300],
						["muzzle_snds_L",nil,1500],
						["muzzle_snds_M",nil,1500],
						["muzzle_snds_B",nil,1500],
						["muzzle_snds_H",nil,1500],
						["optic_Hamr",nil,7500],
						["optic_Arco",nil,3600],
						["optic_MRCO",nil,3500],
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["arifle_Mk20_F","nil",80000],
						["arifle_Mk20_GL_F","nil",80000],
						["30Rnd_556x45_Stanag","nil",250],
						["30Rnd_556x45_Stanag_Tracer_Red","nil",250],
						["1Rnd_SmokeRed_Grenade_shell","nil",500],
						["1Rnd_SmokeYellow_Grenade_shell","nil",500]
					]
				];
			};
		};
	};
};