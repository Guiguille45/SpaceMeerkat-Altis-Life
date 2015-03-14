#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = ObjNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_vehgod = false; //car gm
life_god = false; //gm
life_frozen = false; //gele joueur
life_markers = false; //joueur
life_handcuffs = ObjNull; //menotte
life_handcuffkeys = ObjNull; //clé menotte

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,5000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,6); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,200000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,30000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
life_cash = 0;
__CONST__(life_impound_car,2000);
__CONST__(life_impound_boat,4000);
__CONST__(life_impound_air,4000);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 10000; //Starting Bank Money
		life_paycheck = 5000; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 10000; //Starting Bank Money
		life_paycheck = 1500; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 7000;
		life_paycheck = 5000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = [""];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_mauer",
	"life_inv_bunker",
	"life_inv_bagcorner",
	"life_inv_coneroutier",
	"life_inv_Roadfence",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_kidney",
	"life_inv_aluminum",
	"life_inv_sulfur",
	"life_inv_grenadebact",
	"life_inv_handcuffs",
	"life_inv_handcuffkeys"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_gign","cop"],
	["license_cop_cg","cop"],
	["license_civ_vip","civ"],
	["license_civ_mercenaire","civ"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_grenade","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["handcuffs",1000],["handcuffkeys",200],["grenadebact",10000],["heroinu",2000],["heroinp",5000],["cocaine",2500],["cocainep",7000],["marijuana",4000],["turtle",8000],["mauer",3000],["bunker",3000],["bagcorner",3000],["coneroutier",3000],["spikeStrip",3000],["Roadfence",3000],["blastingcharge",30000],["boltcutter",3000],["kidney",50000]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",1850],
	["heroinp",2650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",3200],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",2000],
	["iron_r",3200],
	["copper_r",1500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["mauer",1200],
	["bunker",1200],
	["bagcorner",1200],
	["coneroutier",1200],
	["Roadfence",1200],
	["cement",1950],
	["goldbar",95000],
	["kidney",50000],
	["aluminum",1],
	["sulfur",1],
	["grenadebact",1],
	["handcuffs",200],
	["handcuffkeys",100]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",1000],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",50000],
	["boltcutter",5000],
	["defusekit",2500],
	["mauer",1200],
	["bunker",1200],
	["bagcorner",1200],
	["coneroutier",1200],
	["Roadfence",1200],
	["storagebig",150000],
	["kidney",75000],
	["handcuffs",1000],
	["handcuffkeys",200]
	
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_Quadbike_01_F",1000],
	["C_Hatchback_01_F",2000],
	["C_Offroad_01_F",2000],
	["C_Offroad_01_repair_f",5000],
	["B_G_Offroad_01_F",5000],
	["B_G_Offroad_01_repair_F",5000],
	["C_SUV_01_F",2000],
	["C_Van_01_transport_F",8500],
	["C_Hatchback_01_sport_F",6500],
	["C_Van_01_fuel_F",8500],
	["I_G_Van_01_fuel_F",8500],
	["I_Heli_Transport_02_F",15000],
	["C_Van_01_box_F",8500],
	["I_Truck_02_transport_F",10000],
	["I_Truck_02_covered_F",10000],
	["O_Truck_02_fuel_F",10000],
	["O_Truck_02_box_F",10000],
	["B_Truck_01_transport_F",13000],
	["B_Truck_01_covered_F",13000],
	["B_Truck_01_box_F",13000],
	["B_Truck_01_Repair_F",13000],
	["B_Truck_01_fuel_F",13000],
	["B_Truck_01_medical_F",13000],
	["O_Truck_03_transport_F",15000],
	["O_Truck_03_covered_F",15000],
	["O_Truck_03_fuel_F",15000],
	["O_Truck_03_medical_F",15000],
	["O_Truck_03_repair_F",15000],
	["O_Truck_03_device_F",50000],
	["O_MRAP_02_F",50000],
	["O_MRAP_02_hmg_F",100000],
	["B_Heli_Light_01_F",9000],
	["C_Heli_Light_01_civil_F",9000],
	["O_Heli_Light_02_unarmed_F",12000],
	["O_Heli_Light_02_F",50000],
	["O_Heli_Transport_04_F",50000],
	["C_Rubberboat",1000],
	["C_Boat_Civil_01_F",1000],
	["B_Boat_Transport_01_F",2000],
	["C_Boat_Civil_01_police_F",1000],
	["B_Boat_Armed_01_minigun_F",7000],
	["B_SDV_01_F",5000],
	["B_MRAP_01_F",5000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",2000],
	["C_Hatchback_01_F",6650],
	["C_Offroad_01_F",9000],
	["C_Offroad_01_repair_f",9000],
	["B_G_Offroad_01_F",9000],
	["B_G_Offroad_01_repair_F",9000],
	["C_SUV_01_F",23000],
	["C_Van_01_transport_F",35000],
	["C_Hatchback_01_sport_F",180000],
	["C_Van_01_fuel_F",67500],
	["I_G_Van_01_fuel_F",67500],
	["I_Heli_Transport_02_F",612000],
	["C_Van_01_box_F",52500],
	["I_Truck_02_transport_F",78000],
	["I_Truck_02_covered_F",95000],
	["O_Truck_02_fuel_F",110000],
	["O_Truck_02_box_F",157000],
	["B_Truck_01_transport_F",184000],
	["B_Truck_01_covered_F",263000],
	["B_Truck_01_box_F",525000],
	["B_Truck_01_Repair_F",420000],
	["B_Truck_01_fuel_F",341000],
	["B_Truck_01_medical_F",224000],
	["O_Truck_03_transport_F",184000],
	["O_Truck_03_covered_F",262500],
	["O_Truck_03_fuel_F",341000],
	["O_Truck_03_medical_F",378000],
	["O_Truck_03_repair_F",420000],
	["O_Truck_03_device_F",900000],
	["O_MRAP_02_F",350000],
	["B_Heli_Light_01_F",161000],
	["C_Heli_Light_01_civil_F",165000],
	["O_Heli_Light_02_unarmed_F",185500],
	["O_Heli_Transport_04_F",150000],
	["C_Rubberboat",3500],
	["C_Boat_Civil_01_F",15400],
	["B_Boat_Transport_01_F",2000],
	["C_Boat_Civil_01_police_F",14000],
	["B_Boat_Armed_01_minigun_F",52500],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",70000]
];
__CONST__(life_garage_sell,life_garage_sell);
