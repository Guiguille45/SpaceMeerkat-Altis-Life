/*
    File: fn_packupconeroutier.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_coneroutier"];
_coneroutier = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_coneroutier") exitWith {};

if(([true,"coneroutier",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez enlevé le cone routier","PLAIN"];
    player removeAction life_action_coneroutierPickup;
    life_action_coneroutierPickup = nil;
    deleteVehicle _coneroutier;
};