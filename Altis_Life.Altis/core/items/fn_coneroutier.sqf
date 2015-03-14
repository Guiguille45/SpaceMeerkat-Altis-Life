/*
    File: fn_mauer.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_coneroutier"];
_coneroutier = "RoadCone_L_F" createVehicle [0,0,0];
_coneroutier attachTo[player,[0,5.5,0.2]];
_coneroutier setDir 90;
_coneroutier setVariable["item","coneroutierDeployed",true];

life_action_coneroutierDeploy = player addAction["<t color='#00FF00'>cone routier</t>",{if(!isNull life_coneroutier) then {detach life_coneroutier; life_coneroutier = ObjNull;}; player removeAction life_action_coneroutierDeploy; life_action_coneroutierDeploy = nil;},"",999,false,false,"",'!isNull life_coneroutier'];
life_coneroutier = _coneroutier;
waitUntil {isNull life_coneroutier};
if(!isNil "life_action_coneroutierDeploy") then {player removeAction life_action_coneroutierDeploy;};
if(isNull _coneroutier) exitWith {life_coneroutier = ObjNull;};
_coneroutier setPos [(getPos _coneroutier select 0),(getPos _coneroutier select 1),0];
_coneroutier allowDamage false;