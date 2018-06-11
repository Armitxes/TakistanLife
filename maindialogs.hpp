class wantedrelease
{
	idd = 1603;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background, trennlinie1};
	objects[] = { };
	controls[] = {civlist, kopfgeld_eingabe, cost, reasonlist, header1, submit, set_unwanted, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.16;
		y = 0.25;
		w = 0.70;
		h = 0.24;
	};

	class background : RscBgRahmen
	{
		x = 0.16;
		y = 0.25;
		w = 0.70;
		h = 0.24;
	};

	class civlist : RscCombo
	{
		idc = 1;
		x = 0.17;
		y = 0.33;
		w = 0.31;
		h = 0.04;
	};

	class kopfgeld_eingabe : RscEdit
	{
		idc = 2;
		x = 0.53;
		y = 0.38;
		w = 0.31;
		h = 0.04;
		text = "Crime not in List? Log crime here!";
	};

	class cost : RscText
	{
		idc = 3;
		x = 0.65;
		y = 0.25;
		w = 0.16;
		h = 0.04;

		text = "Reason:";
	};

	class reasonlist : RscCombo
	{
		idc = 4;
		x = 0.53;
		y = 0.31;
		w = 0.31;
		h = 0.04;
	};

	class header1 : RscText
	{
		x = 0.17;
		y = 0.28;
		w = 0.31;
		h = 0.04;

		style = ST_CENTER;
		text = $STRD_description_wantedrelease_setwantedmenu;
	};

	class trennlinie1 : RscText
	{
		x = 0.49;
		y = 0.25;
		w = 0.02;
		h = 0.24;

		style = ST_FRAME;
	};

	class submit : RscButton
	{
		x = 0.17;
		y = 0.40;
		w = 0.15;
		h = 0.04;

		text = $STRD_description_submit;
		action = "[(call compile lbData [1,(lbCurSel 1)]), (ctrlText 2), 0] execVM ""wantedrelease.sqf"";";
	};

	class set_unwanted : RscButton
	{
		x = 0.32;
		y = 0.40;
		w = 0.16;
		h = 0.04;

		text = $STRD_description_wantedrelease_submit_unwanted;
		action = "[(call compile lbData [1, lbCurSel 1]), 0, 1] execVM ""wantedrelease.sqf""; closeDialog 0";
	};

	class dummybutton : RscDummy
	{
		idc = 1007;
	};
};
class CCDialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background, trennlinie1};
	objects[] = { };
	controls[] = {civlist, kopfgeld_eingabe, cost, reasonlist, header1, submit, ganglist,dec_martial_law, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.16;
		y = 0.25;
		w = 0.70;
		h = 0.34;
	};

	class background : RscBgRahmen
	{
		x = 0.16;
		y = 0.25;
		w = 0.70;
		h = 0.34;
	};

	class civlist : RscCombo
	{
		idc = 1;
		x = 0.17;
		y = 0.31;
		w = 0.31;
		h = 0.04;
	};

	class kopfgeld_eingabe : RscEdit
	{
		idc = 2;
		x = 0.53;
		y = 0.38;
		w = 0.31;
		h = 0.04;
		text = "Reason Not in List, Type Reason Here";
	};

	class cost : RscText
	{
		idc = 3;
		x = 0.65;
		y = 0.25;
		w = 0.16;
		h = 0.04;

		text = "Reason:";
	};

	class reasonlist : RscCombo
	{
		idc = 4;
		x = 0.53;
		y = 0.31;
		w = 0.31;
		h = 0.04;
	};

	class header1 : RscText
	{
		x = 0.17;
		y = 0.25;
		w = 0.31;
		h = 0.04;

		style = ST_CENTER;
		text = "Chief Constable Menu:";
	};

	class trennlinie1 : RscText
	{
		x = 0.49;
		y = 0.25;
		w = 0.02;
		h = 0.24;

		style = ST_FRAME;
	};

	class submit : RscButton
	{
		x = 0.17;
		y = 0.45;
		w = 0.15;
		h = 0.04;

		text = $STRD_description_submit;
		action = "[(call compile lbData [1,(lbCurSel 1)]), (ctrlText 2),(lbCurSel 4),[(lbData [5,(lbCurSel 5)])]] execVM ""CCauth.sqf""; closeDialog 0";
	};

	class ganglist : RscCombo
	{
		idc = 5;
		x = 0.17;
		y = 0.38;
		w = 0.31;
		h = 0.04;
	};
	class dec_martial_law : RscButton
	{
		x = 0.35;
		y = 0.50;
		w = 0.31;
		h = 0.05;

		text = "Declare/Revoke Martial Law!";
		action = "closedialog 0; [""MarLDialog""] execVM ""CCDialog.sqf"";";
	};

	class dummybutton : RscDummy
	{
		idc = 1006;
	};
};
class MarLDialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {marlist,header1, martial_reason,submit,dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.16;
		y = 0.25;
		w = 0.70;
		h = 0.16;
	};

	class background : RscBgRahmen
	{
		x = 0.16;
		y = 0.25;
		w = 0.70;
		h = 0.16;
	};
	class header1 : RscText
	{
		x = 0.17;
		y = 0.26;
		w = 0.31;
		h = 0.04;

		style = ST_CENTER;
		text = $STRD_description_martial_martialmenu;
	};
	class  marlist : RscCombo
	{
		idc = 1;
		x = 0.17;
		y = 0.30;
		w = 0.31;
		h = 0.04;
	};
	class martial_reason : RscEdit
	{
		idc = 2;
		x = 0.50;
		y = 0.30;
		w = 0.31;
		h = 0.04;

	    text = "Reason Not in List, Type Reason Here";
	};
	class submit : RscButton
	{
		x = 0.33;
		y = 0.35;
		w = 0.31;
		h = 0.04;

		text = $STRD_description_submit;
		action = "[(lbCurSel 1), (ctrlText 2)] execVM ""MarLMenu.sqf""; closeDialog 0";
	};
	class dummybutton : RscDummy
	{
		idc = 1106;
	};
};
class baildialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {button_paybail, bail_eingabe, cancel, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.38;
		y = 0.25;
		w = 0.42;
		h = 0.22;
	};

	class background : RscBgRahmen
	{
		x = 0.38;
		y = 0.25;
		w = 0.42;
		h = 0.22;

		text = "Pay bail ($6000 = 1min)";
	};

	class button_paybail : RscButton
	{
		x = 0.45;
		y = 0.35;
		w = 0.25;
		h = 0.04;

		text = $STRD_description_bail_pay;
		action = "[ctrlText 2] execVM ""bail.sqf""; closeDialog 0";
	};

	class cancel : RscButton
	{
		x = 0.45;
		y = 0.40;
		w = 0.25;
		h = 0.04;

		text = $STRD_description_cancel;
		action = "closedialog 0";
	};

	class bail_eingabe : RscEdit
	{
		x = 0.45;
		y = 0.30;
		w = 0.24;
		h = 0.04;
		idc = 2;

		text = "30000";
	};

	class dummybutton : RscDummy
	{
		idc = 1008;
	};
};

