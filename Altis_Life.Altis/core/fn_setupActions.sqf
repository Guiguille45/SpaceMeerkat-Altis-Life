/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case west:
	{
		//entrer dans un vehicule meme verouillé
		life_actions = life_actions + [player addAction["Monter en conducteur",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']];
		life_actions = life_actions + [player addAction["Monter en passager",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']]; 
		life_actions = life_actions + [player addAction["Descendre",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Barrière clignotante</t>",life_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Bunker</t>",life_fnc_packupbunker,"",0,false,false,"",' _bunker = nearestObjects[getPos player,["Land_BagBunker_Small_F"],8] select 0; !isNil "_bunker" && !isNil {(_bunker getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Sac de Sable</t>",life_fnc_packupbagcorner,"",0,false,false,"",' _bagcorner = nearestObjects[getPos player,["Land_BagFence_Long_F"],8] select 0; !isNil "_bagcorner" && !isNil {(_bagcorner getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Cone routier</t>",life_fnc_packupconeroutier,"",0,false,false,"",' _coneroutier = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_coneroutier" && !isNil {(_coneroutier getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Barrage routier</t>",life_fnc_packupRoadfence,"",0,false,false,"",' _Roadfence = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0; !isNil "_Roadfence" && !isNil {(_Roadfence getVariable "item")}']];
		//Saisir Armes et Chargeurs
		life_actions = life_actions + [player addAction["<t color='#ED7F10'>Saisir Armes et Uniformes</t>",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
	};
	
	case independent:
	{
		//entrer dans un vehicule meme verouillé
		life_actions = life_actions + [player addAction["Monter en conducteur",life_fnc_MedicEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']];
		life_actions = life_actions + [player addAction["Monter en passager",life_fnc_MedicEnter,"passenger",100,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']]; 
		life_actions = life_actions + [player addAction["Descendre",life_fnc_MedicEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
	}; 
	
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"] && !(cursorTarget getVariable["robbed",FALSE]) ']];
		// take them organs
		life_actions = life_actions + [player addAction["Prélever les organes",life_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
	};
};