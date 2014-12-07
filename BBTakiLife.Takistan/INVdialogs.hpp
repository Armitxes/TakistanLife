class factory_manifacture

{

idd = 2002;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, background};
objects[] = { };
controls[] = {list_manifacture, list_needed, manifacture, close, create, export, dummybutton};

	class DLG_BACK1: Rscbackground

	{

	x = 0.30;
	y = 0.10;
	w = 0.34;
	h = 0.80;

	};

	class background : RscBgRahmen

	{

	x = 0.30;
	y = 0.10;
	w = 0.34;
	h = 0.80;

	text = $STRS_inv_fac_dia_herstellen;

	};

	class list_manifacture : RscListBox

	{

	idc = 1;
	x = 0.32;
	y = 0.14;
	w = 0.30;
	h = 0.25;

	};

	class list_needed : RscListBox

	{

	idc = 2;
	x = 0.32;
	y = 0.42;
	w = 0.30;
	h = 0.25;

	};

	class create : RscButton

	{

	idc = 4;
	x = 0.32;
	y = 0.69;
	w = 0.30;
	h = 0.04;

	text = "Create";

	};

	class export : RscButton

	{

	idc = 5;
	x = 0.32;
	y = 0.74;
	w = 0.30;
	h = 0.04;

	text = "Export";

	};

	class manifacture : RscButton

	{

	idc = 3;
	x = 0.32;
	y = 0.79;
	w = 0.30;
	h = 0.04;

	text = "Manifacture";

	};

	class close : RscButton

	{

	x = 0.32;
	y = 0.84;
	w = 0.30;
	h = 0.04;

	text = $STRD_inv_description_close;
	action = "closeDialog 0;";

	};

	class dummybutton : RscDummy {idc = 1030;};

};

class itemkaufdialog

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, DLG_BACK2, background1, background2};
objects[] = { };
controls[] = {itemliste, itemeingabe, submit, cancel, weight, cancel2, submit2, itemeingabe2, itemliste2, text_inventargeld, dummybutton};

	class DLG_BACK1: RscBackground

	{

	x = 0.02; y = 0.07;
	w = 0.46; h = 0.63;

	};

	class DLG_BACK2: RscBackground

	{

	x = 0.51; y = 0.07;
	w = 0.46; h = 0.63;

	};

	class background1 : RscBgRahmen

	{

	x = 0.02; y = 0.07;
	w = 0.46; h = 0.63;

	text = $STRD_inv_description_itemmenu_title;
	idc = 91;

	};

	class itemliste : RscListBox

	{

	idc = 1;
	x = 0.04; y = 0.10;
	w = 0.42; h = 0.48;

	};

	class itemeingabe : RscEdit

	{

	idc = 2;
	x = 0.04; y = 0.60;
	w = 0.20; h = 0.04;

	text = "1";

	};

	class submit : RscButton

	{

	idc = 3;
	x = 0.25; y = 0.60;
	w = 0.20; h = 0.04;

	};

	class cancel : RscButton

	{

	x = 0.25; y = 0.65;
	w = 0.20; h = 0.04;

	text = $STRD_inv_description_buyitem_close;
	action = "closedialog 0";

	};

	class weight : RscText

	{

	idc = 765;
	x = 0.04; y = 0.65;
	w = 0.20; h = 0.04;

	};

	class background2 : RscBgRahmen

	{

	x = 0.51; y = 0.07;
	w = 0.46; h = 0.63;
	idc = 92;

	text = $STRD_inv_description_itemmenu_title2;

	};

	class cancel2 : RscButton

	{

	x = 0.74;
	y = 0.65;
	w = 0.20;
	h = 0.04;

	text = $STRD_inv_description_buyitem_close;
	action = "closedialog 0;";

	};

	class submit2 : RscButton

	{

	idc = 103;
	x = 0.74; y = 0.60;
	w = 0.20; h = 0.04;

	};

	class itemeingabe2 : RscEdit

	{

	idc = 102;
	x = 0.53; y = 0.60;
	w = 0.20; h = 0.04;
	text = "1";

	};

	class itemliste2 : RscListBox

	{

	idc = 101;
	w = 0.42; h = 0.48;
	x = 0.53; y = 0.10;

	};

	class text_inventargeld : RscText

	{

	idc = 100;
	x = 0.04; y = 0.65;
	w = 0.20; h = 0.04;

	};

	class dummybutton : RscDummy {idc = 1015;};

};

