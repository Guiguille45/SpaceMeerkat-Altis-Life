/*
    File: fn_Roadfence.sqf
    Author: seraphins
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_Roadfence"];
_Roadfence = "Land_BarGate_F" createVehicle [0,0,0];
_Roadfence attachTo[player,[0,5.5,0.2]];
_Roadfence setDir 90;
_Roadfence setVariable["item","RoadfenceDeployed",true];

life_action_RoadfenceDeploy = player addAction["<t color='#00FF00'>Barrage routier</t>",{if(!isNull life_Roadfence) then {detach life_Roadfence; life_Roadfence = ObjNull;}; player removeAction life_action_RoadfenceDeploy; life_action_RoadfenceDeploy = nil;},"",999,false,false,"",'!isNull life_Roadfence'];
life_Roadfence = _Roadfence;
waitUntil {isNull life_Roadfence};
if(!isNil "life_action_RoadfenceDeploy") then {player removeAction life_action_RoadfenceDeploy;};
if(isNull _Roadfence) exitWith {life_Roadfence = ObjNull;};
_Roadfence setPos [(getPos _Roadfence select 0),(getPos _Roadfence select 1),0];
_Roadfence allowDamage false;