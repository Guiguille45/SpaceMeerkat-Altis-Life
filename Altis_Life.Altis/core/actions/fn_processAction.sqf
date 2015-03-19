/*
File: fn_processAction.sqf
Author: Bryan "Tonic" Boardwine
edited by theInfinit (to process 2 Item to a combination)
Description:
Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_oldItem3","_oldItem4","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_oldVal3","_oldVal4","_ui","_progress","_pgText","_cP","_error","_multivar"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};


_error = false;
_itemInfo = switch (_type) do
{
  case "oil": {["oilu","oilp",1000,"Processing Oil",1];}; //Le 1 correspond au nombre d'item dans le process (4 maxi pour le moment)
  case "diamond": {["diamond","diamondc",1000,"Processing Diamond",1]};
  case "heroin": {["heroinu","heroinp",1000,"Processing Heroin",1]};
  case "copper": {["copperore","copper_r",500,"Processing Copper",1]};
  case "iron": {["ironore","iron_r",800,"Processing Iron",1]};
  case "sand": {["sand","glass",450,"Processing Sand",1]};
  case "salt": {["salt","salt_r",450,"Processing Salt",1]};
  case "cocaine": {["cocaine","cocainep",1000,"Processing Cocaine",1]};
  case "marijuana": {["cannabis","marijuana",800,"Processing Marijuana",1]};
  case "cement": {["rock","cement",650,"Mixing Cement",1]};
  case "grenade": {["aluminum","grenadebact",1500,"Fabrication des grenades",3,"sulfur","apple"]}; //Lorsqu'il y a plus de 1 item, rajouter les autres a la suite.
  default {[]};
};


//Error checking
if(count _itemInfo == 0) exitWith {};


//Setup vars.
_multivar = _itemInfo select 4;
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;


//multivars
if (_multivar != 1) then {
	switch (_multivar) do {
	  case 2: {_oldItem2 = _itemInfo select 5;};
	  
	  case 3: {_oldItem2 = _itemInfo select 5;
			   _oldItem3 = _itemInfo select 6;};

	  case 4: {_oldItem2 = _itemInfo select 5;
			   _oldItem3 = _itemInfo select 6;
			   _oldItem4 = _itemInfo select 7};
	  default {};
	};
};


_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);


//multivars
if (_multivar != 1) then {
	switch (_multivar) do {
	  case 2: {_oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle);};
	  
	  case 3: {_oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle);
			   _oldVal3 = missionNamespace getVariable ([_oldItem3,0] call life_fnc_varHandle);};
			   
	  case 4: {_oldVal2 = missionNamespace getVariable ([_oldItem2,0] call life_fnc_varHandle);
			   _oldVal3 = missionNamespace getVariable ([_oldItem3,0] call life_fnc_varHandle);
			   _oldVal4 = missionNamespace getVariable ([_oldItem4,0] call life_fnc_varHandle);};
	  default {};
	};
};


if (_multivar != 1) then {
	switch (_multivar) do {
	  case 2: {if(_oldVal2 == 0) then {_error = true;};};
	  
	  case 3: {if(_oldVal2 == 0) then {_error = true;};
			   if(_oldVal3 == 0) then {_error = true;};};
			   
	  case 4: {if(_oldVal2 == 0) then {_error = true;};
			   if(_oldVal3 == 0) then {_error = true;};
			   if(_oldVal4 == 0) then {_error = true;};};
	  default {};
	};
};


if(_error) exitWith{hint "Tu n'as pas les ingrédients nécessaires"};


_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};


//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;


life_is_processing = true;


if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.25;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Vous devez rester à moins de 10m pour process!"; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	if (_multivar != 1) then {
		switch (_multivar) do {
		  case 2: {([false,_oldItem2,_oldVal2] call life_fnc_handleInv);};
		  case 3: {([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
				   ([false,_oldItem3,_oldVal3] call life_fnc_handleInv);};
		  case 4: {([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
				   ([false,_oldItem3,_oldVal3] call life_fnc_handleInv);
				   ([false,_oldItem4,_oldVal4] call life_fnc_handleInv);};
		  default {};
		};
	};

	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
else
{
	if(life_cash < _cost) exitWith {hint format[localize "STR_Process_License",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};


	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Vous devez rester à moins de 10m pour process!"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash < _cost) exitWith {hint format["Vous avez besoin de %1€ pour process sans licence!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};


	if (_multivar != 1) then {
		switch (_multivar) do {
		  case 2: {([false,_oldItem2,_oldVal2] call life_fnc_handleInv);};
		  case 3: {([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
				   ([false,_oldItem3,_oldVal3] call life_fnc_handleInv);};
		  case 4: {([false,_oldItem2,_oldVal2] call life_fnc_handleInv);
				   ([false,_oldItem3,_oldVal3] call life_fnc_handleInv);
				   ([false,_oldItem4,_oldVal4] call life_fnc_handleInv);};
		  default {};
		};
	};

	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format[localize "STR_Process_Processed2",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	life_is_processing = false;
};
