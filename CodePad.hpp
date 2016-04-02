// Code pad description.ext + sounds + graphics taken from Blanco's OFPRes script Code Pad @ OFPEC.com. All credit to him!

#define ST_LEFT      0
#define ST_RIGHT     1
#define ST_CENTER    2
#define ST_MULTI        16
#define ST_SHADOW       256
#define ST_NO_RECT      512
#define CT_STATIC    0
#define ST_PICTURE   48
//#define FontM "tahomaB"
//#define FontHTML "tahomab"
#define CT_ACTIVETEXT 11
#define CT_BUTTON   1
#define ST_FRAME   64
#define CT_EDIT    2
#define CT_COMBO                 4
#define CT_LISTBOX               5
#define CT_SLIDER     3
#define ST_HPOS       0x0F

class RUG_CodePad_RscText
{
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "Bitstream";
	sizeEx = 0.04;
	linespacing = 1.0;
};

class RUG_CodePad_RscPicture
{
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = FontM;
	sizeEx = 0.04;
};

class RUG_CodePad_RscActiveText
{
	type = CT_ACTIVETEXT;
	idc = -1;
	style = ST_LEFT;
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0, 0, 1};
	font = FontM;
	sizeEx = 0.04;
	soundEnter[] = {"ui\ui_over", 0.2, 1};
	soundPush[] = {, 0.2, 1};
	soundClick[] = {"ui\ui_ok", 0.2, 1};
	soundEscape[] = {"ui\ui_cc", 0.2, 1};
	default = false;
};

class RUG_CodePad_RscButton
{
	type = CT_BUTTON;
	idc = -1;
	style = ST_CENTER;
	colorText[] = {0, 0, 0, 1};
	colorDisabled[] = {0.3, 0.3, 0.3, 1};
	colorBackground[] = {1, 1, 1, 1};
	colorBackgroundDisabled[] = {1, 1, 1, 1};
	colorBackgroundActive[] = {1, 0.5, 0, 1};
	colorFocused[] = {0, 0, 0, 1};
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0.008;
	offsetX = 0.004;
	offsetY = 0.004;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	font = FontHTML;
	sizeEx = 0.025;
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {, 0.2, 1};
	soundClick[] = {"ui\ui_ok", 0.2, 1};
	soundEscape[] = {"ui\ui_cc", 0.2, 1};
	default = false;
};

class RUG_CodePad_RscFrame
{
	type = CT_STATIC;
	idc = -1;
	style = ST_FRAME;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = FontM;
	sizeEx = 0.04;
};

class RUG_CodePad_RscEdit
{
	type = CT_EDIT;
	idc = -1;
	style = ST_LEFT;
	font = FontHTML;
	sizeEx = 0.02;
	colorText[] = {0, 0, 0, 1};
	colorSelection[] = {0.5, 0.5, 0.5, 1};
	autocomplete = false;
	text = ;
};

class RUG_CodePad_RscLB_C
{
	style = ST_LEFT;
	idc = -1;
	colorSelect[] = {0.4, 0.4, 0.4, 1};
	colorSelectBackground[] = {0.2, 0.2, 0.2, 1};
	colorText[] = {0.2, 0.2, 0.2, 1};
	colorBackground[] = {0.4, 0.4, 0.4, 1};
	font = FontHTML;
	sizeEx = 0.025;
	rowHeight = 0.04;
};

class RUG_CodePad_RscListBox: RUG_CodePad_RscLB_C
{
	type = CT_LISTBOX;
};

class RUG_CodePad_RscCombo: RUG_CodePad_RscLB_C
{
	type = CT_COMBO;
	wholeHeight = 0.3;
	soundSelect[] = {"", 0.1, 1};
	soundExpand[] = {"", 0.1, 1};
	soundCollapse[] = {"", 0.1, 1};
};

class RUG_CodePad_RscSliderH
{
	type = CT_SLIDER;
	style = ST_HPOS;
	color[] = {0.2, 0.2, 0.2, 1};
	idc = -1;
	sizeEx = 0.025;
};


class RUG_CodePad
{
	idd = 182173;
	movingEnable = true;
	controlsBackground[] = {CodePadBack, Codepadfrrame};
	objects[] = { };
	controls[] = {CODEPAD,paper,CODE,led_green,led_red, display, digit7, digit8, digit9, digit4, digit5, digit6, digit1, digit2, digit3, digit0, digit_R, digit_X};

	onLoad = "";

