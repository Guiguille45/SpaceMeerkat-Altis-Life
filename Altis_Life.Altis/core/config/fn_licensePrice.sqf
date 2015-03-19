/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {10000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {40000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "gign": {500000000}; //Gign License cost
	case "vip": {500000000}; //vip License cost
	case "merc": {500000000}; //mercenaire License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {150000}; //Heroin processing license cost
	case "marijuana": {100000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {500000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {50000};
	case "salt": {10000};
	case "cocaine": {200000};
	case "sand": {20000};
	case "iron": {25000};
	case "copper": {30000};
	case "cement": {10000};
	case "mair": {15000};
	case "home": {200000};
	case "grenade": {250000};
};
