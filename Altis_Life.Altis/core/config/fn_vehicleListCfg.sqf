#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",5000],
			["C_SUV_01_F",10000],
			["I_Truck_02_medical_F",150000],
			["O_Truck_03_medical_F",280000],
			["B_Truck_01_medical_F",250000]
		];
	};
	
	case "med_air_hs": {
		_return = [
			["B_Heli_Light_01_F",175000],
			["C_Heli_Light_01_civil_F",175000],
			["O_Heli_Light_02_unarmed_F",185000],
			["O_Heli_Transport_04_medevac_F",185000]
		];
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",3000],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",15000],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",50000],
			["C_Van_01_box_F",75000]
		];
	};
	
	case "car_vip":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",8700],
			["C_Offroad_01_F",12000],
			["C_SUV_01_F",30000],
			["C_Van_01_transport_F",45000],
			["C_Van_01_box_F",70000],
			["C_Hatchback_01_sport_F",200000]
		];
	};

	case "civ_truck":
	{
		_return =
		[
			["I_G_Van_01_fuel_F",87000],
			["I_Truck_02_transport_F",112500],
			["I_Truck_02_covered_F",135000],
			["O_Truck_02_fuel_F",157500],
			["O_Truck_02_box_F",225000],
			["B_Truck_01_transport_F",262500],
			["B_Truck_01_covered_F",375000],
			["B_Truck_01_fuel_F",487500],
			["B_Truck_01_Repair_F",600000],
			["B_Truck_01_box_F",750000]
		];
	};

	case "truck_vip" :
	{
		_return =
		[
			["O_Truck_03_transport_F",262500],
			["O_Truck_03_covered_F",375000],
			["O_Truck_02_box_F",225000],
			["O_Truck_03_fuel_F",487500],
			["O_Truck_03_medical_F",540000],
			["O_Truck_03_repair_F",600000]
		];
	};

	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_SUV_01_F",55000],
			["B_G_Offroad_01_F",30000],
			["O_MRAP_02_F",600000],
			["B_Heli_Light_01_F",500000],
			["O_Heli_Transport_04_F",1450000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",1000000]];
			_return set[count _return,
			["O_Heli_Transport_04_box_F",1550000]];
		};
		if(license_civ_vip) then
		{
			_return set[count _return,
			["O_MRAP_02_hmg_F",1550000]];
			_return set[count _return,
			["O_Truck_03_device_F",1400000]];
			_return set[count _return,
			["O_Heli_Transport_04_repair_F",1550000]];
			_return set[count _return,
			["O_Heli_Transport_04_covered_F",1550000]];
		};
	};

	case "merc":
	{
		_return =
		[
			["B_G_Offroad_01_F",25000],
			["C_Hatchback_01_sport_F",200000],
			["B_Heli_Light_01_F",280000],
			["O_Heli_Light_02_unarmed_F",730000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["O_MRAP_02_F",580000]];
			_return set[count _return,
			["O_MRAP_02_hmg_F",1350000]];
			_return set[count _return,
			["O_Heli_Transport_04_F",1300000]];
		};
	};

	case "cop_car":
	{
		_return set[count _return,
		["B_Quadbike_01_F",4000]];
		_return set[count _return,
		["C_Offroad_01_F",10000]];
		_return set[count _return,
		["C_SUV_01_F",35000]];

		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",80000]];
			_return set[count _return,
			["B_Truck_01_mover_F",100000]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["C_Van_01_box_F",35000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_MRAP_01_hmg_F",80000]];
			_return set[count _return,
			["C_Hatchback_01_sport_F",150000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return set[count _return,
			["I_APC_Wheeled_03_cannon_F",150000]];
		};
		if(license_cop_gign) then
		{
			_return set[count _return,
			["I_MRAP_03_F",100000]];
			_return set[count _return,
			["I_MRAP_03_hmg_F",150000]];
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",300000],
			["C_Heli_Light_01_civil_F",350000],
			["O_Heli_Light_02_unarmed_F",750000]
		];
	};

	case "air_vip":
	{
		_return = 
		[
			["B_Heli_Light_01_F",260000],
			["C_Heli_Light_01_civil_F",320000],
			["I_Heli_Transport_02_F",830000],
			["B_Heli_Transport_03_unarmed_F",950000]
		];
	};
	
	case "cop_air":
	{
		_return set[count _return,
		["C_Heli_Light_01_civil_F",175000]];
		
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",125000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["O_Heli_Transport_04_bench_F",200000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_Heli_Transport_03_F",300000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return set[count _return,
			["B_Heli_Attack_01_F",50000]];
		};
		if(license_cop_gign) then
		{
			_return set[count _return,
			["B_UAV_01_F",4000]];
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",125000]];
			_return set[count _return,
			["I_Heli_light_03_F",125000]];
			_return set[count _return,
			["B_Heli_Transport_01_camo_F",250000]];
		};
	};
	
	case "cop_airhq":
	{
		_return set[count _return,
		["C_Heli_Light_01_civil_F",175000]];
		
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",125000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["O_Heli_Transport_04_bench_F",200000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_Heli_Transport_03_F",300000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return set[count _return,
			["B_Heli_Attack_01_F",50000]];
		};
		if(license_cop_gign) then
		{
			_return set[count _return,
			["B_UAV_01_F",4000]];
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",125000]];
			_return set[count _return,
			["I_Heli_light_03_F",125000]];
			_return set[count _return,
			["B_Heli_Transport_01_camo_F",250000]];
		};
	};	

	case "cop_air_avion":
		{
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["O_Plane_CAS_02_F",165000]];
			_return set[count _return,
			["I_Plane_Fighter_03_AA_F",250000]];
			_return set[count _return,
			["B_Plane_CAS_01_F",250000]];
			return set[count _return,
			["I_Plane_Fighter_03_CAS_F",250000]];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "ship_vip":
	{
		_return =
		[
			["B_SDV_01_F",100000]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",75000],
			["I_SDV_01_F",100000]
		];
	};
};

_return;
