#include <macro.h>
/*
    File: fn_vehadminGodMode.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description: Enables God mode for Admin
*/

if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

[] spawn {
while {dialog} do {
closeDialog 0;
sleep 0.01;
};
};

if(life_vehgod) then {
    life_vehgod = false;
    titleText ["God mode vehicule désactivé","PLAIN"]; titleFadeOut 2;
    vehicle player allowDamage true;
    vehicle player setfuel 1;
	vehicle player setvehicleammo 1;
	vehicle player setdamage 0;
	sleep 0.5;
    [] call life_fnc_hudUpdate;
} else {
    life_vehgod = true;
    titleText ["God mode vehicule activé","PLAIN"]; titleFadeOut 2;
    vehicle player allowDamage false;
    vehicle player setfuel 1;
	vehicle player setvehicleammo 1;
	vehicle player setdamage 0;
	sleep 0.5;
    [] call life_fnc_hudUpdate;
};