#define ST_RIGHT 0x01

class osefStatusBar {
	idd = -1;
	onLoad = "uiNamespace setVariable ['osefStatusBar', _this select 0]";
	onUnload = "uiNamespace setVariable ['osefStatusBar', objNull]";
	onDestroy = "uiNamespace setVariable ['osefStatusBar', objNull]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class statusBarText {
			idc = 1000;
			x = safezoneX + safezoneW - 2.35;
			y = safezoneY + safezoneH - 0.08;
			w = 1.6;
			h = 0.04;
			shadow = 1;
			colorBackground[] = { 1, 0.3, 0, 0.0 };
			font = "PuristaBold";
			size = 0.04;
			type = 13;
			style = 0;
			text="Chargement statusBar...";
			class Attributes {
				align="right";
				color = "#FFFFFF";
			};
		};
	};
};