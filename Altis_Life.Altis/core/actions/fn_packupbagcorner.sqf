/*
    File: fn_packupbagcorner.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_bagcorner"];
_bagcorner = nearestObjects[getPos player,["Land_BagFence_Long_F"],8] select 0;
if(isNil "_bagcorner") exitWith {};

if(([true,"bagcorner",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez enlevé le bagcorner","PLAIN"];
    player removeAction life_action_bagcornerPickup;
    life_action_bagcornerPickup = nil;
    deleteVehicle _bagcorner;
};