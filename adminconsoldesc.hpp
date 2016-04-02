class RscBgFrame
{
	type=0;
	idc=-1;
	style=64;
	colorBackground[]={0.4, 0.4, 0.4, 0.75};
	colorText[]={0, 0, 0, 1};
	font="TahomaB";
	SizeEX=0.025;
	text="";
};

class Main
{
	name=Main;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={adminconsol_background};
	objects[]={};
	controls[]={adminconsol_editbox, adminconsol_playerName, adminconsol_options, adminconsol_activate, adminconsol_frame};

	class adminconsol_editbox:RscEdit
	{
		idc=2000;
		x=0.466666666666667;
		y=0.142222222222222;
		w=0.2;
		h=0.0355555555555556;
	};

	class adminconsol_playerName:RscText
	{
		idc=-1;
		text="Player Name:";
		x=0.355555555555556;
		y=0.142222222222222;
		w=0.0888888888888889;
		h=0.0355555555555556;
	};

	class adminconsol_options:RscListBox
	{
		idc=1000;
		x=0.355555555555556;
		y=0.213333333333333;
		w=0.311111111111111;
		h=0.497777777777778;
	};

	class adminconsol_activate:RscButton
	{
		idc=-1;
		text="Activate Command";
		action="[player] execVM ""adminmenuitems.sqf"";";
		x=0.4;
		y=0.746666666666667;
		w=0.222222222222222;
		h=0.0711111111111111;
	};

	class adminconsol_frame:RscBgFrame
	{
		idc=-1;
		x=0.288888888888889;
		y=0.106666666666667;
		w=0.422222222222222;
		h=0.746666666666667;
	};

	class adminconsol_background:RscBackground
	{
		idc=-1;
		x=0.288888888888889;
		y=0.106666666666667;
		w=0.422222222222222;
		h=0.746666666666667;
	};
};