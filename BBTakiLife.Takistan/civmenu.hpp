class civmenu {
	idd = -1; movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {button_drag, button_disarm, button_drugs, btnSuspend, button_restrain, ticket_eingabe, button_ticket, button_licencesearch, button_inventarsearch, cancel, dummybutton};
	
	class DLG_BACK1: RscBackground           {x = 0.40; y = 0.20;w = 0.22; h = 0.58;};
	class background : RscBgRahmen           {x = 0.40; y = 0.20;w = 0.22; h = 0.58;text = "Interaction Menu";};
	class button_drag : RscButton            {idc = 5;x = 0.41; y = 0.23;w = 0.20; h = 0.04;text = "Drag";								  action = "[40] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_disarm : RscButton          {idc = 1;x = 0.41; y = 0.28;w = 0.20; h = 0.04;text = "Disarm";							  action = "[2] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_drugs : RscButton           {idc = 2;x = 0.41; y = 0.33;w = 0.20; h = 0.04;text = "Illegal Item Search";		action = "[1] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnSuspend : RscButton             {idc = 2;x = 0.41; y = 0.38;w = 0.20; h = 0.04;text = "[IAD] Suspend Officer"; action = "[7] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_restrain : RscButton        {idc = 6;x = 0.41; y = 0.49;w = 0.20; h = 0.04;text = "Restrain/Release";		  action = "[] execVM ""Restrain.sqf""; closedialog 0";};
	class ticket_eingabe : RscEdit           {idc = 11;x = 0.41; y = 0.54;w = 0.20; h = 0.03;text = "1000";};
	class button_ticket : RscButton          {x = 0.41; y = 0.59;w = 0.20; h = 0.04;text = "Ticket";							          action = "[4, ctrlText 11] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_papersearch : RscButton     {idc = 12;x = 0.41; y = 0.64;w = 0.20; h = 0.04;text = "Check Papers";			action = "[8] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_inventarsearch : RscButton  {idc = 14;x = 0.41; y = 0.69;w = 0.20; h = 0.04;text = "Check Inventory";			action = "[6] execVM ""civmenuinit.sqf""; closedialog 0";};
	class cancel : RscButton                 {x = 0.41; y = 0.74;w = 0.20; h = 0.04;text = $STRD_description_cancel;        action = "closedialog 0";};
	class dummybutton : RscDummy             {idc = 1006;};
};

class uninteraktion {
	idd = -1; movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {button_disarm, button_drugs, button_restrain, button_drag, cancel, button_heal, button_inventarsearch, dummybutton};
	
	class DLG_BACK1: RscBackground           {x = 0.40; y = 0.25;w = 0.22; h = 0.58;};
	class background : RscBgRahmen           {x = 0.40; y = 0.25;w = 0.22; h = 0.58;text = "Civ-Menu";};
	class button_disarm : RscButton          {idc = 1;x = 0.41; y = 0.28;w = 0.20; h = 0.04;text = "Disarm";				action = "[2] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_drugs : RscButton           {idc = 2;x = 0.41; y = 0.33;w = 0.20; h = 0.04;text = "Illegal Item Search";	action = "[1] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_restrain : RscButton        {idc = 6;x = 0.41; y = 0.48;w = 0.20; h = 0.04;text = "Restrain/Release";		action = "[] execVM ""Restrain.sqf""; closedialog 0";};
	class button_drag : RscButton            {idc = 5;x = 0.41; y = 0.53;w = 0.20; h = 0.04;text = "Drag";					action = "[40] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_heal : RscButton            {idc = 13;x = 0.41; y = 0.63;w = 0.20; h = 0.04;text = "Heal this civ";		action = "[5] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_papersearch : RscButton     {idc = 13;x = 0.41; y = 0.68;w = 0.20; h = 0.04;text = "Check Papers";			action = "[8] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_inventarsearch : RscButton  {idc = 14;x = 0.41; y = 0.73;w = 0.20; h = 0.04;text = "Check Inventory";		action = "[6] execVM ""civmenuinit.sqf""; closedialog 0";};
	class cancel : RscButton                 {x = 0.41; y = 0.78;w = 0.20; h = 0.04;text = $STRD_description_cancel;		action = "closedialog 0";};
	class dummybutton : RscDummy             {idc = 1006;};
};

class civinteraktion {
	idd = -1; movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {button_steal, cancel, button_inventarsearch, dummybutton,button_Ziptie};
	
	class DLG_BACK1: RscBackground           {x = 0.40; y = 0.25;w = 0.22; h = 0.58;};
	class background : RscBgRahmen           {x = 0.40;  y = 0.25;w = 0.22; h = 0.58;text = "Civ-Menu";};
	class button_steal : RscButton           {idc = 1; x = 0.41; y = 0.28;w = 0.20; h = 0.04; text = "Rob Inventory";   action = "[20] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_Ziptie : RscButton {idc = 15;x = 0.41; y = 0.38;w = 0.20; h = 0.04; text = $STRD_description_civmenu_ZipTie;action = "execVM ""ziptie.sqf""; closedialog 0";};
	class button_papersearch : RscButton     {idc = 13;x = 0.41; y = 0.68;w = 0.20; h = 0.04;text = "Check Papers";	action = "[8] execVM ""civmenuinit.sqf""; closedialog 0";};
	class button_inventarsearch : RscButton  {idc = 14;x = 0.41; y = 0.73;w = 0.20; h = 0.04;text = "Check Inventory";action = "[6] execVM ""civmenuinit.sqf""; closedialog 0";};
	class cancel : RscButton                        {x = 0.41; y = 0.78;w = 0.20; h = 0.04; text = $STRD_description_cancel;          action = "closedialog 0";};
	class dummybutton : RscDummy           {idc = 1006;};
};