/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

if(life_inv_handcuffs > 0) then
{
	life_inv_handcuffs = life_inv_handcuffs + 1;
} else {
	[true,"handcuffs",1] call life_fnc_handleInv;
};

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
_unit say3D "menotte";

[[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;