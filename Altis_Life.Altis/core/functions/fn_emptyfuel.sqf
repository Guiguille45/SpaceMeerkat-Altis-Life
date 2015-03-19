/*
      Created by Acidcorp TeamBrK.net - All right reserved !
      Date: 08.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
      Thanks you Mokomoko
*/

private["_vehicleToFuel","_fuelLast","_fuelEnMoins","_pourcentFuelEnMoins"];

sleep 2;

_pourcentFuelEnMoins = 100; 

while{true} do
{
    _vehicleToFuel = (vehicle player);
    
    if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && (_vehicleToFuel != player) ) then
    {
		 
		_fuelLast = fuel vehicle player;
		
		//waitUntil {!alive _vehicleToFuel || (fuel _vehicleToFuel) != _fuelLast};
		
		sleep 1;
		
		_vehicleToFuel = (vehicle player);
		
		switch (typeOf (_vehicleToFuel)) do {
			case "B_Heli_Light_01_F":{ _pourcentFuelEnMoins = 300; };
			case "C_Heli_Light_01_civil_F":{ _pourcentFuelEnMoins = 300; };
			case "O_Heli_Light_02_unarmed_F":{ _pourcentFuelEnMoins = 300; };
			case "I_Heli_Transport_02_F":{ _pourcentFuelEnMoins = 300; };
			case "O_Heli_Transport_04_F":{ _pourcentFuelEnMoins = 300; };
			case "O_Heli_Transport_04_repair_F":{ _pourcentFuelEnMoins = 300; };
			case "O_Heli_Transport_04_covered_F":{ _pourcentFuelEnMoins = 300; };
			case "O_Heli_Transport_04_box_F":{ _pourcentFuelEnMoins = 300; };
			case "O_Heli_Transport_04_medevac_F":{ _pourcentFuelEnMoins = 100; };
			case "O_Heli_Transport_04_ammo_F":{ _pourcentFuelEnMoins = 100; };
			case "O_Heli_Transport_04_bench_F":{ _pourcentFuelEnMoins = 100; };
			case "B_Truck_01_transport_F":{ _pourcentFuelEnMoins = 1500; };
			case "B_Truck_01_covered_F":{ _pourcentFuelEnMoins = 1500; };
			case "B_Truck_01_fuel_F":{ _pourcentFuelEnMoins = 1500; };
			case "B_Truck_01_Repair_F":{ _pourcentFuelEnMoins = 1500; };
			case "B_Truck_01_box_F":{ _pourcentFuelEnMoins = 1500; };
			case "B_Heli_Transport_03_unarmed_F":{ _pourcentFuelEnMoins = 300; };
			case "B_Heli_Transport_03_F":{ _pourcentFuelEnMoins = 100; };
			case "B_Heli_Attack_01_F":{ _pourcentFuelEnMoins = 100; };
			case "B_Heli_Light_01_armed_F":{ _pourcentFuelEnMoins = 100; };
			case "O_Heli_Light_02_F":{ _pourcentFuelEnMoins = 100; };
			case "B_Heli_Transport_01_F":{ _pourcentFuelEnMoins = 100; };
			case "O_Heli_Attack_02_black_F":{ _pourcentFuelEnMoins = 100; };
			case "I_Heli_light_03_unarmed_F":{ _pourcentFuelEnMoins = 100; };
			case "B_Heli_Transport_01_camo_F":{ _pourcentFuelEnMoins = 100; };
			case "O_Plane_CAS_02_F":{ _pourcentFuelEnMoins = 100; };
			case "I_Plane_Fighter_03_AA_F":{ _pourcentFuelEnMoins = 100; };
			case "B_Plane_CAS_01_F":{ _pourcentFuelEnMoins = 100; };
			case "I_Plane_Fighter_03_CAS_F":{ _pourcentFuelEnMoins = 100; };
			case "C_Offroad_01_F":{ _pourcentFuelEnMoins = 1000; };
			case "C_Hatchback_01_sport_F":{ _pourcentFuelEnMoins = 1000; };
			case "C_Hatchback_01_F":{ _pourcentFuelEnMoins = 1000; };
			case "C_SUV_01_F":{ _pourcentFuelEnMoins = 1000; };
			case "B_Quadbike_01_F":{ _pourcentFuelEnMoins = 2500; };
			case "C_Kart_01_Blu_F":{ _pourcentFuelEnMoins = 600; };
			case "C_Kart_01_Fuel_F":{ _pourcentFuelEnMoins = 600; };
			case "C_Kart_01_Red_F":{ _pourcentFuelEnMoins = 600; };
			case "C_Kart_01_Vrana_F":{ _pourcentFuelEnMoins = 600; };
			case "B_MRAP_01_F":{ _pourcentFuelEnMoins = 600; };
			case "B_MRAP_01_hmg_F":{ _pourcentFuelEnMoins = 600; };
			case "I_MRAP_03_F":{ _pourcentFuelEnMoins = 600; };
			case "I_MRAP_03_hmg_F":{ _pourcentFuelEnMoins = 600; };
			case "C_Van_01_transport_F":{ _pourcentFuelEnMoins = 600; };
			case "C_Van_01_box_F":{ _pourcentFuelEnMoins = 600; };
			case "C_Van_01_Fuel_F":{ _pourcentFuelEnMoins = 600; };
			case "I_G_Van_01_fuel_F":{ _pourcentFuelEnMoins = 600; };
			default { _pourcentFuelEnMoins = 2000; };
		};
        
		_fuelEnMoins = ((_pourcentFuelEnMoins/100)*(_fuelLast - (fuel _vehicleToFuel)));
	
		//hint parseText format["%1, %2 au lieu de %3 %4 %5",(fuel _vehicleToFuel),_fuelEnMoins,(_fuelLast - (fuel _vehicleToFuel)),_pourcentFuelEnMoins,_fuelLast];
	
		_vehicleToFuel setFuel ((fuel _vehicleToFuel) - _fuelEnMoins);		
		
        if(fuel _vehicleToFuel < 0.3 && fuel _vehicleToFuel > 0.28) then
        {
            hint "Vous n'avez plus beaucoup d'essence. Allez faire le plein dans une station !";
        }
        else
        {
            if(fuel _vehicleToFuel < 0.03) then
            {
                hint "Trop tard, Vous n'avez plus d'essence.";
            };
        };
    } else {		
		sleep 5;
	};
};