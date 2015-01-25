
#define ReadAndWrite		0
#define ReadAndCreate		1
#define ReadOnly		2
#define ReadOnlyVerified		3

#define VSoft		0
#define VArmor		1
#define VAir		2

class CfgPatches {
	class Ribelion {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

//class RscText;	// External class reference
//class RscEdit;	// External class reference
class RscShortcutButton;	// External class reference
class RscControlsGroup;	// External class reference
//class RscListBox;	// External class reference

class RscGroupBox2 {
	type = VSoft;
	idc = -1;
	style = 112;
	text = "";
	colorBackground[] = {1, 1, 1, 0.6};
	colorText[] = {0, 0, 0, 0};
	font = "BitStream";
	sizeEx = 0.02;
};

class RscNiceButton {
	type = 16;
	idc = -1;
	style = 0;
	default = 0;
	x = 0.0 + 0.01;
	y = 0.0 + 0.15;
	w = 0.183825;
	h = 0.104575;
	color[] = {0.95, 0.95, 0.95, 1};
	color2[] = {1, 1, 1, 0.4};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	textureNoShortcut = "";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03521;
	sizeEx = 0.03521;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	action = "";
	
	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	
	class ShortcutPos {
		left = 0.004;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	
	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};

class RscLabel {
	idc = -1;
	type = VSoft;
	style = 0;
	text = "";
	font = "Zeppelin32";
	sizeEx = 0.02621;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	x = 0.0 + 0.4;
	y = 0.0 + 0.08;
	w = 0.4;
	h = 0.03;
};

class MyRscCombo {
	idc = -1;
	type = 4;
	style = 0;
	x = 0.0 + 0.365;
	y = 0.0 + 0.038;
	w = 0.301;
	h = 0.03;
	font = "TahomaB";
	sizeEx = 0.025;
	rowHeight = 0.025;
	wholeHeight = 4 * 0.2;
	color[] = {1, 1, 1, 1};
	colorText[] = {0, 0, 0, 1};
	colorBackground[] = {1, 1, 1, 1};
	colorSelect[] = {1, 0, 0, 1};
	colorSelectBackground[] = {0, 1, 0, 1};
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
	maxHistoryDelay = 10;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	period = 1;
	thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	border = "\ca\ui\data\ui_border_scroll_ca.paa";
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class MyTextBox {
	idc = -1;
	type = VAir;
	style = 0;
	colorBackground[] = {0.21, 0.08, 0.09, 0.5};
	x = 0.0 + 0.33;
	y = 0.0 + 0.389;
	w = 0.07;
	h = 0.03;
	sizeEx = 0.02;
	font = "BitStream";
	text = "";
	colorText[] = {1, 1, 1, 1};
	autocomplete = 0;
	colorSelection[] = {0, 0, 0, 1};
};

class MyCheckBox {
	idc = -1;
	type = 7;
	style = 2;
	x = 0.1;
	y = 0.18;
	w = 0.15;
	h = 0.15;
	colorText[] = {1, 0, 0, 1};
	color[] = {0, 1, 0, 1};
	colorTextSelect[] = {0, 0.8, 0, 1};
	coloSelectedBg[] = {0, 0, 0, 0};
	colorSelect[] = {0, 0, 0, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	font = "Zeppelin32";
	sizeEx = 0.0208333;
	rows = 3;
	columns = 2;
	strings[] = {"Entry 1", "Entry 2", "Entry 3", "Entry 4", "Entry 5", "Entry 6"};
	onCheckBoxesSelChanged = "hint format[""Checkbox change:\n%1\nEntry#: %2\nNewState: %3"",(_this select 0),(_this select 1),(_this select 2)];";
};



class dev_menu {
	idd = 93001;
	movingEnable = true;
  enableSimulation = true;
	
	class controlsBackground {
		class Drag : RscGroupBox2 {
			x = 0.1;
			y = 0.07;
			w = 0.4;
			h = 0.34;
			colorbackground[] = {0, 0, 0, 0.8};
			colortext[] = {0, 0, 0, 0};
			moving = 1;
		};
		
		class PlayerNameSubBackground1 : RscGroupBox2 {
			x = 0.11;
			y = 0.115;
			w = 0.38;
			h = 0.08;
			style = 128;
			colorBackground[] = {0.709, 0.972, 0.384, 0.2};
		};
		
		class PlayerExecCommSubBackground1 : RscGroupBox2 {
			x = 0.11;
			y = 0.0 + 0.26;
			w = 0.38;
			h = 0.08;
			style = 128;
			colorBackground[] = {0.709, 0.972, 0.384, 0.2};
		};
		
		class HeaderText : RscLabel {
			text = "Player Menu";
			x = 0.0 + 0.18;
			y = 0.0 + 0.08;
		};
	};
	
	class objects {};
	
	class controls {
		class lblPLName : RscLabel {
			text = "Player Name:";
			x = 0.0 + 0.11;
			y = 0.0 + 0.14;
		};
		
		class htxtplname : MyTextBox {
			idc = 93002;
			x = 0.0 + 0.218;
			y = 0.0 + 0.14;
			w = 0.19;
			text = "";
		};
		
		class btnTeleportPL : RscNiceButton {
			x = 0.0 + 0.11;
			y = 0.0 + 0.18;
			text = "Teleport";
			action = "teleTarget = ctrlText 93002;_runhandle = [] execVM ""remoteTele.sqf"";";
		};
		
		class btnDisableInputPL : RscNiceButton {
			x = 0.0 + 0.31;
			y = 0.0 + 0.18;
			text = "Disable Input";
			
			class TextPos {
				left = 0.019;
				top = 0.034;
				right = 0.005;
				bottom = 0.005;
			};
			action = "_runhandle = [ctrlText 93002,1] execVM ""Dev.sqf"";";
		};
		
		class lblPLExecCode : RscLabel {
			text = "Code:";
			x = 0.0 + 0.11;
			y = 0.0 + 0.284;
		};
		
		class htxtcode : MyTextBox {
			idc = 93004;
			x = 0.0 + 0.16;
			y = 0.0 + 0.284;
			w = 0.25;
			text = "";
		};
		
		class btnexeccode : RscNiceButton {
			x = 0.0 + 0.412;
			y = 0.0 + 0.244;
			w = 0.0694;
			text = "Exec";
			
			class TextPos {
				left = 0.017;
				top = 0.034;
				right = 0.005;
				bottom = 0.005;
			};
			action = "_runhandle = [ctrlText 93002,2,ctrlText 93004] execVM ""Dev.sqf"";";
		};
		
		class btnExitMenu : RscNiceButton {
			x = 0.0 + 0.21;
			y = 0.0 + 0.32;
			text = "Exit";
			action = "closeDialog 93001;";
		};
	};
};