class liste_1_button
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {spielerliste, close, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.21;
		y = 0.05;
		w = 0.70;
		h = 0.95;
	};
	class background : RscBgRahmen
	{
		x = 0.21;
		y = 0.05;
		w = 0.70;
		h = 0.95;
	};
	class spielerliste : RscListBox
	{
		idc = 1;
		x = 0.22;
		y = 0.08;
		w = 0.69;
		h = 0.86;
		SizeEX = 0.0195;
		RowHeight = 0.03;
	};
	class close : RscButton
	{
		idc = 2;
		x = 0.44;
		y = 0.95;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";
	};
	class dummybutton : RscDummy
	{
		idc = 1017;
	};
};

class constitution : liste_1_button {
	idd = 20;
	controls[] = {spielerliste, close, dummybutton};
};

class gang_menu
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {button_join, button_leave, button_manage, btnSouthGov, btnSouthLaws, button_create, listbox_gilden, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.06;
		y = 0.15;
		w = 0.87;
		h = 0.35;
	};

	class background : RscBgRahmen
	{
		x = 0.06;
		y = 0.15;
		w = 0.87;
		h = 0.35;

		text = $STRD_description_gildehauptmenu_header;
	};

	class button_join : RscButton
	{
		x = 0.08;
		y = 0.19;
		w = 0.20;
		h = 0.04;

		text = "Join Gang";
		action = "[0, 0, 0, [""join"",(lbCurSel 202)]] execVM ""gangs.sqf""; closedialog 0;";
	};

	class btnSouthGov : RscButton
	{
		x = 0.08;
		y = 0.25;
		w = 0.20;
		h = 0.04;

		text = "South Government";
		action = "[""form""] execVM ""armitxes\southgov.sqf""; closedialog 0;";
	};

	class btnSouthLaws : RscButton
	{
		x = 0.29;
		y = 0.25;
		w = 0.20;
		h = 0.04;

		text = "Southern Laws";
		action = "[""laws""] execVM ""armitxes\southgov.sqf""; closedialog 0;";
	};

	class button_leave : RscButton
	{
		x = 0.50;
		y = 0.19;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_gildehauptmenu_button_leave;
		action = "[0, 0, 0, [""leave""]] execVM ""gangs.sqf""; closedialog 0;";
	};

	class button_manage : RscButton
	{
		x = 0.29;
		y = 0.19;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_gildehauptmenu_button_manage;
		action = "[0, 0, 0, [""gildenverwaltung""]] execVM ""maindialogs.sqf""; closedialog 0;";
	};

	class button_create : RscButton
	{
		x = 0.71;
		y = 0.19;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_gildehauptmenu_button_create;
		action = "closedialog 0; createDialog ""gilde_gruenden"";";
	};

	class listbox_gilden : RscListBox
	{
		idc = 202;
		x = 0.08;
		y = 0.31;
		w = 0.84;
		h = 0.15;
	};

	class dummybutton : RscDummy
	{
		idc = 1018;
	};
};

class gilde_gruenden
{
	idd = 2001;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {gildenname, submit, cancel, text_name, dummybutton, hinweis};
	class DLG_BACK1: RscBackground
	{
		x = 0.25;
		y = 0.32;
		w = 0.49;
		h = 0.34;
	};

	class background : RscBgRahmen
	{
		x = 0.25;
		y = 0.32;
		w = 0.49;
		h = 0.34;

		text = $STRD_description_gildegruenden_header;
	};

	class gildenname : RscEdit
	{
		idc = 1;
		x = 0.29;
		y = 0.42;
		w = 0.41;
		h = 0.04;
		onChar = "[_this, 1] call TastenDruck;";
	};

	class submit : RscButton
	{
		idc = 2;
		x = 0.29;
		y = 0.47;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_gildegruenden_submit;
		action = "[0, 0, 0, [""create"", (ctrlText 1)]] execVm ""gangs.sqf""; closedialog 0;";
	};

	class cancel : RscButton
	{
		idc = 3;
		x = 0.50;
		y = 0.47;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_cancel;
		action = "closedialog 0;";
	};

	class text_name : RscText
	{
		idc = 4;
		x = 0.29;
		y = 0.37;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_gildegruenden_name;
	};

