class chat {
  idd = 93005;
	movingEnable = 1;
  
  class controlsBackground {
    class lblChatType: RscText
    {
    	idc = 1000;
    	text = "Global"; //--- ToDo: Localize;
    	x = 0.00593747 * safezoneW + safezoneX;
    	y = 0.93202 * safezoneH + safezoneY;
    	w = 0.06375 * safezoneW;
    	h = 0.0850039 * safezoneH;
      sizeEx = 0.040;
    	colorText[] = {255,-1,-1,1};
    };
  };
  class objects {};
  class controls {
    class txtChat: RscEdit
    {
    	idc = 1404;
    	text = ""; //--- ToDo: Localize;
    	x = 0.0584191 * safezoneW + safezoneX;
    	y = 0.95475 * safezoneH + safezoneY;
    	w = 0.932344 * safezoneW;
    	h = 0.0340016 * safezoneH;
    	colorText[] = {255,255,255,1};
    	colorBackground[] = {255,-1,-1,1};
    	colorActive[] = {255,-1,-1,1};
    };
  };
};
