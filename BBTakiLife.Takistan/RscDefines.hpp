#define FontM 			"Zeppelin32"
#define FontHTML 		"Zeppelin32"
#define CT_STATIC 		0
#define CT_BUTTON		1
#define CT_EDIT			2
#define CT_SLIDER		3
#define CT_COMBO		4
#define CT_LISTBOX		5
#define CT_TOOLBOX 		6
#define CT_CHECKBOXES 		7
#define CT_PROGRESS 		8
#define CT_HTML 		9
#define CT_STATIC_SKEW 		10
#define CT_ACTIVETEXT		11
#define CT_TREE 		12
#define CT_STRUCTURED_TEXT 	13
#define CT_CONTEXT_MENU 	14
#define CT_CONTROLS_GROUP 	15
#define CT_XKEYDESC 		40
#define CT_XBUTTON 		41
#define CT_XLISTBOX 		42
#define CT_XSLIDER 		43
#define CT_XCOMBO 		44
#define CT_ANIMATED_TEXTURE	45
#define CT_OBJECT 		80
#define CT_OBJECT_ZOOM 		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_LINEBREAK		98
#define CT_USER			99
#define CT_MAP 			100
#define CT_MAP_MAIN		101
#define ST_LEFT			0
#define ST_RIGHT		1
#define ST_CENTER		2
#define ST_MULTI		16
#define ST_PICTURE		48
#define ST_FRAME		64
#define ST_SHADOW		256
#define ST_NO_RECT		512


class RscText {
  type              = CT_STATIC;
  idc               = -1;
  style             = ST_LEFT;
  colorBackground[] = {0, 0, 0, 0};
  colorText[]       = {1, 1, 1, 1};
  font              = FontM;
  sizeEx            = 0.02;
  text              = "";
};

class RscBgRahmen {
  type              = CT_STATIC;
  idc               = -1;
  style             = ST_FRAME;
  colorBackground[] = {1.0, 1.0, 1.0, 0.75};
  colorText[]       = {1, 1, 1, 1};
  font              = FontM;
  SizeEX            = 0.025;
  text              = "";
};

class RscBackground

{

colorBackground[] = {0.14, 0.18, 0.13, 0.8};
text              = "";
type              = CT_STATIC;
idc               = -1;
style             = ST_LEFT;
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.04;

};

class RscPicture

{

type              = CT_STATIC;
idc               =  -1;
style             = ST_PICTURE;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "";

};

class RscBackgroundPicture

{

type              = CT_STATIC;
idc               =  -1;
style             = ST_PICTURE;
colorBackground[] = {0, 0, 0, 0};
colorText[]       = {1, 1, 1, 1};
font              = FontM;
sizeEx            = 0.02;
text              = "dbg.pac";

};

class RscButton

{

type                      = CT_BUTTON;
idc                       = -1;
style                     = ST_CENTER;
colorText[]               = {1, 1, 1, 1};
font                      = FontHTML;
sizeEx                    = 0.025;
soundPush[]               = {"", 0.2, 1};
soundClick[]              = {"", 0.2, 1};
soundEscape[]             = {"", 0.2, 1};
default                   = false;
text                      = "";
action                    = "";
colorActive[]             = {0, 0, 0, 0};
colorDisabled[]           = {0, 0, 0, 0.1};
colorBackground[]         = {0.8,0.8,0.8,0.3};
colorBackgroundActive[]   = {0.7,0.7,0.7,1};
colorBackgroundDisabled[] = {1,1,1,0.5};
colorFocused[]            = {0.84,1,0.55,1};
colorShadow[]             = {0, 0, 0, 0.1};
colorBorder[]             = {1, 1, 1, 0.1};
offsetX                   = 0;
offsetY                   = 0;
offsetPressedX            = 0;
offsetPressedY            = 0;
borderSize                = 0;
soundEnter[]              = {"", 0.15, 1};

};

class RscDummy : RscButton

{

x   = -1.0;
y   = -1.0;
idc = -1;
w   = 0.01;
h   = 0.01;
default = true;

};

class RscEdit

{

type = CT_EDIT;
idc = -1;
style = ST_LEFT;
font = FontHTML;
sizeEx = 0.02;
colorText[] = {1, 1, 1, 1};
colorSelection[] = {0.5, 0.5, 0.5, 1};
autocomplete = false;text = "";

};

class RscLB_C

{

style                   = ST_LEFT;
idc                     = -1;
colorSelect[]           = {0, 0, 0, 1.0};
colorSelectBackground[] = {0.7, 0.7, 0.7, 1};
colorText[]             = {1, 1, 1, 1};
colorBackground[]       = {0.8, 0.8, 0.8, 0.3};
colorScrollbar[] 	= {Dlg_Color_White,1};
font                    = FontHTML;
sizeEx                  = 0.025;
rowHeight               = 0.04;
period 			= 1.200000;
maxHistoryDelay 	= 1.000000;
autoScrollSpeed 	= -1;
autoScrollDelay 	= 5;
autoScrollRewind 	= 0;

class ScrollBar {};

};

class RscListBox: RscLB_C {
  soundSelect[] = {"", 0.1, 1};
  type          = CT_LISTBOX;
};
class RscCombo: RscLB_C {
  type            = CT_COMBO;
  wholeHeight     = 0.3;
  soundSelect[]   = {"", 0.15, 1};
  soundExpand[]   = {"", 0.15, 1};
  soundCollapse[] = {"", 0.15, 1};
  arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
  arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
};
class RscSliderH {
  access  = ReadandWrite;
  type    = CT_SLIDER;
  idc     = -1;
  sizeEx  = 0.025;
  style   = 1024;
  color[] = {0.2, 0.2, 0.2, 1};
  colorActive[] = {1, 1, 1, 1};
};
class RscSliderV {
  access  = ReadandWrite;
  type    = CT_SLIDER;
  idc     = -1;
  sizeEx  = 0.025;
  style   = 0;
  color[] = {0.2, 0.2, 0.2, 1};
  colorActive[] = {1, 1, 1, 1};
};
class RscFrame {
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
};
class RscStructuredTitleText {
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	size = 0.03921;
	text = "";
	shadow = 2;
};
class RscStructuredText {
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	class Attributes
	{
		font = "Zeppelin32";
		color = "#FFFFFF";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	size = 0.025;
	text = "";
	shadow = 2;
};