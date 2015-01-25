class ARM_RscPicture {
	shadow = 0;
	type = 0;
	style = 48;
	sizeEx = 0.023;
	font = "TahomaB";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class ARM_RscFrameButton : RscButton {
	idc = -1;
	style = 64;
	sizeEx = 0.02;
	text = "";
  colorText[]               = {-1,-1,-1,-1};
  colorActive[]             = {-1,-1,-1,-1};
  colorDisabled[]           = {-1,-1,-1,-1};
  colorBackground[]         = {-1,-1,-1,-1};
  colorBackgroundActive[]   = {-1,-1,-1,-1};
  colorBackgroundDisabled[] = {-1,-1,-1,-1};
  colorFocused[]            = {-1,-1,-1,-1};
  colorShadow[]             = {-1,-1,-1,-1};
  colorBorder[]             = {-1,-1,-1,-1};
};

class ArmiPhone {
	idd = -1;
	movingEnable = 1;
	enableSimulation = true;

  class controlsBackground {
    class bgPhone: ARM_RscPicture
    {
    	idc = 1200;
    	text = "armitxes\img\phone.paa";
    	x = 0.0818 * safezoneW + safezoneX;
    	y = 0.17 * safezoneH + safezoneY;
    	w = 0.244375 * safezoneW;
    	h = 0.396 * safezoneH;
      colorText[] = {1,1,1,1};
    };  
  };
  class objects {};  
  class controls {
    class RscFrame_1800: ARM_RscFrameButton
    {
    	idc = 1800;
    	x = 0.0931719 * safezoneW + safezoneX;
    	y = 0.202 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['call_cop'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
    };
    class RscFrame_1801: ARM_RscFrameButton
    {
    	idc = 1801;
    	x = 0.131741 * safezoneW + safezoneX;
    	y = 0.2019 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['call_medic'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
    };
    class RscFrame_1802: ARM_RscFrameButton
    {
    	idc = 1802;
    	x = 0.170309 * safezoneW + safezoneX;
    	y = 0.2019 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['call_un'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
    };
    class RscFrame_1803: ARM_RscFrameButton
    {
    	idc = 1803;
    	x = 0.0931719 * safezoneW + safezoneX;
    	y = 0.26482 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "openMap true; closeDialog 0;";
    };
    class RscFrame_1804: ARM_RscFrameButton
    {
    	idc = 1804;
    	x = 0.131741 * safezoneW + safezoneX;
    	y = 0.26482 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['use'] execVM 'handy.sqf';";
    };
    class RscFrame_1805: ARM_RscFrameButton
    {
    	idc = 1805;
    	x = 0.170309 * safezoneW + safezoneX;
    	y = 0.26482 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "['vote'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
    };
    class RscFrame_1806: ARM_RscFrameButton
    {
    	idc = 1806;
    	x = 0.170309 * safezoneW + safezoneX;
    	y = 0.4527 * safezoneH + safezoneY;
    	w = 0.0373437 * safezoneW;
    	h = 0.0598519 * safezoneH;
      action = "createDialog 'MainMenu';";
    };
  };
};