	class dummybutton : RscDummy
	{
		idc = 1019;
	};

	class hinweis : RscText
	{
		x = 0.29;
		y = 0.52;
		w = 0.41;
		h = 0.12;

		style = ST_MULTI;
		linespacing = 1;
		text = $STRD_description_gildegruenden_hinweis;
	};
};

class gesetzdialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {gesetzliste, eingabefenster, submit, dummybutton};

	class DLG_BACK1: RscBackground
	{
		x = 0.03;
		y = 0.21;
		w = 0.93;
		h = 0.43;
	};

	class background : RscBgRahmen
	{
		x = 0.03;
		y = 0.21;
		w = 0.93;
		h = 0.43;

		text = $STRD_dialogandere_gesetze_header;
	};

	class gesetzliste : RscListBox
	{
		idc = 1;
		x = 0.04;
		y = 0.24;
		w = 0.91;
		h = 0.34;
	};

	class eingabefenster : RscEdit
	{
		idc = 2;
		x = 0.04;
		y = 0.58;
		w = 0.71;
		h = 0.04;

		onChar = "[_this, 1] call TastenDruck;";
	};

	class submit : RscButton
	{
		x = 0.75;
		y = 0.58;
		w = 0.20;
		h = 0.04;
		idc = 3;

		text = $STRD_dialogandere_gesetze_submit;
		action = "[0,0,0,[""clientgesetz"", lbcursel 1, Ctrltext 2]] execVM ""mayor.sqf""; closedialog 0;";
	};

	class dummybutton : RscDummy
	{
		idc = 1020;
	};
};

class gilde_verwaltung
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {rauswerfen_spielerliste, rauswerfen_header, cancel, rauswerfen_submit, sperren_liste, sperren_header, sperren_submit, dummybutton};

	class DLG_BACK1: Rscbackground
	{
		x = 0.24;
		y = 0.13;
		w = 0.47;
		h = 0.43;
	};

	class background : RscBgRahmen
	{
		x = 0.24;
		y = 0.13;
		w = 0.47;
		h = 0.43;

		text = $STRD_description_gildeverwalten_header;
	};

	class rauswerfen_spielerliste : RscListBox
	{
		x = 0.26;
		y = 0.22;
		w = 0.20;
		h = 0.15;
		idc = 102;
	};

	class rauswerfen_header : RscText
	{
		x = 0.26;
		y = 0.17;
		w = 0.20;
		h = 0.04;
		idc = 101;

		style = ST_CENTER;
		text = $STRD_description_gildeverwalten_rauswerfen_header;
	};

	class cancel : RscButton
	{
		x = 0.38;
		y = 0.50;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";
	};

	class rauswerfen_submit : RscButton
	{
		x = 0.26;
		y = 0.38;
		w = 0.20;
		h = 0.04;
		idc = 103;

		text = $STRD_description_gildeverwalten_rauswerfen_submit;
		action = "[0, 0, 0, [""kick"", (lbData [102, (lbCurSel 102)]), (lbCurSel 102)]] execVm ""gangs.sqf""; closedialog 0;";
	};

	class sperren_liste : RscListBox
	{
		x = 0.50;
		y = 0.22;
		w = 0.20;
		h = 0.08;
		idc = 201;
	};

	class sperren_header : RscText
	{
		x = 0.50;
		y = 0.17;
		w = 0.20;
		h = 0.04;
		idc = 202;

		style = ST_CENTER;
		text = $STRD_description_gildeverwalten_sperren_header;
	};

	class sperren_submit : RscButton
	{
		x = 0.50;
		y = 0.32;
		w = 0.20;
		h = 0.04;
		idc = 203;

		text = $STRD_description_gildeverwalten_sperren_submit;
		action = "[0,0,0,[""allowjoin"", (lbData [201, (lbCurSel 201)]), (lbCurSel 201)]] execVM ""gangs.sqf""; closedialog 0;";
	};

	class dummybutton : RscDummy
	{
		idc = 1022;
	};
};

class ja_nein
{
	idd = 3000;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {infotext, button1, button2, dummybutton};
	class DLG_BACK1: Rscbackground
	{
		x = 0.38;
		y = 0.17;
		w = 0.38;
		h = 0.25;
	};

	class background : RscBgRahmen
	{
		x = 0.38; y = 0.17;
		w = 0.38; h = 0.25;
		text = $STRD_janein_header;
	};

	class infotext : RscText
	{
		idc = 1;
		x = 0.40;
		y = 0.21;
		w = 0.34;
		h = 0.15;

		style = ST_MULTI;
		lineSpacing = 1;
	};

	class button1 : RscButton
	{
		idc = 2;
		x = 0.40;
		y = 0.37;
		w = 0.10;
		h = 0.04;

		text = $STRS_ja;
		action = "Antwort = 1; while { ctrlVisible 1023 } do { closeDialog 0; };";
	};

	class button2 : RscButton
	{
		idc = 3;
		x = 0.53;
		y = 0.37;
		w = 0.10;
		h = 0.04;

		text = $STRS_nein;
		action = "Antwort = 2; while { ctrlVisible 1023 } do { closeDialog 0; };";
	};

	class dummybutton : RscDummy {idc = 1023;};
};

class chiefdialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {spielerliste, submit, cancel, dummybutton};

	class DLG_BACK1: Rscbackground		{
	x = 0.36; y = 0.06;
	w = 0.30; h = 0.80;		};

	class background : RscBgRahmen		{
	x = 0.36; y = 0.06;
	w = 0.30; h = 0.80;
	text = $STRD_description_wahl_header;					};

	class spielerliste : RscListBox	{
	x = 0.38; y = 0.09;
	w = 0.27; h = 0.61;
	idc = 1;		};

	class submit : RscButton
	{
	x = 0.42; y = 0.72;
	w = 0.20; h = 0.04;
	text = $STRD_description_wahl_submit;
	action = "[0,1,2,[""ClientWahlc"", lbData [1, (lbCurSel 1)]]] execVM ""chief.sqf""; closedialog 0";
};
	class cancel : RscButton
	{
		x = 0.42;
		y = 0.79;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy
	{
		idc = 1070;
	};
};

class wahldialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {spielerliste, submit, cancel, dummybutton};

	class DLG_BACK1: Rscbackground
	{
		x = 0.36;
		y = 0.06;
		w = 0.30;
		h = 0.80;
	};

	class background : RscBgRahmen
	{
		x = 0.36;
		y = 0.06;
		w = 0.30;
		h = 0.80;

		text = $STRD_description_wahl_header;
	};

	class spielerliste : RscListBox
	{
		x = 0.38;
		y = 0.09;
		w = 0.27;
		h = 0.61;
		idc = 1;
	};

	class submit : RscButton
	{
		x = 0.42;
		y = 0.72;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_wahl_submit;
		action = "[0,1,2,[""ClientWahl"", lbData [1, (lbCurSel 1)]]] execVM ""mayor.sqf""; closedialog 0";
	};

	class cancel : RscButton
	{
		x = 0.42;
		y = 0.79;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy
	{
		idc = 1031;
	};
};

class steuerdialog
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {text_itemsteuer, slider_itemsteuer, fahrzeugsteuer_text, fahrzeugsteuer_slider, magazinsteuer_text, magazinsteuer_slider, waffesteuer_text, waffesteuer_slider, banksteuer_text, banksteuer_slider, button_submit, button_cancel, dummybutton};

	class DLG_BACK1: Rscbackground
	{
		x = 0.34;
		y = 0.08;
		w = 0.28;
		h = 0.70;
	};

	class background : RscBgRahmen
	{
		x = 0.34;
		y = 0.08;
		w = 0.28;
		h = 0.70;

		text = $STRD_description_steuer_header;
	};

	class text_itemsteuer : RscText
	{
		x = 0.35;
		y = 0.12;
		w = 0.26;
		h = 0.04;
		idc = 11;
	};

	class slider_itemsteuer : RscSliderH
	{
		idc = 12;
		x = 0.35;
		y = 0.17;
		w = 0.26;
		h = 0.04;
	};

	class fahrzeugsteuer_text : RscText
	{
		idc = 21;
		x = 0.35;
		y = 0.23;
		w = 0.26;
		h = 0.04;
	};

	class fahrzeugsteuer_slider : RscSliderH
	{
		idc = 22;
		x = 0.35;
		y = 0.28;
		w = 0.26;
		h = 0.04;
	};

	class magazinsteuer_text : RscText
	{
		idc = 31;
		x = 0.35;
		y = 0.34;
		w = 0.26;
		h = 0.04;
	};

	class magazinsteuer_slider : RscSliderH
	{
		idc = 32;
		x = 0.35;
		y = 0.39;
		w = 0.26;
		h = 0.04;
	};

	class waffesteuer_text : RscText
	{
		idc = 41;
		x = 0.35;
		y = 0.45;
		w = 0.26;
		h = 0.04;
	};

	class waffesteuer_slider : RscSliderH
	{
		idc = 42;
		x = 0.35;
		y = 0.50;
		w = 0.26;
		h = 0.04;
	};

	class banksteuer_text : RscText
	{
		idc = 51;
		x = 0.35;
		y = 0.56;
		w = 0.25;
		h = 0.04;
	};

	class banksteuer_slider : RscSliderH
	{
		idc = 52;
		x = 0.35;
		y = 0.61;
		w = 0.25;
		h = 0.04;
	};

	class button_submit : RscButton
	{
		x = 0.38;
		y = 0.67;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_steuer_submit;
		action = "[0,1,2,[""steuernMayor"", (round(sliderPosition 12)), (round(sliderPosition 32)), (round(sliderPosition 42)), (round(sliderPosition 22)), (round(sliderPosition 52))]] execVM ""mayor.sqf""; closedialog 0;";
	};

	class button_cancel : RscButton
	{
		x = 0.38;
		y = 0.72;
		w = 0.20;
		h = 0.04;

		text = $STRD_description_buyitem_close;
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy
	{
		idc = 1032;
	};
};

