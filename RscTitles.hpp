class RscTitles
{
#define screenwidth  (1 - safeZonex*2)
#define screenheight (1 - safeZoney*2)

	class Rtags
	{
		idd=64431;
		movingEnable = true;
		fadein       =  0;
		fadeout      =  0;
		duration     =  0.1;
		name="TAGS_HUD";
		controls[]={"interact"};
		onLoad="uiNamespace setVariable ['TAGS_HUD', _this select 0]";

		class interact
		{
			type = 0;
			idc = 64438;
			style = 0;
			x = 0.50;
			y = 0.47;
			w = 0.6;
			h = 0.2;
			font = "Zeppelin33Italic";
			sizeEx = 0.03;
			colorText[] = {0, 1, 0, 0.8};
			colorBackground[]={0,0,0,0.0};
			text = "";
		};

	};
};
