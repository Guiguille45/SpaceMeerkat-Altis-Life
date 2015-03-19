/*
        File: fn_MedicEnter.sqf
        Author: Shad
        
        Description:
        les medics entre dans les vehicules verrouiller
*/
if(playerSide != independent) exitWith {};
private ["_position","_veh"];
_position = _this select 3;

switch (_position) do
{
        case "driver":
        {
                cursorTarget lock false;
                player action ["getInDriver", cursorTarget];
                cursorTarget lock true;
        };
        case "passenger":
        {
                cursorTarget lock false;
                player action ["getInCargo", cursorTarget];
                cursorTarget lock true;
        };
        case "exit":
        {
                _veh = vehicle player;
                _veh lock false;
                player action ["getOut", _veh];
                _veh lock true;
        };
};