class MainCamDialog
{
	idd = 2005;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, DLG_BACK2, DLG_BACK3, DLG_BACK4};
	objects[] = { };
	controls[] = {button_nvgOn, button_nvgOff, close, dummybutton, VL1, VL2, VL3, VL4, VL5, VL6, VL7, VL8, VL9,	HL1, HL2, HL3, HL4, HL5, HL6, HL7, cross_horizontal, cross_vertical, CamSlider5, LightSlider};

	class VL1: RscText
	{
		x = 0.100;
		y = 0.200;
		w = 0.001;
		h = 0.600;

		colorBackground[] = {1,1,1,0.1};
	};

	class VL2: VL1 {x = 0.2;};
	class VL3: VL1 {x = 0.3;};
	class VL4: VL1 {x = 0.4;};
	class VL5: VL1 {x = 0.5;};
	class VL6: VL1 {x = 0.6;};
	class VL7: VL1 {x = 0.7;};
	class VL8: VL1 {x = 0.8;};
	class VL9: VL1 {x = 0.9;};

	class HL1: RscText
	{
		x = 0.100;
		y = 0.200;
		w = 0.800;
		h = 0.001;

		colorBackground[] = {1,1,1,0.1};
	};

	class HL2: HL1 {y = 0.3;};
	class HL3: HL1 {y = 0.4;};
	class HL4: HL1 {y = 0.5;};
	class HL5: HL1 {y = 0.6;};
	class HL6: HL1 {y = 0.7;};
	class HL7: HL1 {y = 0.8;};

	class DLG_BACK1: Rscbackground
	{
		x = -1.00;
		y = -0.40;
		w =  3.00;
		h = 0.60;

		colorBackground[] = {0,0,0,1};
	};

	class DLG_BACK2: Rscbackground
	{
		x = -1.00;
		y = 0.80;
		w =  3.00;
		h = 0.80;

		colorBackground[] = {0,0,0,1};
	};

	class DLG_BACK3: Rscbackground
	{
		x = -1.00;
		y = -1.00;
		w =  1.10;
		h =  3.00;

		colorBackground[] = {0,0,0,1};
	};

	class DLG_BACK4: Rscbackground
	{
		x = 0.90;
		y = -1.00;
		w = 1.10;
		h =  3.00;

		colorBackground[] = {0,0,0,1};
	};

	class cross_horizontal: RscText
	{
		x = 0.465;
		y = 0.500;
		w = 0.070;
		h = 0.002;

		colorBackground[] = {1,0.9,0.9,0.2};
	};

	class cross_vertical: RscText
	{
		x = 0.500;
		y = 0.465;
		w = 0.002;
		h = 0.070;

		colorBackground[] = {1,0.9,0.9,0.2};
	};

	class button_nvgOn : RscButton
	{
		idc = 25;
		x = 0.10;
		y = 0.82;
		w = 0.15;
		h = 0.04;

		colorBackground[] = {0.3,0.3,0.3,1};
		text = $STRD_cam_description_nvgon;
	};

	class button_nvgOff : RscButton
	{
		idc = 26;
		x = 0.30;
		y = 0.82;
		w = 0.15;
		h = 0.04;

		colorBackground[] = {0.3,0.3,0.3,1};
		text = $STRD_cam_description_nvgoff;
	};

	class close : RscButton
	{
		idc = 28;
		x = 0.70;
		y = 0.82;
		w = 0.15;
		h = 0.04;
		colorBackground[] = {0.3,0.3,0.3,1};
		text = $STRD_description_close;
	};

	class CamSlider5 : RscSliderV
	{
		idc = 1055;
		x = 0.05;
		y = 0.20;
		w = 0.04;
		h = 0.70;
	};

	class LightSlider : RscSliderV
	{
		idc = 11;
		x = 0.92;
		y = 0.20;
		w = 0.04;
		h = 0.70;
	};

	class dummybutton : RscDummy
	{
		idc = 1050;
	};
};



class CopMenu
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {button1, button3, button4, button5, button7, dummybutton};

	class DLG_BACK1: Rscbackground
	{
		x = 0.35;
		y = 0.20;
		w = 0.30;
		h = 0.50;
	};

	class background : RscBgRahmen
	{
		x = 0.35;
		y = 0.20;
		w = 0.30;
		h = 0.50;

		text = "Copmenu";
	};

	class button1 : RscButton
	{
		x = 0.40;
		y = 0.25;
		w = 0.20;
		h = 0.04;

		text = "Prison/Wanted Menu";
		action = "closedialog 0; [0,1,2,[""wantedrelease""]] execVM ""maindialogs.sqf"";";
	};

	class button3 : RscButton
	{
		x = 0.40;
		y = 0.35;
		w = 0.20;
		h = 0.04;

		text = "Cameras";
		action = "closedialog 0; [0,1,2,[""camera""]] execVM ""armitxes\remote.sqf"";";
	};

	class button4 : RscButton
	{
		x = 0.40;
		y = 0.40;
		w = 0.20;
		h = 0.04;

		text = "Sat Cam";
		action = "closedialog 0; [ [(getPos player select 0), (getPos player select 1), 200] ] execVM ""satcam.sqf"";";
	};

	class button5 : RscButton
	{
		x = 0.40;
		y = 0.45;
		w = 0.20;
		h = 0.04;

		text = "Crime log";
		action = "closedialog 0; [0,1,2,[""coplog""]] execVM ""maindialogs.sqf"";";
	};

	class button7 : RscButton
	{
		x = 0.40;
		y = 0.55;
		w = 0.20;
		h = 0.04;

		text = "Close";
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy
	{
		idc = 1052;
	};
};

class CopMenuLite
{
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {priswantbutton, crimelog, reserved, closebutton};

	class DLG_BACK1: Rscbackground
	{
		x = 0.35;
		y = 0.20;
		w = 0.30;
		h = 0.25;
	};

	class background : RscBgRahmen
	{
		x = 0.35;
		y = 0.20;
		w = 0.299;
		h = 0.25;

		text = "On-foot Cop Menu";
	};

	class priswantbutton : RscButton
	{
		x = 0.40;
		y = 0.26;
		w = 0.20;
		h = 0.04;

		text = "Prison/Wanted Menu";
		action = "closedialog 0; [0,1,2,[""wantedrelease""]] execVM ""maindialogs.sqf"";";
	};

	class crimelog : RscButton
	{
		x = 0.40;
		y = 0.31;
		w = 0.20;
		h = 0.04;

		text = "Crime log";
		action = "closedialog 0; [0,1,2,[""coplog""]] execVM ""maindialogs.sqf"";";
	};


	class reserved : RscButton
	{
		x = 0.40;
		y = 0.36;
		w = 0.20;
		h = 0.04;

