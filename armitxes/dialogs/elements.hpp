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
		text = "Welcome to Takistan Life!";
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
		text = "Please make sure that you read the Rules on our Website before you start playing!<br /><br />For questions please visit the support channels on our discord or visit our website<br /><br />Spawns are greenzones, do not commit any crimes there!";
		colorText[] = {255,255,255,255};
		colorBackground[] = {-1,-1,-1,0};
		colorBackgroundActive[] = {-1,-1,-1,0};
	};
	class frmCredits: RscFrame
	{
		idc = -1;
		text = " BETA BUILD - made by Armitxes (armitxes.net) ";
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
		text = "Big thanks to Tonic for the creation of Takistan Life!<br />Takistan Life: Rise of South is a complete overhaul and continues the story of Takistan Life: Revolution!<br />Since Feb. 2013 TKL:RoS is being developed by Armitxes and open for every community to use/develop on.<br /><br />Network Website: armitxes.net";
		x = 0.45321 * safezoneW + safezoneX;
		y = 0.553715 * safezoneH + safezoneY;
		w = 0.360011 * safezoneW;
		h = 0.262192 * safezoneH;
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
		class bgPhone: ARM_RscPicture {
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
		class RscFrame_1800: ARM_RscFrameButton {
			idc = 1800;
			x = 0.0931719 * safezoneW + safezoneX;
			y = 0.202 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "['call_cop'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
		};
		class RscFrame_1801: ARM_RscFrameButton {
			idc = 1801;
			x = 0.131741 * safezoneW + safezoneX;
			y = 0.2019 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "['call_medic'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
		};
		class RscFrame_1802: ARM_RscFrameButton {
			idc = 1802;
			x = 0.170309 * safezoneW + safezoneX;
			y = 0.2019 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "['call_un'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
		};
		class RscFrame_1803: ARM_RscFrameButton {
			idc = 1803;
			x = 0.0931719 * safezoneW + safezoneX;
			y = 0.26482 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "openMap true; closeDialog 0;";
		};
		class RscFrame_1804: ARM_RscFrameButton {
			idc = 1804;
			x = 0.131741 * safezoneW + safezoneX;
			y = 0.26482 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "['use'] execVM 'handy.sqf';";
		};
		class RscFrame_1805: ARM_RscFrameButton {
			idc = 1805;
			x = 0.170309 * safezoneW + safezoneX;
			y = 0.26482 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "['vote'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
		};
		class RscFrame_1806: ARM_RscFrameButton {
			idc = 1806;
			x = 0.170309 * safezoneW + safezoneX;
			y = 0.4527 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "createDialog 'MainMenu';";
		};
		class RscFrame_1807: ARM_RscFrameButton {
			idc = 1807;
			x = 0.0931719 * safezoneW + safezoneX;
			y = 0.322 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "['atm'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
		};
		class RscFrame_1808: ARM_RscFrameButton {
			idc = 1808;
			x = 0.131741 * safezoneW + safezoneX;
			y = 0.322 * safezoneH + safezoneY;
			w = 0.0373437 * safezoneW;
			h = 0.0598519 * safezoneH;
			action = "['call_taxi'] execVM 'armitxes\phone.sqf'; closeDialog 0;";
		};
	};
};

class modPlayerSelection {
	idd = -1;
	movingEnable = 1;
	enableSimulation = true;

	controlsBackground[] = {IGUIBack_2200};
	class objects {};
	controls[] = {lblPlrDesc,lstPlayers};
	class IGUIBack_2200: RscBackground
	{
		idc = -1;
		x = 0.235902 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.528196 * safezoneW;
		h = 0.45 * safezoneH;
		colorBackground[] = { 0, 0, 0, 0.8 };
	};
	class lblPlrDesc: RscStructuredText
	{
	    idc = 1;
	    text = "Players";
	    x = 0.242505 * safezoneW + safezoneX;
	    y = 0.23 * safezoneH + safezoneY;
	    w = 0.0990367 * safezoneW;
	    h = 0.0280057 * safezoneH;
		class Attributes { align = "left"; };
	};
	class lstPlayers: RscListBox
	{
	    idc = 2;
	    x = 0.242505 * safezoneW + safezoneX;
	    y = 0.261951 * safezoneH + safezoneY;
	    w = 0.0990367 * safezoneW;
	    h = 0.350072 * safezoneH;
	};
};

class sergeantmenu : modPlayerSelection {
	idd = 1606;
	movingEnable = 1;
	enableSimulation = true;
	controls[] = {lblPlrDesc,lstPlayers,lblDistDesc,lstDistricts,lblPlrInfo,btnConfirm};
	class lblDistDesc: RscStructuredText
	{
	    idc = 10;
	    text = "Districts";
	    x = 0.35 * safezoneW + safezoneX;
	    y = 0.23 * safezoneH + safezoneY;
	    w = 0.0990367 * safezoneW;
	    h = 0.0280057 * safezoneH;
		class Attributes { align = "left"; };
	};
	class lstDistricts: RscListBox
	{
	    idc = 11;
	    x = 0.35 * safezoneW + safezoneX;
	    y = 0.261951 * safezoneH + safezoneY;
	    w = 0.0990367 * safezoneW;
	    h = 0.350072 * safezoneH;
	};
	class lblPlrInfo: RscStructuredText
	{
	    idc = 12;
	    text = "~ INFO ~";
	    x = 0.45 * safezoneW + safezoneX;
	    y = 0.261951 * safezoneH + safezoneY;
	    w = 0.4 * safezoneW;
	    h = 0.3 * safezoneH;
		class Attributes { align = "left"; };
	};
	class btnConfirm: RscButton
	{
		idc = -1;
		text = "Confirm";
		action="[""assignDistrict""] execVM ""armitxes\districts.sqf"";";
		x = 0.65 * safezoneW + safezoneX;
		y = 0.6 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.03 * safezoneH;
	};
}

