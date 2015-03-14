/*
    File: fn_baglong.sqf
    Author: seraphins
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_bagcorner"];
_bagcorner = "Land_BagFence_Long_F" createVehicle [0,0,0];
_bagcorner attachTo[player,[0,5.5,0.2]];
_bagcorner setDir 90;
_bagcorner setVariable["item","bagcornerDeployed",true];

life_action_bagcornerDeploy = player addAction["<t color='#00FF00'>sac de sable</t>",{if(!isNull life_bagcorner) then {detach life_bagcorner; life_bagcorner = ObjNull;}; player removeAction life_action_bagcornerDeploy; life_action_bagcornerDeploy = nil;},"",999,false,false,"",'!isNull life_bagcorner'];
life_bagcorner = _bagcorner;
waitUntil {isNull life_bagcorner};
if(!isNil "life_action_bagcornerDeploy") then {player removeAction life_action_bagcornerDeploy;};
if(isNull _bagcorner) exitWith {life_bagcorner = ObjNull;};
_bagcorner setPos [(getPos _bagcorner select 0),(getPos _bagcorner select 1),0];
_bagcorner allowDamage false;