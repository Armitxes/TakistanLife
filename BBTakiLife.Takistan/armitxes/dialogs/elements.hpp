class Portal
{
	name=Portal;
	idd=5000;
	movingEnable=1;
	controlsBackground[]={portalBack};
	objects[]={};
	controls[]={frmPortal, lblTitle, lblTitleNew, lblNewLong, frmCredits, lblLostPW, lblPortalLostPWLong, frmPortalLogin, lblInfo, lblInfoLong, lblProfIDDesc, lblProfID, btnLogin};

	class frmPortal: RscFrame
	{
		idc = -1;
		text = " Portal ";
		x = 0.149277 * safezoneW + safezoneX;
		y = 0.141915 * safezoneH + safezoneY;
		w = 0.70184 * safezoneW;
		h = 0.710411 * safezoneH;
		colorBackground[] = {255,0,0,255};
	};
	class lblTitle: RscStructuredTitleText
	{
		idc = -1;
		text = "Welcome to British Borders!";
		x = 0.15469 * safezoneW + safezoneX;
		y = 0.163953 * safezoneH + safezoneY;
		w = 0.691013 * safezoneW;
		h = 0.0272971 * safezoneH;
		colorBackground[] = {0,-1,-1,0};
	};
	class lblTitleNew: RscStructuredTitleText
	{
		idc = -1;
		text = "First time on our servers?";
		x = 0.158557 * safezoneW + safezoneX;
		y = 0.209401 * safezoneH + safezoneY;
		w = 0.249419 * safezoneW;
		h = 0.0259197 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class lblNewLong: RscStructuredText
	{
		idc = -1;
		x = 0.158557 * safezoneW + safezoneX;
		y = 0.245209 * safezoneH + safezoneY;
		w = 0.257153 * safezoneW;
		h = 0.236639 * safezoneH;
		text = "Please make sure that you read the Rules on our Website before you start playing!<br />For questions please visit the support channels on our TS3.<br /><br />COPS (BLUFOR) AND UN (Independent) MUST BE ON TS3!<br /><br />Spawns are greenzones, do not commit any crimes there!";
		colorText[] = {255,255,255,255};
		colorBackground[] = {-1,-1,-1,0};
		colorBackgroundActive[] = {-1,-1,-1,0};
	};
	class frmCredits: RscFrame
	{
		idc = -1;
		text = " BETA BUILD - made by Armitxes";
		x = 0.149277 * safezoneW + safezoneX;
		y = 0.816766 * safezoneH + safezoneY;
		w = 0.70184 * safezoneW;
		h = 0.0355607 * safezoneH;
	};
	class lblLostPW: RscStructuredTitleText
	{
		idc = -1;
		text = "Login is not working!";
		x = 0.167839 * safezoneW + safezoneX;
		y = 0.523412 * safezoneH + safezoneY;
		w = 0.242459 * safezoneW;
		h = 0.0286742 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class lblPortalLostPWLong: RscStructuredText
	{
		idc = -1;
		x = 0.168611 * safezoneW + safezoneX;
		y = 0.566107 * safezoneH + safezoneY;
		w = 0.244779 * safezoneW;
		h = 0.193944 * safezoneH;
		text = "Don't panic!<br />The Server might be busy<br />Don't spam-click the 'Start playing' button! It'll only give you less priority as punishment.<br /><br />Count down from 10 and click on 'Start playing' then your stats will load!";
		colorText[] = {255,255,255,255};
		colorBackground[] = {-1,-1,-1,0};
	};
	class frmPortalLogin: RscFrame
	{
		idc = -1;
		text = " Login / Registration ";
		x = 0.426144 * safezoneW + safezoneX;
		y = 0.22042 * safezoneH + safezoneY;
		w = 0.404093 * safezoneW;
		h = 0.240768 * safezoneH;
	};
	class lblInfo: RscStructuredTitleText
	{
		idc = -1;
		text = "Information";
		x = 0.456302 * safezoneW + safezoneX;
		y = 0.515152 * safezoneH + safezoneY;
		w = 0.356917 * safezoneW;
		h = 0.02592 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class lblInfoLong: RscStructuredText
	{
		idc = -1;
		text = "Website: www.britishborders.co.uk<br />TeamSpeak3: bbts3.com";
		x = 0.45321 * safezoneW + safezoneX;
		y = 0.553715 * safezoneH + safezoneY;
		w = 0.360011 * safezoneW;
		h = 0.0562192 * safezoneH;
		colorText[] = {255,255,255,255};
		colorBackground[] = {-1,-1,-1,0};
	};
	class lblProfIDDesc: RscStructuredTitleText
	{
		idc = -1;
		text = "Profile ID:";
		x = 0.43001 * safezoneW + safezoneX;
		y = 0.267246 * safezoneH + safezoneY;
		w = 0.122587 * safezoneW;
		h = 0.0272971 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class lblProfID: RscStructuredTitleText
	{
		idc = 1;
		text = "????????";
		x = 0.625672 * safezoneW + safezoneX;
		y = 0.271378 * safezoneH + safezoneY;
		w = 0.113307 * safezoneW;
		h = 0.0286743 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class btnLogin: RscButton
	{
		idc = -1;
		text = "Start playing";
		action="[""load""] execVM ""armitxes\_db.sqf"";";
		x = 0.452438 * safezoneW + safezoneX;
		y = 0.392576 * safezoneH + safezoneY;
		w = 0.352277 * safezoneW;
		h = 0.0424467 * safezoneH;
	};
	class portalBack:RscBackground
	{
		idc=-1;
		x = 0.149277 * safezoneW + safezoneX;
		y = 0.141915 * safezoneH + safezoneY;
		w = 0.70184 * safezoneW;
		h = 0.710411 * safezoneH;
	};
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

class professions {
    idd = 1602;
    movingEnable = 1;
    enableSimulation = true;

    class controlsBackground {
        class bgProfession: RscFrame
        {
        	idc = -1;
        	x = 0.235902 * safezoneW + safezoneX;
        	y = 0.149928 * safezoneH + safezoneY;
        	w = 0.528196 * safezoneW;
        	h = 0.700143 * safezoneH;
            colorBackground[] = { 1, 1, 1, 0.3 };
        };
    };
    class objects {};  
    class controls {
        class lstProfessions: RscListBox
        {
        	idc = 1;
        	x = 0.249107 * safezoneW + safezoneX;
        	y = 0.219943 * safezoneH + safezoneY;
        	w = 0.151856 * safezoneW;
        	h = 0.588121 * safezoneH;
        };
        class lblProfessions: RscText
        {
        	idc = -1;
        	text = "Professions";
        	x = 0.249107 * safezoneW + safezoneX;
        	y = 0.177934 * safezoneH + safezoneY;
        	w = 0.0726269 * safezoneW;
        	h = 0.0280057 * safezoneH;
        };
        class lblProfDesc: RscStructuredText
        {
        	idc = 2;
        	text = "Please select a profession for more details.";
        	x = 0.414168 * safezoneW + safezoneX;
        	y = 0.219943 * safezoneH + safezoneY;
        	w = 0.336725 * safezoneW;
        	h = 0.532109 * safezoneH;
			class Attributes { align = "left"; };
        };
        class btnJob: RscButton
        {
        	text = "Accept Profession";
        	x = 0.618844 * safezoneW + safezoneX;
        	y = 0.780057 * safezoneH + safezoneY;
        	w = 0.132049 * safezoneW;
        	h = 0.0280057 * safezoneH;
			action = "[""select"",_this] execVM ""armitxes\profession.sqf"";";
        };
    };
};
class chat {
  idd = 93005;
	movingEnable = 1;
  
  class controlsBackground {
    class lblChatType: RscText
    {
    	idc = 1000;
    	text = "Global";
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
    	text = "";
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
