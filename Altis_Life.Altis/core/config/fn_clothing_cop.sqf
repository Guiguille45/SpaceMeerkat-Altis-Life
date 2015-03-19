#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_Rangemaster","Cop Uniform",25];
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret pushBack ["U_O_Wetsuit",nil,4000];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam_worn",nil,1000];
		};
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_Cap_blk",nil,500];
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret pushBack ["H_HelmetB_black",nil,500];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Balaclava_blk",nil,25]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,800];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret pushBack ["V_TacVest_blk",nil,1000];
			_ret pushBack ["V_RebreatherB",nil,1000];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret pushBack ["V_PlateCarrier1_blk",nil,1000];
			_ret pushBack ["V_TacVestIR_blk",nil,1000];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Carryall_khk",nil,2500],
			["B_Parachute",nil,2500]
		];
	};
};

_ret;