	class CodePadBack: RUG_CodePad_RscText
	{
		colorBackground[] = {0.4, 0.4, 0.4, 1};
		text = "";
		x = 0.375;
		y = 0.25;
		w = 0.2;
		h = 0.4;
	};
	class Codepadfrrame : RUG_CodePad_RscText
	{
		x = 0.34;
		y = 0.25;
		idc = -1;
		w = 0.2;
		h = 0.4;
		style = ST_FRAME;
		colorText[] = {0, 0, 0, 0};
		colorBackground[] = {1, 1, 1,0};
		SizeEX = 0.025;
		text = "";
	};
	class display : RUG_CodePad_RscText
	{
		x = 0.405;
		y = 0.3083;
		idc = 999;
		w = 0.14;
		h = 0.04;
		style = ST_LEFT;
		text = "";
		colorText[] = {0.9,0.9,0.9, 0.65};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		colorSelect[] = {0, 0, 0, 0};
	};
	class digit7 : RUG_CodePad_RscButton
	{
		x = 0.435;
		y = 0.43;
		idc = 107;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.02;
		text = "7";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),7];ctrlSetText [999,num];";
		default = false;
	};
	class digit8 : RUG_CodePad_RscButton
	{
		x = 0.465;
		y = 0.43;
		idc = 108;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "8";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),8];ctrlSetText [999,num];";
		default = false;
	};
	class digit9 : RUG_CodePad_RscButton
	{
		x = 0.495;
		y = 0.43;
		idc = 109;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "9";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),9];ctrlSetText [999,num];";
		default = false;
	};
	class digit4 : RUG_CodePad_RscButton
	{
		x = 0.435;
		y = 0.47;
		idc = 104;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "4";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),4];ctrlSetText [999,num];";
		default = false;
	};
	class digit5 : RUG_CodePad_RscButton
	{
		x = 0.465;
		y = 0.47;
		idc = 105;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "5";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),5];ctrlSetText [999,num];";
		default = false;
	};
	class digit6 : RUG_CodePad_RscButton
	{
		x = 0.495;
		y = 0.47;
		idc = 106;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "6";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),6];ctrlSetText [999,num];";
		default = false;
	};
	class digit1 : RUG_CodePad_RscButton
	{
		x = 0.435;
		y = 0.51;
		idc = 101;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "1";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),1];ctrlSetText [999,num];";
		default = false;
	};
	class digit2 : RUG_CodePad_RscButton
	{
		x = 0.465;
		y = 0.51;
		idc = 102;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "2";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),2];ctrlSetText [999,num];";
		default = false;
	};
	class digit3 : RUG_CodePad_RscButton
	{
		x = 0.495;
		y = 0.51;
		idc = 103;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "3";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),3];ctrlSetText [999,num];";
		default = false;
	};
	class digit0 : RUG_CodePad_RscButton
	{
		x = 0.465;
		y = 0.55;
		idc = 100;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "0";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),0];ctrlSetText [999,num];";
		default = false;
	};
	class digit_X : RUG_CodePad_RscButton
	{
		x = 0.435;
		y = 0.55;
		idc = 110;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "*";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),""*""];ctrlSetText [999,num];";
		default = false;
	};
	class digit_R : RUG_CodePad_RscButton
	{
		x = 0.495;
		y = 0.55;
		idc = 111;
		w = 0.025;
		h = 0.035;
		style = ST_CENTER;
		colorText[] = {0, 0, 0, 1};
		font = "LucidaConsoleB";
		SizeEX = 0.020;
		text = "#";
		action = "Keypad_num = Keypad_num +1;num=format [""%1%2"",(ctrlText 999),""#""];ctrlSetText [999,num];";
		default = false;
	};

	class CODEPAD : RUG_CodePad_RscPicture
	{
		idc = 501;
		text = "images\codepad\codepad.paa";
		x = 0.343;y = 0.228;w = 0.27;h = 0.454;
	};
	class Paper : RUG_CodePad_RscPicture
	{
		idc = 599;
		text = "images\codepad\paper.paa";
		x = 0.343;y = 0.628;w = 0.27;h = 0.154;
	};

	class led_green : RUG_CodePad_RscPicture
	{
		idc = 598;
		text = "images\codepad\led_green.paa";
		x = 0.468;y = 0.387;w = 0.01;h = 0.012;
	};

	class led_red : RUG_CodePad_RscPicture
	{
		idc = 597;
		text = "images\codepad\led_red.paa";
		x = 0.48;y = 0.387;w = 0.01;h = 0.012;
	};


	class CODE : RUG_CodePad_RscText
	{
		idc = 600;
		text = "";
		x = 0.21;y = 0.7;w = 0.5;h = 0.032;
		style = ST_CENTER;
	};
};