
class baseInteraction {
	idd = -1; movingEnable = true;
	controlsBackground[] = {bgBase, frmBase};
	objects[] = {};
	controls[] = {btnPapers,btnDisarm,btnInventarsearch,btnCancel,btnDummy};
	class bgBase: RscBackground {x = 0.40; y = 0.20;w = 0.22; h = 0.58; colorBackground[] = { 0, 0, 0, 0.8 };};
	class frmBase : RscBgRahmen {x = 0.40; y = 0.20;w = 0.22; h = 0.58;text = "Interaction Menu";};
	class btnDisarm : RscButton {idc = 1;x = 0.41; y = 0.28;w = 0.20; h = 0.04;text = "Disarm";	action = "[2] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnPapers : RscButton {idc = 13;x = 0.41; y = 0.63;w = 0.20; h = 0.04;text = "Check Papers";	action = "[8] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnInventarsearch : RscButton  {idc = 14;x = 0.41; y = 0.68;w = 0.20; h = 0.04;text = "Check Inventory"; action = "[6] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnCancel : RscButton {x = 0.41; y = 0.73;w = 0.20; h = 0.04;text = $STRD_description_cancel; action = "closedialog 0";};
	class btnDummy : RscDummy	{idc = 1006;};
};

class civmenu : baseInteraction {
	idd = -1; movingEnable = true;
	controls[] = {btnDrag,btnDrugs,btnRestrain,ticket_eingabe,btnTicket,btnPapers,btnDisarm,btnInventarsearch,btnCancel,btnDummy};
	class btnDrag : RscButton            {idc = 5;x = 0.41; y = 0.23;w = 0.20; h = 0.04;text = "Drag"; action = "[40] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnDrugs : RscButton           {idc = 2;x = 0.41; y = 0.33;w = 0.20; h = 0.04;text = "Illegal Item Search"; action = "[1] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnRestrain : RscButton        {idc = 6;x = 0.41; y = 0.38;w = 0.20; h = 0.04;text = "Restrain/Release"; action = "[] execVM ""restrain.sqf""; closedialog 0";};
	class ticket_eingabe : RscEdit       {idc = 11;x = 0.41; y = 0.48;w = 0.20; h = 0.03;text = "1000";};
	class btnTicket : RscButton          {x = 0.41; y = 0.53;w = 0.20; h = 0.04;text = "Ticket"; action = "[4, ctrlText 11] execVM ""civmenuinit.sqf""; closedialog 0";};
};

class uninteraktion : baseInteraction {
	idd = -1; movingEnable = true;
	controls[] = {btnDrag,btnDrugs,btnRestrain,btnHeal,btnPapers,btnDisarm,btnInventarsearch,btnCancel,btnDummy};
	class btnDrugs : RscButton           {idc = 2;x = 0.41; y = 0.33;w = 0.20; h = 0.04;text = "Illegal Item Search";	action = "[1] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnRestrain : RscButton        {idc = 6;x = 0.41; y = 0.48;w = 0.20; h = 0.04;text = "Restrain/Release";		action = "[] execVM ""restrain.sqf""; closedialog 0";};
	class btnDrag : RscButton            {idc = 5;x = 0.41; y = 0.53;w = 0.20; h = 0.04;text = "Drag";					action = "[40] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnHeal : RscButton            {idc = 13;x = 0.41; y = 0.23;w = 0.20; h = 0.04;text = "Heal this civ";		action = "[5] execVM ""civmenuinit.sqf""; closedialog 0";};
};

class civinteraktion : baseInteraction {
	idd = -1; movingEnable = true;
	controls[] = {btnDrag,btnSteal,btnZiptie,btnPapers,btnDisarm,btnInventarsearch,btnCancel,btnDummy};
	class btnDrag : RscButton {idc = 5;x = 0.41; y = 0.23;w = 0.20; h = 0.04;text = "Drag"; action = "[40] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnSteal : RscButton {idc = 1; x = 0.41; y = 0.33;w = 0.20; h = 0.04; text = "Rob Inventory"; action = "[20] execVM ""civmenuinit.sqf""; closedialog 0";};
	class btnZiptie : RscButton {idc = 15;x = 0.41; y = 0.38;w = 0.20; h = 0.04; text = $STRD_description_civmenu_ZipTie;action = "execVM ""ziptie.sqf""; closedialog 0";};
};