		text = "CC Menu";
		action = "closedialog 0;[""CCdialog""] execVM ""CCdialog.sqf"";";
	};

	class closebutton : RscButton
	{
		x = 0.618;
		y = 0.215;
		w = 0.03;
		h = 0.03;

		text = "x";
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy
	{
		idc = 1052;
	};
};

class Distribute

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, background1};
objects[] = { };
controls[] = {itemlist, submit, cancel};

	class DLG_BACK1: RscBackground

	{

	x = 0.27; y = 0.07;
	w = 0.46; h = 0.63;

	};

	class background1 : RscBgRahmen

	{

	idc = 3;
	x = 0.27; y = 0.07;
	w = 0.46; h = 0.63;

	text = Select a vehicle;

	};

	class itemlist : RscListBox

	{

	idc = 1;
	x = 0.29; y = 0.10;
	w = 0.42; h = 0.48;

	};

	class submit : RscButton

	{

	idc = 2;
	x = 0.29; y = 0.62;
	w = 0.20; h = 0.04;

	text = Select;

	};

	class cancel : RscButton

	{

	x = 0.51; y = 0.62;
	w = 0.20; h = 0.04;

	text = Close;
	action = "closedialog 0;";

	};

};

class Distribute2

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, background};
objects[] = { };
controls[] = {carmbutton, everonbutton, closebutton};

	class DLG_BACK1: Rscbackground

	{
		x = 0.35; y = 0.20;
		w = 0.30; h = 0.20;
	};

	class background : RscBgRahmen

	{

		x = 0.35;  y = 0.20;
		w = 0.299; h = 0.20;

		text = "Sell vehicle to:";

	};

	class carmbutton : RscButton
	{

		idc = 3;
		x = 0.40; y = 0.26;
		w = 0.20; h = 0.04;


	};

	class everonbutton : RscButton

	{

		idc = 4;
		x = 0.40; y = 0.31;
		w = 0.20; h = 0.04;


	};

	class closebutton : RscButton

	{
		x = 0.618; y = 0.215;
		w = 0.03; h = 0.03;

		text = "x";
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy

	{
		idc = 1052;
	};

};

class Distribute3

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, background};
objects[] = { };
controls[] = {pitabutton, corozbutton, terrorbutton, closebutton};

	class DLG_BACK1: Rscbackground

	{
		x = 0.35; y = 0.20;
		w = 0.30; h = 0.25;
	};

	class background : RscBgRahmen

	{

		x = 0.35;  y = 0.20;
		w = 0.299; h = 0.25;

		text = "Sell vehicle to:";

	};

	class pitabutton : RscButton
	{

		idc = 3;
		x = 0.40; y = 0.26;
		w = 0.20; h = 0.04;


	};

	class corozbutton : RscButton

	{

		idc = 4;
		x = 0.40; y = 0.31;
		w = 0.20; h = 0.04;


	};

	class terrorbutton : RscButton

	{

		idc = 5;
		x = 0.40; y = 0.36;
		w = 0.20; h = 0.04;


	};

	class closebutton : RscButton

	{
		x = 0.618; y = 0.215;
		w = 0.03; h = 0.03;

		text = "x";
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy

	{
		idc = 1052;
	};

};

class Distribute4

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, background};
objects[] = { };
controls[] = {fs1, fs2, fs3, fs4, closebutton};

	class DLG_BACK1: Rscbackground

	{
		x = 0.35; y = 0.20;
		w = 0.30; h = 0.40;
	};

	class background : RscBgRahmen

	{

		x = 0.35;  y = 0.20;
		w = 0.299; h = 0.40;

		text = "Sell to:";

	};

	class fs1 : RscButton
	{

		idc = 3;
		x = 0.40; y = 0.26;
		w = 0.20; h = 0.04;


	};

	class fs2 : RscButton

	{

		idc = 4;
		x = 0.40; y = 0.31;
		w = 0.20; h = 0.04;


	};

	class fs3 : RscButton

	{

		idc = 5;
		x = 0.40; y = 0.36;
		w = 0.20; h = 0.04;


	};

	class fs4 : RscButton

	{

		idc = 6;
		x = 0.40; y = 0.41;
		w = 0.20; h = 0.04;


	};


	class closebutton : RscButton

	{
		x = 0.618; y = 0.215;
		w = 0.03; h = 0.03;

		text = "x";
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy

	{
		idc = 1052;
	};

};

class Distribute1

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, background};
objects[] = { };
controls[] = {masbutton, closebutton};

	class DLG_BACK1: Rscbackground

	{
		x = 0.35; y = 0.20;
		w = 0.30; h = 0.15;
	};

	class background : RscBgRahmen

	{

		x = 0.35;  y = 0.20;
		w = 0.299; h = 0.15;

		text = "Sell vehicle to:";

	};

	class masbutton : RscButton
	{

		idc = 3;
		x = 0.40; y = 0.26;
		w = 0.20; h = 0.04;


	};

	class closebutton : RscButton

	{
		x = 0.618; y = 0.215;
		w = 0.03; h = 0.03;

		text = "x";
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy

	{
		idc = 1052;
	};

};

class Distribute10

{

idd = -1;
movingEnable = true;
controlsBackground[] = {DLG_BACK1, background};
objects[] = { };
controls[] = {fs1, fs2, fs3, fs4, fs5, fs6, fs7, fs8, closebutton};

	class DLG_BACK1: Rscbackground

	{
		x = 0.35; y = 0.20;
		w = 0.30; h = 0.50;
	};

	class background : RscBgRahmen

	{

		x = 0.35;  y = 0.20;
		w = 0.299; h = 0.50;

		text = "Sell to:";

	};

	class fs1 : RscButton
	{