class professions {
	idd = 1602;
	movingEnable = 1;
	enableSimulation = true;

	class controlsBackground {
		class bgProfession: RscBackground {
			idc = -1;
			x = 0.235902 * safezoneW + safezoneX;
			y = 0.149928 * safezoneH + safezoneY;
			w = 0.528196 * safezoneW;
			h = 0.700143 * safezoneH;
			colorBackground[] = { 0, 0, 0, 0.8 };
		};
	};
	class objects {};
	class controls {
		class lstProfessions: RscListBox {
			idc = 1;
			x = 0.249107 * safezoneW + safezoneX;
			y = 0.219943 * safezoneH + safezoneY;
			w = 0.151856 * safezoneW;
			h = 0.588121 * safezoneH;
		};
		class lblProfessions: RscText {
			idc = -1;
			text = "Professions";
			x = 0.249107 * safezoneW + safezoneX;
			y = 0.177934 * safezoneH + safezoneY;
			w = 0.0726269 * safezoneW;
			h = 0.0280057 * safezoneH;
		};
		class lblProfDesc: RscStructuredText {
			idc = 2;
			text = "Please select a profession for more details.";
			x = 0.414168 * safezoneW + safezoneX;
			y = 0.219943 * safezoneH + safezoneY;
			w = 0.336725 * safezoneW;
			h = 0.532109 * safezoneH;
			class Attributes { align = "left"; };
		};
		class btnJob: RscButton {
			text = "Accept Profession";
			x = 0.618844 * safezoneW + safezoneX;
			y = 0.780057 * safezoneH + safezoneY;
			w = 0.132049 * safezoneW;
			h = 0.0280057 * safezoneH;
			action = "[""select"",_this] execVM ""armitxes\profession.sqf"";";
		};
	};
};
class ArmiID:liste_1_button {
	idd = 1601;
	movingEnable = 1;
	enableSimulation = true;

	controlsBackground[] = {bgID,bgLics};
	class objects {};
	controls[] = {lizenzen,lblName,lblFaction,lblRank,lblNation,lblUID};
	class bgID: ARM_RscPicture {
		idc = -1;
		text = "armitxes\img\id.paa";
		x = 0.235902 * safezoneW + safezoneX;
		y = 0.15 * safezoneH + safezoneY;
		w = 0.4 * safezoneW;
		h = 0.6 * safezoneH;
		class Attributes { align = "left"; };
	};
	class bgLics: RscBackground {
		y = 0.15 * safezoneH + safezoneY;
		x = 0.6;w = 0.3;h = 0.86;
		colorBackground[] = { 0, 0, 0, 0.8 };
	};
	class lizenzen: spielerliste {
		y = 0.15 * safezoneH + safezoneY;
		x = 0.6;w = 0.3;
		colorBackground[] = {0.14, 0.18, 0.13, 0.8};
	};
	class lblName: RscStructuredText {
		idc = 10;
		text = "";
		x = 0.335 * safezoneW + safezoneX;
		y = 0.212 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.03 * safezoneH;
		class Attributes { align = "left"; };
		colorText[] = { 0, 0, 0, 1 };
	};
	class lblFaction: RscStructuredText {
		idc = 11;
		text = "Faction: Factionless";
		x = 0.335 * safezoneW + safezoneX;
		y = 0.232 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.03 * safezoneH;
		class Attributes { align = "left"; };
		colorText[] = { 0, 0, 0, 1 };
	};
	class lblRank: RscStructuredText {
		idc = 12;
		text = "Rank: None";
		x = 0.335 * safezoneW + safezoneX;
		y = 0.252 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.03 * safezoneH;
		class Attributes { align = "left"; };
		colorText[] = { 0, 0, 0, 1 };
	};
	class lblNation: RscStructuredText {
		idc = 13;
		text = "Nation";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.31 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.03 * safezoneH;
		colorText[] = { 100, 100, 100, 1 };
	};
	class lblUID: RscStructuredText {
		idc = 14;
		text = "UID";
		x = 0.3 * safezoneW + safezoneX;
		y = 0.33 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.03 * safezoneH;
		size = 0.03;
		colorText[] = { 100, 100, 100, 1 };
	};
};
class chat {
	idd = 93005;
	movingEnable = 1;

	class controlsBackground {
		class lblChatType: RscText {
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
		class txtChat: RscEdit {
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

class AL_RscProgress
{
	type = 8;
	style = 0;
	colorFrame[] = {0,0,0,1};
	colorBar[] = {1,1,1,1};
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	w = 0.8;
	h = 0.03;
};
class progressBar
{
	idd = 2459;
	onLoad = "((_this select 0) displayCtrl -1) progressSetPosition 0.5";
	class Controls
	{
		class Progress: AL_RscProgress
		{
			idc = 1;
			x = 0.38 * safezoneW + safezoneX;
			y = 0.195 * safezoneH + safezoneY;
			h = 0.025 * safezoneH;
			w = 0.25 * safezoneW;
		};
		class lblText: RscStructuredText
        {
            idc = 2;
            text = "Loading...";
            x = 0.38 * safezoneW + safezoneX;
            y = 0.2 * safezoneH + safezoneY;
            w = 0.242431 * safezoneW;
            h = 0.14304 * safezoneH;
            colorBackground[] = {0,0,0,0};
        };
	};
};
