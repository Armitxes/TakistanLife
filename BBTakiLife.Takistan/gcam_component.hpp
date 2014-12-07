// GCam Component 1.13
// This file is necessary to use GCam.
// Include this file to "description.ext".
// #include "gcam_component.hpp"

class GCamMapControlBase
{
	access = 0;
	type = 101;
	//idc = 51;
	style = 48;
	colorBackground[] = {1, 1, 1, 1};
	colorOutside[] = {1, 0, 0, 1};
	colorText[] = {0, 0, 0, 1};
	font = "TahomaB";
	sizeEx = 0.040000;
	colorSea[] = {0.560000, 0.800000, 0.980000, 0.500000};
	colorForest[] = {0.600000, 0.800000, 0.200000, 0.500000};
	colorRocks[] = {0.500000, 0.500000, 0.500000, 0.500000};
	colorCountlines[] = {0.650000, 0.450000, 0.270000, 0.500000};
	colorMainCountlines[] = {0.650000, 0.450000, 0.270000, 1};
	colorCountlinesWater[] = {0, 0.530000, 1, 0.500000};
	colorMainCountlinesWater[] = {0, 0.530000, 1, 1};
	colorForestBorder[] = {0.400000, 0.800000, 0, 1};
	colorRocksBorder[] = {0.500000, 0.500000, 0.500000, 1};
	colorPowerLines[] = {0, 0, 0, 1};
	colorRailWay[] = {0.800000, 0.200000, 0.300000, 1};
	colorNames[] = {0, 0, 0, 1};
	colorInactive[] = {1, 1, 1, 0.500000};
	colorLevels[] = {0, 0, 0, 1};
	fontLabel = "TahomaB";
	sizeExLabel = 0.040000;
	fontGrid = "TahomaB";
	sizeExGrid = 0.040000;
	fontUnits = "TahomaB";
	sizeExUnits = 0.040000;
	fontNames = "TahomaB";
	sizeExNames = 0.040000;
	fontInfo = "TahomaB";
	sizeExInfo = 0.040000;
	fontLevel = "TahomaB";
	sizeExLevel = 0.040000;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.200000, {"Gamma", 1, 1.500000}};
	stickY[] = {0.200000, {"Gamma", 1, 1.500000}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	showCountourInterval = "true";
	maxSatelliteAlpha = 0.660000;
	alphaFadeStartScale = 0.050000;
	alphaFadeEndScale = 0.150000;
	class Legend {
		x = 0.700000;
		y = 0.850000;
		w = 0.250000;
		h = 0.100000;
		font = "TahomaB";
		sizeEx = 0.040000;
		colorBackground[] = {1, 1, 1, 1};
		color[] = {0, 0, 0, 1};
	};
	class ActiveMarker {
		color[] = {0.300000, 0.100000, 0.900000, 1};
		size = 50;
	};
	class Command {
		icon = "\ca\ui\data\icon_task_board_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task {
		icon = "\ca\ui\data\icon_task_ca.paa";
		iconCreated = "\ca\ui\data\ui_task_created_ca.paa";
		iconCanceled = "\ca\ui\data\ui_task_cancelled_ca.paa";
		iconDone = "\ca\ui\data\ui_task_done_ca.paa";
		iconFailed = "\ca\ui\data\ui_task_failed_ca.paa";
		colorCreated[] = {1, 1, 1, 1};
		colorCanceled[] = {1, 1, 1, 1};
		colorDone[] = {1, 1, 1, 1};
		colorFailed[] = {1, 1, 1, 1};
		color[] = {1, 1, 1, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark {
		icon = "\ca\ui\data\icon_custom_task_ca.paa";
		color[] = {1, 1, 1, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class SmallTree {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.6 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Bush {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Church {
		icon = "\ca\ui\data\map_church_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Chapel {
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Cross {
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Rock {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Bunker {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "1.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fortress {
		icon = "\ca\ui\data\map_fortress_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fountain {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class ViewTower {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Lighthouse {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "3 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Quay {
		icon = "\ca\ui\data\map_quay_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Fuelstation {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Hospital {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {1, 0, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class BusStop {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Transmitter {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Stack {
		icon = "\ca\ui\data\map_stack_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Tourism {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Watertower {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 8;
		importance = "1 * 8 * 0.05";
		coefMin = 0.250000;
		coefMax = 4;
	};
	class Waypoint {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class WaypointCompleted {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		color[] = {0, 0, 0, 1};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
};

class GCamListBoxBase
{
	access = 0;
	type = 5;
	style = 0;
	w = 0.400000;
	h = 0.400000;
	font = "TahomaB";
	shadow = 2;
	sizeEx = 0.040000;
	//color[] = {0.278, 0.223, 0.133, 1.0};
	colorText[] = {0.874, 0.843, 0.647, 1.0};
	colorScrollbar[] = {0, 0, 0, 0};
	colorSelect[] = {0, 0, 0, 0};
	colorSelect2[] = {0, 0, 0, 0};
	colorSelectBackground[] = {0.200000, 0.200000, 0.200000, 0.8};
	colorSelectBackground2[] = {0.200000, 0.200000, 0.200000, 0.8};
	period = 1;
	colorBackground[] = {0, 0, 0, 0};
	rowHeight = 0;
	maxHistoryDelay = 1.000000;
	soundSelect[] = {"", 0.100000, 1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class GCamButtonBase
{
	access = 0;
	type = 1;
	style = 2;
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	shadow = 2;
	text = "";
	font = "TahomaB";
	sizeEx = 0.0385;
	colorText[] = {0, 0, 0, 0};
	colorDisabled[] = {0, 0, 0, 0};
	colorBackground[] = {0.278, 0.223, 0.133, 0.8};
	colorBackgroundDisabled[] = {0, 0, 0, 0};
	colorBackgroundActive[] = {0.482, 0.396, 0.270, 0.8};
	offsetX = 0.0;
	offsetY = 0.0;
	offsetPressedX = 0.001;
	offsetPressedY = 0.001;
	colorFocused[] = {0.482, 0.396, 0.270, 0.8};
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0.0;
	soundEnter[] = {"", 0.100000, 1};
	soundPush[] = {"", 0.100000, 1};
	soundClick[] = {"", 0.100000, 1};
	soundEscape[] = {"", 0.100000, 1};
};


class GCamStructuredTextBase
{
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.03921;
	colorText[] = {0.8784,0.8471,0.651,1};
	shadow = 2;
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		valign = "top";
		shadow = 2;
	};
};


class GCam_Dialog_List
{
	idd = 5100;
	movingEnable = 0;
	class controls
	{
		class List : GCamListBoxBase
		{
			idc = 0;
			x = 0.65; y = 0.25; w = 0.35; h = 0.50;
			sizeEx = 0.03;
			rowHeight = 0.029;
			period = 0;
		};
		class Button_ListTrigger : GCamButtonBase
		{
			idc = 3;
			x = 0.6520;
			y = 0.8050;
			h = 0.035;
			w = 0.0845;
			sizeEx = 0.0330;
			text = "Trigger";
			toolTip = "Toggle Firing Trigger (Guided missile, Designated bomb, Artillery bullet).";
		};
		class Button_ListFollow : GCamButtonBase
		{
			idc = 4;
			x = 0.6520;
			y = 0.7600;
			h = 0.035;
			w = 0.0845;
			text = "Follow";
			toolTip = "Toggle Follow Mode.";
		};
		class Button_ListBehind : GCamButtonBase
		{
			idc = 5;
			x = 0.7485;
			y = 0.7600;
			h = 0.035;
			w = 0.0845;
			text = "Behind";
			toolTip = "Toggle Behind Mode.";
		};
		class Button_ListFocus : GCamButtonBase
		{
			idc = 6;
			x = 0.7485;
			y = 0.7600;
			h = 0.035;
			w = 0.0845;
			text = "Focus";
			toolTip = "Toggle Focus Mode.";
		};
		class Button_ListClose : GCamButtonBase
		{
			idc = 7;
			x = 0.9155;
			y = 0.7600;
			h = 0.035;
			w = 0.0845;
			text = "Close";
			toolTip = "Close Units List.";
		};
		class Button_ListTimeInc : GCamButtonBase
		{
			idc = 8;
			x = 0.79;
			y = 0.2050;
			h = 0.0175;
			w = 0.0283;
			text = "+";
			toolTip = "Increase AccTime.";
		};
		class Button_ListTimeDec : GCamButtonBase
		{
			idc = 9;
			x = 0.79;
			y = 0.2225;
			h = 0.0175;
			w = 0.0283;
			text = "-";
			toolTip = "Decrease AccTime.";
		};
		class Text_ListAccTime : GCamStructuredTextBase
		{
			idc = 10;
			type = 13;
			style = 0;
			colorBackground[] = { 0, 0, 0, 0 };
			x = 0.65; y = 0.2050; w = 0.14; h = 0.035;
			size = 0.032;
			class Attributes
			{
				color = "#000000";
				align = "left";
				valign = "top";
				size = 1;
			};
		};
	};
};


class GCam_Dialog_Map
{
	idd = 5101;
	movingEnable = 0;
	class controls
	{
		class Map : GCamMapControlBase
		{
			idc = 0;
			colorBackground[] = {1.00, 1.00, 1.00, 0.7};
			x = 0.05; y = 0.05; w = 0.9; h = 0.9;
			showCountourInterval = "false";
		};
		class Button_MapScan : GCamButtonBase
		{
			idc = 3;
			x = 0.7590;
			y = 0.9675;
			h = 0.035;
			w = 0.0845;
			text = "Scan";
			toolTip = "Scan and Show Groups (5sec, Visibility Range).";
		};
		class Button_MapClose : GCamButtonBase
		{
			idc = 4;
			x = 0.8655;
			y = 0.9675;
			h = 0.035;
			w = 0.0845;
			text = "Close";
			toolTip = "Close Map.";
		};
	};
};


class GCam_Dialog_Quit
{
	idd = 5102;
	movingEnable = 0;
	class controls
	{
		class Text_Quit : GCamStructuredTextBase
		{
			idc = 0;
			type = 13;
			style = 0;
			colorBackground[] = { 0, 0, 0, 0 };
			x = 0.398; y = 0.44; w = 0.204; h = 0.120;
			size = 0.038;
			text = "Quit GCam?";
			class Attributes
			{
				color = "#000000";
				align = "left";
				valign = "top";
				size = 1;
			};
		};
		class Button_QuitOk : GCamButtonBase
		{
			idc = 3;
			x = 0.438; y = 0.505; h = 0.035; w = 0.0560;
			sizeEx = 0.032;
			text = "OK";
			toolTip = "Quit GCam.";
		};
		class Button_QuitCancel : GCamButtonBase
		{
			idc = 4;
			x = 0.505; y = 0.505; h = 0.035; w = 0.0810;
			sizeEx = 0.032;
			text = "Cancel";
			toolTip = "Continue GCam.";
		};
	};
};


class GCam_Dialog_Help
{
	idd = 5103;
	movingEnable = 0;
	class controls
	{
		class Text_Help : GCamStructuredTextBase
		{
			idc = 0;
			type = 13;
			style = 0;
			colorBackground[] = { 0, 0, 0, 0.2 };
			x = 0.225; y = 0; w = 0.55; h = 1;
			size = 0.0275;
			text = "";
			class Attributes
			{
				color = "#000000";
				align = "left";
				valign = "top";
				size = 1;
			};
		};
		class Button_HelpClose : GCamButtonBase
		{
			idc = 3;
			x = 0.745; y = 0.0; h = 0.030; w = 0.030;
			sizeEx = 0.032;
			text = "x";
			toolTip = "Close Help.";
		};
	};
};