		idc = 3;
		x = 0.40; y = 0.26;
		w = 0.20; h = 0.04;


	};

	class fs2 : RscButton

	{

		idc = 4;
		x = 0.40; y = 0.31;
		w = 0.20; h = 0.04;


	};

	class fs3 : RscButton

	{

		idc = 5;
		x = 0.40; y = 0.36;
		w = 0.20; h = 0.04;


	};

	class fs4 : RscButton

	{

		idc = 6;
		x = 0.40; y = 0.41;
		w = 0.20; h = 0.04;


	};

	class fs5 : RscButton

	{

		idc = 7;
		x = 0.40; y = 0.46;
		w = 0.20; h = 0.04;


	};

	class fs6 : RscButton

	{

		idc = 8;
		x = 0.40; y = 0.51;
		w = 0.20; h = 0.04;


	};

	class fs7 : RscButton

	{

		idc = 9;
		x = 0.40; y = 0.56;
		w = 0.20; h = 0.04;


	};

	class fs8 : RscButton

	{

		idc = 10;
		x = 0.40; y = 0.61;
		w = 0.20; h = 0.04;


	};

		class fs9 : RscButton

	{

		idc = 11;
		x = 0.40; y = 0.65;
		w = 0.20; h = 0.04;


	};
		class fs10 : RscButton

	{

		idc = 12;
		x = 0.40; y = 0.69;
		w = 0.20; h = 0.04;


	};

	class closebutton : RscButton

	{
		x = 0.618; y = 0.215;
		w = 0.03; h = 0.03;

		text = "x";
		action = "closedialog 0;";
	};

	class dummybutton : RscDummy

	{
		idc = 1052;
	};

};

class GodMenu
{
	name=GodMenu;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={GodMenu_background};
	objects[]={};
	controls[]={GodMenu_playerName, GodMenu_activate1};

	class GodMenu_playerName:RscText
	{
		idc=-1;
		text="God";
		x=0.355555555555556;
		y=0.142222222222222;
		w=0.0888888888888889;
		h=0.0355555555555556;
	};
	class GodMenu_activate1:RscButton
	{
		idc=14098;
		text="God";
		action="execVM ""god.sqf"";";
		x=0.35;
		y=0.206666666666667;
		w=0.152222222222222;
		h=0.0511111111111111;
	};

	class GodMenu_background:RscBackground
	{
		idc=-1;
		x=0.288888888888889;
		y=0.106666666666667;
		w=0.256622222222222;
		h=0.256666666666667;
	};
};

class AdminMenu
{
	name=Menu;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={AdminMenu_background};
	objects[]={};
	controls[]={AdminMenu_playerName, AdminMenu_options, AdminMenu_activate};

	class AdminMenu_playerName:RscText
	{
		idc=13390;
		text="Menu";
		x=0.355555555555556;
		y=0.142222222222222;
		w=0.0888888888888889;
		h=0.0355555555555556;
	};

	class AdminMenu_options:RscListBox
	{
		idc=2119;
		x=0.355555555555556;
		y=0.213333333333333;
		w=0.311111111111111;
		h=0.497777777777778;
	};

	class AdminMenu_activate:RscButton
	{
		idc=-1;
		text="Select";
		action="[player] execVM ""AdminSelect.sqf"";";
		x=0.4;
		y=0.746666666666667;
		w=0.222222222222222;
		h=0.0711111111111111;
	};

	class AdminMenu_background:RscBackground
	{
		idc=-1;
		x=0.288888888888889;
		y=0.106666666666667;
		w=0.422222222222222;
		h=0.746666666666667;
	};
};

class SpawnList
{
	name=SpawnMenu;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={SpawnMenu_background};
	objects[]={};
	controls[]={SpawnMenu_playerName, SpawnMenu_options, SpawnMenu_activate1, SpawnMenu_activate2,SpawnMenu_1,SpawnMenu_2,SpawnMenu_3,SpawnMenu_4,SpawnMenu_5,SpawnMenu_6};

	class SpawnMenu_playerName:RscText
	{
		idc=-1;
		text="Spawn Menu";
		x=0.155555555555556;
		y=0.142222222222222;
		w=0.0888888888888889;
		h=0.0355555555555556;
	};
		class SpawnMenu_1:RscText
	{
		idc=38761;
		text="Object";
		x=0.1;
		y=0.75;
		w=0.5;
		h=0.04;
	};
		class SpawnMenu_2:RscText
	{
		idc=38762;
		text="Owner";
		x=0.1;
		y=0.79;
		w=0.5;
		h=0.04;
	};
		class SpawnMenu_3:RscText
	{
		idc=38763;
		text="Weapons";
		x=0.1;
		y=0.83;
		w=0.5;
		h=0.04;
	};
		class SpawnMenu_4:RscText
	{
		idc=38764;
		text="Speed";
		x=0.1;
		y=0.87;
		w=0.5;
		h=0.04;
	};
		class SpawnMenu_5:RscText
	{
		idc=38765;
		text="Users";
		x=0.1;
		y=0.91;
		w=0.5;
		h=0.04;
	};
		class SpawnMenu_6:RscText
	{
		idc=38766;
		text="Damage";
		x=0.1;
		y=0.95;
		w=0.5;
		h=0.04;
	};

	class SpawnMenu_options:RscListBox
	{
		idc=13372;
		onLBSelChanged="[1,_this select 1] execVM ""importvalues.sqf"";";
		x=-0.050055555555556;
		y=0.213333333333333;
		w=1.251111111111111;
		h=0.497777777777778;
	};

