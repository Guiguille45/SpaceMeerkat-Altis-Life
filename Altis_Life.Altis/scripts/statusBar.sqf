waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Osef (Ported to EpochMod by piX)
	Edited by: [piX]
	Description: Puts a small bar in the bottom centre of screen to display in-game information
	
	PLEASE KEEP CREDITS - THEY ARE DUE TO THOSE WHO PUT IN THE EFFORT!

*/
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
systemChat format["Bienvenue sur SpaceMeerkat", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 18000;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		_time = (round(480-(serverTime)/60));  //480 = nombre de minutes avant restart - programmé pour un restart de 8h - si vous modifié la valeur il vous faudra aussi modifier le filtre scripts.txt de BattlEye
		_hours = (floor(_time/60));
		_minutes = (_time - (_hours * 60));
		
		switch(_minutes) do
	{
		case 9: {_minutes = "09"};
		case 8: {_minutes = "08"};
		case 7: {_minutes = "07"};
		case 6: {_minutes = "06"};
		case 5: {_minutes = "05"};
		case 4: {_minutes = "04"};
		case 3: {_minutes = "03"};
		case 2: {_minutes = "02"};
		case 1: {_minutes = "01"};
		case 0: {_minutes = "00"};
	};
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | Joueur connecté : %2 | Restart dans : %3:%4 | Teamspeak3 : 37.59.158.67:8030 ", round diag_fps, count playableUnits, _hours, _minutes, _counter];
	}; 
};