class inventar{										idd = -1;														movingEnable = true;								controlsBackground[] = {background};									objects[] = { };															controls[] = {																														header, 																		button_use, button_drop, button_cancel, TransferButton,																		InfoItem, InfoItemVar, InfoAnzahl, InfoAnzahlVar, InfoAddinfo, InfoAddinfoVar, InfoGewicht, InfoGewichtVar,								UseAmounteingabe, 																										description, playerlist, Itemlist, dummybutton										};																					class header : RscText									{																		idc = 101;																				x = 0.23; y = 0.14;						w = 0.55; h = 0.04;												style = ST_CENTER;																								SizeEX = 0.03;														text = $STRD_inv_description_inventar_header;				};															class background : RscBackground							{																				x = 0.14; y = 0.10;																						w = 0.71; h = 0.75;												};																				class button_use : RscButton										{																														idc = 3;				x = 0.15; y = 0.20;																w = 0.20; h = 0.04;																										text = $STRD_inv_description_inventar_use;											};			class button_cancel : RscButton				{				x = 0.15; y = 0.26;																												w = 0.20; h = 0.04;								text = $STRD_inv_description_buyitem_close;																										action = "closedialog 0;";		};										class button_drop : RscButton			{						idc = 4;						x = 0.15; y = 0.32;																						w = 0.20; h = 0.04;																														text = $STRD_inv_description_inventar_drop;														};												class TransferButton : RscButton		{				idc = 246;																												x = 0.15; y = 0.38;																												w = 0.20; h = 0.04;														text = $STRD_inv_description_inventar_schluessel_uebergabe;				};														class UseAmounteingabe : RscEdit						{																														idc = 501;																						x = 0.15; y = 0.44;																						w = 0.20; h = 0.04;						text = "1";					};																													class playerlist : RscCombo															{																														idc = 99;				x = 0.15; y = 0.56;								w = 0.20; h = 0.04;								};															class InfoItem : RscText				{																		idc = 51;								x = 0.15; y = 0.61;						w = 0.27; h = 0.04;																						style = ST_RIGHT;						text = $STRD_inv_description_inventar_item;															};										class InfoItemVar : RscText				{																														idc = 52;																												x = 0.43; y = 0.61;								w = 0.20; h = 0.04;									};			class InfoAnzahl : RscText							{																				idc = 61;																														x = 0.15; y = 0.66;														w = 0.27; h = 0.04;																								style = ST_RIGHT;												text = $STRD_inv_description_inventar_amount;				};														class InfoAnzahlVar : RscText						{												idc = 62;																										x = 0.43; y = 0.66;				w = 0.20; h = 0.04;														};															class InfoAddinfo : RscText															{												idc = 71;										x = 0.15; y = 0.71;								w = 0.27; h = 0.04;																								style = ST_RIGHT;														text = $STRD_inv_description_inventar_addinfo;			};						class InfoAddinfoVar : RscText															{												idc = 72;																														x = 0.43; y = 0.71;																						w = 0.20; h = 0.04;											};													class InfoGewicht : RscText								{																												idc = 201;																														x = 0.15; y = 0.76;				w = 0.27; h = 0.04;						style = ST_RIGHT;																								text = $STRD_inv_description_inventar_gewicht;															};									 class InfoGewichtVar : RscText					{																						idc = 202;												x = 0.43; y = 0.76;								w = 0.20; h = 0.04;											};																			class description : RscText										{								idc = 7;																		x = 0.36; y = 0.20;								w = 0.27; h = 0.25;																												style = ST_MULTI;																lineSpacing = 1;															};													class Itemlist : RscListBox						{												idc = 1;														x = 0.64; y = 0.20;														w = 0.2; h = 0.45;								};									class dummybutton : RscDummy {idc = 1001;};};class INV_list{						idd = -1;						movingEnable = true;											controlsBackground[] = {DLG_BACK1, background};															objects[] = { };				controls[] = {liste, close, dummybutton};															class DLG_BACK1: RscBackground					{																														x = 0.21; y = 0.05;																												w = 0.52; h = 0.84;									};										class background : RscBgRahmen											{																														x = 0.21; y = 0.05;						w = 0.52; h = 0.84;						text = "List";					};						class liste : RscListBox							{												idc = 1;																				x = 0.22; y = 0.08;																														w = 0.50; h = 0.73;																				SizeEX = 0.0195; 																RowHeight = 0.03; 			};										class close : RscButton													{						idc = 2;																								x = 0.39; y = 0.83;										w = 0.20; h = 0.04;																										text = $STRD_inv_description_buyitem_close;																														action = "closedialog 0;";															};			class dummybutton : RscDummy {idc = 2017;};};             