	class SpawnMenu_activate1:RscButton
	{
		idc=-1;
		text="Delete";
		action="[1] execVM ""deleteselect.sqf"";";
		x=0.1;
		y=0.996666666666667;
		w=0.152222222222222;
		h=0.0711111111111111;
	};
	class SpawnMenu_activate2:RscButton
	{
		idc=-1;
		text="Announce";
		action="[2] execVM ""deleteselect.sqf"";";
		x=0.4;
		y=0.996666666666667;
		w=0.152222222222222;
		h=0.0711111111111111;
	};

	class SpawnMenu_background:RscBackground
	{
		idc=-1;
		x=-0.06;
		y=0.106666666666667;
		w=1.352222222222222;
		h=1.000666666666667;
	};
};
class PlayersMenu
{
	name=PlayersMenu;
	idd=-1;
	movingEnable=1;
	controlsBackground[]={IGUIBack_2200};
	objects[]={};
	controls[]={PlayersMenu_options, PlayersMenu_editbox, PlayersMenu_activate1, PlayersMenu_activate2, PlayersMenu_activate3, PlayersMenu_activate4,PlayersMenu_1,PlayersMenu_3,PlayersMenu_4,PlayersMenu_6,RscButton_1604};

  class IGUIBack_2200: RscBackground
  {
  	idc = 2200;
  	x = 0.18125 * safezoneW + safezoneX;
  	y = 0.0749805 * safezoneH + safezoneY;
  	w = 0.6375 * safezoneW;
  	h = 0.850039 * safezoneH;
  };
  class PlayersMenu_options: RscListBox
  {
  	idc = 13371;
  	onLBSelChanged = "[2,_this select 1] execVM ""importvalues.sqf"";";

  	x = 0.197187 * safezoneW + safezoneX;
  	y = 0.108982 * safezoneH + safezoneY;
  	w = 0.605625 * safezoneW;
  	h = 0.476022 * safezoneH;
  };
  class PlayersMenu_1: RscText
  {
  	idc = 38861;

  	text = "Object"; //--- ToDo: Localize;
  	x = 0.197187 * safezoneW + safezoneX;
  	y = 0.755012 * safezoneH + safezoneY;
  	w = 0.605625 * safezoneW;
  	h = 0.0340016 * safezoneH;
  };
  class PlayersMenu_3: RscText
  {
  	idc = 38863;

  	text = "Weapons"; //--- ToDo: Localize;
  	x = 0.197187 * safezoneW + safezoneX;
  	y = 0.602005 * safezoneH + safezoneY;
  	w = 0.605625 * safezoneW;
  	h = 0.0340016 * safezoneH;
  };
  class PlayersMenu_4: RscText
  {
  	idc = 38864;

  	text = "Magazines"; //--- ToDo: Localize;
  	x = 0.197187 * safezoneW + safezoneX;
  	y = 0.653007 * safezoneH + safezoneY;
  	w = 0.605625 * safezoneW;
  	h = 0.0340016 * safezoneH;
  };
  class PlayersMenu_6: RscText
  {
  	idc = 38866;

  	text = "Position"; //--- ToDo: Localize;
  	x = 0.197187 * safezoneW + safezoneX;
  	y = 0.704009 * safezoneH + safezoneY;
  	w = 0.605625 * safezoneW;
  	h = 0.0340016 * safezoneH;
  };
  class PlayersMenu_activate1: RscButton
  {
  	idc = -1;
  	action = "[0] execVM ""kickselect.sqf"";";

  	text = "Kick to Lobby"; //--- ToDo: Localize;
  	x = 0.5 * safezoneW + safezoneX;
  	y = 0.806014 * safezoneH + safezoneY;
  	w = 0.0970417 * safezoneW;
  	h = 0.0434465 * safezoneH;
  };
  class PlayersMenu_activate2: RscButton
  {
  	idc = -1;
  	action = "[1] execVM ""kickselect.sqf"";";

  	text = "Ban"; //--- ToDo: Localize;
  	x = 0.5 * safezoneW + safezoneX;
  	y = 0.857016 * safezoneH + safezoneY;
  	w = 0.0970417 * safezoneW;
  	h = 0.0434465 * safezoneH;
  };
  class PlayersMenu_activate3: RscButton
  {
  	idc = 19000;
  	action = "[2] execVM ""kickselect.sqf"";";

  	text = "Cam"; //--- ToDo: Localize;
  	x = 0.603594 * safezoneW + safezoneX;
  	y = 0.806014 * safezoneH + safezoneY;
  	w = 0.0970417 * safezoneW;
  	h = 0.0434465 * safezoneH;
  };
  class PlayersMenu_activate4: RscButton
  {
  	idc = -1;
  	action = "[3] execVM ""kickselect.sqf"";";

  	text = "Warn"; //--- ToDo: Localize;
  	x = 0.603594 * safezoneW + safezoneX;
  	y = 0.857016 * safezoneH + safezoneY;
  	w = 0.0970417 * safezoneW;
  	h = 0.0434465 * safezoneH;
  };
  class PlayersMenu_editbox: RscEdit
  {
  	idc = 19001;

  	x = 0.197187 * safezoneW + safezoneX;
  	y = 0.820295 * safezoneH + safezoneY;
  	w = 0.278906 * safezoneW;
  	h = 0.0510023 * safezoneH;
  };
  class RscButton_1604: RscButton
  {
  	idc = -1;
  	action = "[9] execVM ""kickselect.sqf"";";

  	text = "Chatban"; //--- ToDo: Localize;
  	x = 0.707188 * safezoneW + safezoneX;
  	y = 0.806014 * safezoneH + safezoneY;
  	w = 0.0970417 * safezoneW;
  	h = 0.0434465 * safezoneH;
  };
};
