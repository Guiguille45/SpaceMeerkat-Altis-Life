/*
    File: fn_packupbunker.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_bunker"];
_bunker = nearestObjects[getPos player,["Land_BagBunker_Small_F"],8] select 0;
if(isNil "_bunker") exitWith {};

if(([true,"bunker",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez enlevé le bunker","PLAIN"];
    player removeAction life_action_bunkerPickup;
    life_action_bunkerPickup = nil;
    deleteVehicle _bunker;
};