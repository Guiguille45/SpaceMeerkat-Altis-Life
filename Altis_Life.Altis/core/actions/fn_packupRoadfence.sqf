/*
    File: fn_packupRoadfence.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_Roadfence"];
_Roadfence = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_Roadfence") exitWith {};

if(([true,"Roadfence",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez enlevé le Roadfence","PLAIN"];
    player removeAction life_action_RoadfencePickup;
    life_action_RoadfencePickup = nil;
    deleteVehicle _Roadfence;
};