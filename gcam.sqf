// CONFIG

// Move Speed ( Recommended 0.0-1.0 )
#define CFMOVE 0.8

// Turn Speed ( Recommended 0.0-1.0 )
#define CFTRK 0.5

// Zoom Speed ( Recommended 0.0-1.0 )
#define CFWHEEL 0.3

// Show Unit Type in Units List and in Map. ( true | false )
#define LISTFRIENDLY true
#define LISTENEMY true
#define LISTCIVILIAN true
#define LISTANIMAL false

// Smoothly unit switching movement. ( true | false )
#define SWITCHSMOOTH true

// Camera and unit distance adjusts with unit size after unit switches. ( true | false )
#define SWITCHADJDIS true

// The unit shows up in screen center after unit switches. ( true | false )
#define SWITCHCENTER false

// Enable/disable Acctime changing function. ( true | false )
// Acctime is changed by units list view.
#define SHOWTIMEACC false

// Enable/disable warhead chasing function. ( true | false )
// Chase trigger is set by units list view or T key.
#define SHOWTRIGGER false

// Limitation player ends GCam. ( true | false )
// GCam can be ended only by commanding GCamKill = true.
// This option is for MP use.
#define LIMITQUIT false

// When GCamKill = true, GCam quits immediately.
GCamKill = false;

//=================================================================================
// CONFIG ADVANCED

// Initial camera parameter.
#define INITCAMDISY 7.5
#define INITCAMDISZ 2.5
#define INITCAMAGL -8
#define INITCAMZOOM 0.7

// Initial mode enable/disable statement.
#define INITFOLLOWMODE true
#define INITBEHINDMODE true
#define INITFOCUSMODE true

// Attenuation coefficient of camera movement.
#define MOVEATTEN 0.8
#define TURNATTEN 0.8
#define ZOOMATTEN 0.8

// Behind mode parameter.
#define BEHINDSPDAROUND 0.056
#define BEHINDSPDROTATE 2.7

// Smooth switch parameter.
#define SWITCHSPEED 510

// Dialog text color.
#define COLORTEXT [ 0.874, 0.843, 0.647, 1.000 ]
#define COLORTEXTBACKGROUND [ 0.360, 0.345, 0.270, 0.850 ]

// Dialog button text color.
#define COLORBUTTONTEXTOFF [ 0.874, 0.843, 0.647, 1.000 ]
#define COLORBUTTONTEXTON [ 1.00, 0.00, 0.00, 1.00 ]

// Map icon color.
#define COLORSCANAREA "ColorOrange"
#define COLORICONCAMERA "ColorBlack"
#define COLORICONFRIENDLY "ColorBlue"
#define COLORICONENEMY "ColorRed"
#define COLORICONANIMAL "ColorGreen"

// Map background color.
#define COLORMAPBACKGROUND [ 1.00, 0.99, 0.90, 0.85 ]

// List item color.
#define COLORLISTFOLLOWGROUP [ 0.8, 0.8, 0.7, 1.00 ]
#define COLORLISTFRIENDLY [ 0.259, 0.663, 0.953, 1.000 ]
#define COLORLISTENEMY [ 0.95, 0.48, 0.38, 1.00 ]
#define COLORLISTCIVILIAN [ 0.85, 0.65, 0.30, 1.0 ]
#define COLORLISTANIMAL [0.35,0.75,0.35,1]


//=================================================================================


GCam_KeyDown = [0,-1];
GCam_KeyDown_List = [0,-1];
GCam_KeyDown_ListTrigger = [0,-1];
GCam_KeyDown_ListFollow = [0,-1];
GCam_KeyDown_ListBehind = [0,-1];
GCam_KeyDown_ListFocus = [0,-1];
GCam_KeyDown_ListClose = [0,-1];
GCam_KeyDown_ListTimeInc = [0,-1];
GCam_KeyDown_ListTimeDec = [0,-1];
GCam_KeyDown_Map = [0,-1];
GCam_KeyDown_MapScan = [0,-1];
GCam_KeyDown_MapClose = [0,-1];
GCam_Keydown_QuitOk = [0,-1];
GCam_Keydown_QuitPause = [0,-1];
GCam_Keydown_QuitCancel = [0,-1];
GCam_Keydown_HelpClose = [0,-1];
GCam_KeyUp = [0,-1];
GCam_MouseMove = [0,0,0];
GCam_MouseWheel = [0,0];
GCam_MouseBD = [0,-1];
GCam_MouseBU = [0,-1];
GCam_MouseSelect_List = [0,-1];
GCam_MouseClick_ListClose = [0,-1];
GCam_MouseClick_ListBehind = [0,-1];
GCam_MouseClick_ListFollow = [0,-1];
GCam_MouseClick_ListFocus = [0,-1];
GCam_MouseClick_ListTimeInc = [0,-1];
GCam_MouseClick_ListTimeDec = [0,-1];
GCam_MouseClick_ListTrigger = [0,-1];
GCam_MouseClick_MapClose = [0,-1];
GCam_MouseClick_MapScan = [0,-1];
GCam_MouseClick_QuitOk = [0,-1];
GCam_MouseClick_QuitCancel = [0,-1];
GCam_MouseClick_HelpClose = [0,-1];

GCam_Map_Clicked = false;
GCam_Map_Clicked_PosX = 0;
GCam_Map_Clicked_PosY = 0;

GCam_Trigger = false;
GCam_Obj = objnull;

GCam_Titletext_Lock = 0.0;


_loopexit = false;
_quitchk = true;
_wait = accTime / (diag_fps * 2);

_obj = objnull;
_obj_last = objnull;
_cam = objnull;
_dir = 0.0;
_dive = 0.0;
_zoom = INITCAMZOOM;
_accdir = 0.0;
_accdive = 0.0;
_acczoom = 0.0;
_accx = 0.0;
_accy = 0.0;
_accz = 0.0;
_objpos = getposATL player;
_campos = [0.0,0.0,0.0];
_campos_rel = [0.0,0.0,0.0];
_cfzoom = sin((_zoom / 1.8) * 90);
camUseNVG false;
_nvg = true;
_cfalt = 1.0;
_pausecount = 0;
_quit = false;
_initacctime = acctime;
_initteamswitch = teamSwitchEnabled;
enableTeamSwitch false;
_helpshow = false;
_helptext = "-= GCam =-\n\n- Common Operation -\nW,A,S,D : Move Horizontal\nQ,Z : Up/Down\n2,X : Move Straight\nMouse Move : Turning\nMouse Drag (list view) : Turning\nMouse Wheel : Zooming\nMouse L Click : Switch Screen Centered Unit\nMouse L Click (smooth switching) : Skip Smooth Switching\nMouse L Click (warhead chasing) : Break Warhead Chasing\nMouse R Click : To Default Zoom\nCursor Up/Down : Switch Unit in Group\nCursor Left/Right : Switch Group\nCursor (smooth switching): Skip or Back Smooth Switching\nL : Units List\nM : Map Click to Switch Unit\nN : Night Vision\nB : Toggle Behind Mode\nF : Toggle Follow Mode\nC : Toggle Focus Mode\nT : Set Warhead Chasing Trigger\nH : Help\nSpace : Quit Menu\n\n- Behind Mode Operation -\nA,D : Move Around\nW,S : Move Horizontal Near/Far\n2,X : Move Near/Far\n\n- Map Operation -\nMouse Left Click : Scan and Show Groups\nMouse Left Click (icon) : Switch Clicked Unit\n\nVer.1.13";
_changedkey = -1;
_mousemove = false;

_behind = INITBEHINDMODE;
_follow = INITFOLLOWMODE;
_focus = INITFOCUSMODE;
_trigger = false;

_ehid_keydown = -1;
_ehid_keyup = -1;
_ehid_mousemove = -1;
_ehid_mousezchange = -1;
_ehid_mousebd = -1;
_ehid_mousebu = -1;

_keyd = -1;
_keyd_listbehind = -1;
_keyd_listfocus = -1;
_keyd_listclose = -1;
_keyd_listtimeinc = -1;
_keyd_listtimedec = -1;
_keyd_map = -1;
_keyd_mapscan = -1;
_keyd_mapclose = -1;
_keyd_quitok = -1;
_keyd_quitpause = -1;
_keyd_quitcancel = -1;
_keyd_helpclose = -1;
_keyu = 0;
_cs_mousedowned = false;
_mousepos = [0.0,0.0];
_mouseacc = acctime^1.5 + 0.007;
_wheel = 0.0;
_mselect_list = -1;
_mclick_listtrigger = -1;
_mclick_listfollow = -1;
_mclick_listbehind = -1;
_mclick_listfocus = -1;
_mclick_listclose = -1;
_mclick_listtimeinc = -1;
_mclick_listtimedec = -1;
_mclick_mapscan = -1;
_mclick_quitok = -1;
_mclick_quitpause = -1;
_mclick_quitcancel = -1;
_mclick_helpclose = -1;


_ma_objpos = [0.0,0.0,0.0];
_ma_objlist = [];
_ma_mapshow = false;
_ma_scanned = false;
_ma_scantime = 0.0;
_ma_scanpos = [];
_ma_markername = "";
_ma_passtime = 0.0;
_ma_msizecoef = 1.0;
_ma_marked_objlist = [];


_tx_addspace = "";
_tx_crewname = "";

_so_objlist = [];
_so_chkgroup = grpNull;
_so_noleadercivgrp = [];
_so_objgroup = grpNull;
_so_grpmatch = false;
_so_matchobj = objnull;
_so_chkunit = objnull;
_so_firstunit_chkd = false;
_so_ignobjlist = [];
_so_enobjlist = [];
_so_leaderlist = [];

_cy_objlist_ingroup = [];
_cy_objlist_leader = [];
_cy_vehlist = [];
_cy_num = 0;
_cy_i = 0;
_cy_selectnum = 0;

_li_objlist = [];
_li_listshow = false;
_li_cnt = 0;
_li_selectedgroup = grpNull;


_sm_loop = false;
_sm_cnt = 0;
_sm_campos = [0.0,0.0,0.0];
_sm_objpos = [0.0,0.0,0.0];
_sm_camobjdis_ary = [0.0,0.0,0.0];
_sm_camobjxydis = 0.0;
_sm_corrattde = 0.0;
_sm_camobjdir = 0.0;
_sm_camobjdir_dif = 0.0;
_sm_camobjdive = 0.0;
_sm_dive_dif = 0.0;
_sm_campos_tar = [0.0,0.0,0.0];
_sm_campos_tar_last = [0.0,0.0,0.0];

_re_camobjdir = 0.0;
_re_camposrel_last = [0.0,0.0,0.0];

_fo_camobjxydis = INITCAMDISY;
_fo_camobjzdis = INITCAMDISZ;
_fo_camdir_add = 0.0;
_fo_camobjdir = 0.0;
_fo_dir_last = 0.0;
_fo_dive_last = 0.0;

_be_corrattde = 0.0;
_be_camobjxydis_tar = INITCAMDISY;
_be_camobjxydis = INITCAMDISY;
_be_objdir = 0.0;
_be_camobjdir_add = 0.0;
_be_turncoef = 0.0;
_be_keypushed = false;
_be_lr = 0;
_be_lr_last = 0;
_be_camobjtardir = 0.0;
_be_camobjdir = 0.0;
_be_camobjdir_dif = 0.0;
_be_camdir_add = 0.0;
_be_camdir_tar = 0.0;
_be_camdir_dif = 0.0;
_be_camobjdive = 0.0;

_fc_objpos = [0.0,0.0,0.0];
_fc_camobjxydis = 0.0;
_fc_camobjdir = 0.0;
_fc_camdir_add = 0.0;
_fc_camobjdir_dif = 0.0;
_fc_dive_last = 0.0;
_fc_camdive_add = 0.0;
_fc_camobjdive_dif = 0.0;
_fc_corrattde = 0.0;

_cs_objlist = [];
_cs_objpos = [0.0,0.0,0.0];
_cs_scrpos = [0.0,0.0];
_cs_scr_dis = 0.0;
_cs_change = false;
_cs_clickareasize = 0.0;
_cs_clickareasize_coef = 0.0;
_cs_match = false;
_cs_zcor = 0.0;
_cs_corrattde = 0.0;
_cs_bdtime = 0.0;
_cs_clickinterv = 0.0;
_cs_mancnt = 0;
_cs_notreach = true;

_tr_ehidx = -1;
_tr_chase = false;

_cm_obj = objnull;
_cm_objpos = [0.0,0.0,0.0];
_cm_campos = [0.0,0.0,0.0];
_cm_campos_rel = [0.0,0.0,0.0];
_cm_loop = false;

_scandistance = 100000;


_SelectObjects =
{
	_so_ignobjlist = [];
	{
		if ( !(alive _x) or ((count(crew _x)) == 0) or (format ["%1", isplayer _x] == "false") ) then { _so_ignobjlist = _so_ignobjlist + [_x] };
	} forEach _so_objlist;
	_so_objlist = _so_objlist - _so_ignobjlist;

	if (LISTCIVILIAN) then
	{
		_so_ignobjlist = [];
		_so_noleadercivgrp = [];
		{
			if ( (typeOf _x) == "BIS_alice_emptydoor" ) then
			{
				if ( format["%1",leader(group _x)] == format["%1",_x] ) then
				{
					_so_noleadercivgrp = _so_noleadercivgrp + [group _x];
				};
				_so_ignobjlist = _so_ignobjlist + [_x];

			};
		} forEach _so_objlist;
		_so_objlist = _so_objlist - _so_ignobjlist;

		{
			_so_ignobjlist = [];
			_so_chkgroup = _x;
			_so_grpmatch = false;
			{
				if ( (group _obj) != _so_chkgroup ) then
				{
					if ( _so_grpmatch and (_so_chkgroup == (group _x)) ) then
					{
						_so_ignobjlist = _so_ignobjlist + [_x];
					};
					if ( !(_so_grpmatch) and (_so_chkgroup == (group _x)) ) then
					{
						_so_grpmatch = true;
					};
				};
			} forEach _so_objlist;
			_so_objlist = _so_objlist - _so_ignobjlist;
		} forEach _so_noleadercivgrp;
	};

	if ( !(LISTFRIENDLY) ) then
	{
		_so_ignobjlist = [];
		{
			if ( ((side player) getFriend (side _x)) >= 0.6 and !(((crew _x) select 0) iskindof "Civilian") and !(_x iskindof "Animal") ) then { _so_ignobjlist = _so_ignobjlist + [_x] };
		} forEach _so_objlist;
		_so_objlist = _so_objlist - _so_ignobjlist;
	};

	if ( !(LISTENEMY) ) then
	{
		_so_enobjlist = [];
		{
			if ( ((side player) getFriend (side _x)) < 0.6 and !(((crew _x) select 0) iskindof "Civilian") and !(_x iskindof "Animal") ) then { _so_enobjlist = _so_enobjlist + [_x] };
		} forEach _so_objlist;
		_so_objlist = _so_objlist - _so_enobjlist;
	};

	if ( !(LISTCIVILIAN) ) then
	{
		_so_ignobjlist = [];
		{
			if ( ((crew _x) select 0) iskindof "Civilian" ) then { _so_ignobjlist = _so_ignobjlist + [_x] };
		} forEach _so_objlist;
		_so_objlist = _so_objlist - _so_ignobjlist;
	};

	if ( !(_cs_change) ) then
	{
		if ( _mselect_list == -1 and !(GCam_Map_Clicked) ) then
		{
			_so_grpmatch = false;
			_so_matchobj = objnull;
			{
				if ( _so_objgroup == (group _x) ) then
				{
					_so_matchobj = _x;
					_so_grpmatch = true;
					_so_objgroup = grpNull;
				};
			} forEach _so_objlist;

			if (_so_grpmatch) then
			{
				_so_objlist = _so_objlist - [_so_matchobj];
				_so_objlist = [_so_matchobj] + _so_objlist;
			};
		};

		_so_leaderlist = [];
		{
			if ( ((group _obj) != (group _x)) and !(alive(leader(group _x))) ) then
			{
				_so_chkunit = _x;
				_so_firstunit_chkd = false;
				{
					if ( !(_so_firstunit_chkd) ) then
					{
						if ( (alive _x) and (_so_chkunit == _x) ) then
						{
							_so_leaderlist = _so_leaderlist + [_so_chkunit];
							_so_firstunit_chkd = true;
						};
						if ( (alive _x) and (_so_chkunit != _x) ) then
						{
							_so_firstunit_chkd = true;
						};
					};
				} forEach units(group _x);
			};
			if ( ((group _obj) == (group _x)) or (vehicle(leader(group _x)) == (vehicle _x)) or ((_x iskindof "Animal") and LISTANIMAL) or ((group _x) in _so_noleadercivgrp) ) then { _so_leaderlist = _so_leaderlist + [_x] };
		} forEach _so_objlist;
		_so_objlist = _so_leaderlist;

		if ( !(alive _obj) and (_obj != _obj_last) ) then { _so_objlist = [_obj] + _so_objlist };
	};
};


_SelectCycleUnits =
{
	_cy_objlist_ingroup = [];
	_cy_vehlist = [];
	_cy_num = 0;
	_cy_i = 0;
	{
		if ( alive _x and !(_x iskindof "BIS_alice_emptydoor") ) then
		{
			if ( vehicle _x == _x ) then
			{
				_cy_objlist_ingroup = _cy_objlist_ingroup + [_x];
				if (_obj == vehicle _x) then
				{
					_cy_num = _cy_i;
				};
				_cy_i = _cy_i + 1;
			}
			else
			{
				if ( !((vehicle _x) in _cy_vehlist) ) then
				{
					_cy_objlist_ingroup = _cy_objlist_ingroup + [vehicle _x];
					_cy_vehlist = _cy_vehlist + [vehicle _x];
					if (_obj == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
		};
	} foreach units(group _obj);
};


_SelectCycleLeaders =
{
	_cy_objlist_leader = [];
	_cy_num = 0;
	_cy_i = 0;
	{
		if ( leader(group _x) == _x ) then
		{
			if ( LISTCIVILIAN ) then
			{
				if ( ((typeOf _x) != "BIS_alice_emptydoor") and (_x iskindof "Civilian") and (format ["%1", isplayer _x] == "true") ) then
				{
					_cy_objlist_leader = _cy_objlist_leader + [vehicle _x];
					if (vehicle(leader(group _obj)) == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTFRIENDLY ) then
			{
				if ( (((side player) getFriend (side _x)) >= 0.6) and !(_x iskindof "Civilian") and !(_x iskindof "Animal") and (format ["%1", isplayer _x] == "true") ) then
				{
					_cy_objlist_leader = _cy_objlist_leader + [vehicle _x];
					if (vehicle(leader(group _obj)) == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTENEMY ) then
			{
				if ( (((side player) getFriend (side _x)) < 0.6) and !(_x iskindof "Civilian") and !(_x iskindof "Animal") and (format ["%1", isplayer _x] == "true") ) then
				{
					_cy_objlist_leader = _cy_objlist_leader + [vehicle _x];
					if (vehicle(leader(group _obj)) == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTANIMAL ) then
			{
				if ( _x iskindof "Animal" and (format ["%1", isplayer _x] == "true") ) then
				{
					_cy_objlist_leader = _cy_objlist_leader + [vehicle _x];
					if (vehicle(leader(group _obj)) == vehicle _x) then
					{
						_cy_num = _cy_i;
					};
					_cy_i = _cy_i + 1;
				};
			};
		};
	} foreach allUnits;
};


_ListObjects =
{
	_li_cnt = 0;
	_li_selectedgroup = group _obj;

	lbClear 0;

	{
		if ( (vehicle(leader(group _x)) != (vehicle _x)) and !(_x iskindof "Animal") ) then
		{ _tx_addspace = " " }
		else
		{ _tx_addspace = "" };

		_tx_crewname = "";
		if ((_so_objlist select 0) == _x) then
		{
			{
				if (((crew(_so_objlist select 0)) select 0) != _x) then { _tx_crewname = _tx_crewname + ", " };
				_tx_crewname = _tx_crewname + format["%1", name _x];
			} forEach (crew _x);
		}
		else
		{
			_tx_crewname = name _x;
		};

		lbAdd[ 0, format[ "%3%1 : %2", getText( configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName" ), _tx_crewname, _tx_addspace ] ];

		switch (true) do
		{
			case ( (_li_selectedgroup == (group _x)) or ((_x iskindof "Animal") and (_x == (_so_objlist select 0)) and _obj == _X) ):
			{ lbSetColor[ 0, _li_cnt, COLORLISTFOLLOWGROUP ] };
			case ( ((crew _x) select 0) iskindof "Civilian" ):
			{ lbSetColor[ 0, _li_cnt, COLORLISTCIVILIAN ] };
			case ( _x iskindof "Animal" ):
			{ lbSetColor[ 0, _li_cnt, COLORLISTANIMAL ] };
			case ( ((side player) getFriend (side _x) ) < 0.6):
			{ lbSetColor[ 0, _li_cnt, COLORLISTENEMY ] };
			case ( ((side player) getFriend (side _x) ) >= 0.6):
			{ lbSetColor[ 0, _li_cnt, COLORLISTFRIENDLY ] };
		};

		_li_cnt = _li_cnt + 1;
	} forEach _so_objlist;
};


_MarkerSet =
{
	"object" setMarkerSizeLocal [0.0, 0.0];

	switch (true) do
	{
		case ((_obj iskindof "Animal") or (((crew _obj) select 0) iskindof "Civilian")):
		{ "object" setMarkerColorLocal COLORICONANIMAL };
		case (((side player) getFriend (side _obj)) < 0.6):
		{ "object" setMarkerColorLocal COLORICONENEMY };
		case (((side player) getFriend (side _obj)) >= 0.6):
		{ "object" setMarkerColorLocal COLORICONFRIENDLY };
	};

	_tx_crewname = "";
	if ( (count(crew _obj)) > 1) then
	{
		{
			if (((crew _obj) select 0) != _x) then { _tx_crewname = _tx_crewname + ", " };
			_tx_crewname = _tx_crewname + format["%1", name _x];
		} forEach (crew _obj)
	}
	else
	{
		_tx_crewname = name _obj;
	};

	"object" setMarkerTextLocal format["%1 : %2", getText (configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName"), _tx_crewname];

	"object" setMarkerPosLocal [getposASL _obj select 0, getposASL _obj select 1];
	"object" setMarkerTypeLocal "dot";
	"object" setMarkerSizeLocal [1, 1];
};


_ScanMarkerSet =
{
	if (_ma_scanned) then { { deleteMarkerLocal _x } forEach _ma_marked_objlist };
	deleteMarkerLocal "circle";

	_ma_marked_objlist = [];
	{
		_ma_marked_objlist = _ma_marked_objlist + [format["%1",_x]];
	} forEach _so_objlist;

	createMarkerLocal[ "circle", [ _ma_scanpos select 0, _ma_scanpos select 1 ] ];
	"circle" setMarkerShapeLocal "ELLIPSE";
	"circle" setMarkerBrushLocal "SOLID";
	"circle" setMarkerColorLocal COLORSCANAREA;
	"circle" setMarkerAlphaLocal 0.3;
	"circle" setMarkerSizeLocal [_scandistance, _scandistance];

	{
		if ( _obj != _x ) then
		{
			_ma_markername = format["%1",_x];
			createMarkerLocal[ _ma_markername, [ getposASL _x select 0, getposASL _x select 1 ] ];
			_ma_markername setMarkerShapeLocal "ICON";
			_ma_markername setMarkerSizeLocal [0.0,0.0];

			if ((speed _x) > 4) then
			{
				_ma_markername setMarkerTypeLocal "mil_Arrow2";
				_ma_markername setMarkerDirLocal (getdir _x);
				_ma_msizecoef = 0.425;
			}
			else
			{
				_ma_markername setMarkerTypeLocal "dot";
				_ma_msizecoef = 1;
			};

			switch (true) do
			{
				case ((_x iskindof "Animal") or (((crew _x) select 0) iskindof "Civilian")):
				{
					_ma_markername setMarkerColorLocal COLORICONANIMAL;
				};
				case (((side player) getFriend (side _x)) < 0.6):
				{
					_ma_markername setMarkerColorLocal COLORICONENEMY;
				};
				case (((side player) getFriend (side _x)) >= 0.6):
				{
					_ma_markername setMarkerColorLocal COLORICONFRIENDLY;
				};
			};

			if ( (group _obj) == (group _x) ) then
			{
				_ma_markername setMarkerSizeLocal [0.6 * _ma_msizecoef, 0.6 * _ma_msizecoef];
			}
			else
			{
				_ma_markername setMarkerSizeLocal [1.0 * _ma_msizecoef, 1.0 * _ma_msizecoef];
			};
		};
	} forEach _so_objlist;

	_ma_scanned = true;
	_ma_scantime = diag_tickTime;
};


_ChangeModeFollow =
{
	_follow = !(_follow);

	if (_follow) then
	{
		titletext[ "Follow Mode Enabled", "plain down", _wait*15 ];

		if (_li_listshow) then
		{
			(findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTON;
			(findDisplay 5100 displayCtrl 6) ctrlShow false;
			(findDisplay 5100 displayCtrl 5) ctrlShow true;
			if (_behind) then
			{ (findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTON }
			else
			{ (findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTOFF };
			if (SHOWTRIGGER) then
			{
				(findDisplay 5100 displayCtrl 3) ctrlShow true;
				if (_trigger) then
				{ (findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTON }
				else
				{ (findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF };
			};
		};

		_cfalt = 1.0;

		if (_behind) then
		{
			_be_camobjxydis_tar = _fo_camobjxydis;
			_be_camobjxydis = _be_camobjxydis_tar;

			_be_camdir_add = 0.0;
			_be_camobjdir_add = 0.0;

			_objpos = getposASL _obj;
			_campos_rel = [ cos(((getdir _obj)+90.0)*-1) * _be_camobjxydis_tar, sin(((getdir _obj)+90.0)*-1) * _be_camobjxydis_tar, _fo_camobjzdis ];
			_campos = [ (_objpos select 0) + (_campos_rel select 0) , (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2) ];

			_dir = ((getdir _obj) -90.0) * -1;
			if (_dir >= 360.0) then { _dir = _dir - 360.0 };
			if (_dir < 0.0) then { _dir = _dir + 360.0 };

			_dive = _fo_dive_last;
		}
		else
		{
			_campos_rel = [ cos(_dir+180) * _fo_camobjxydis, sin(_dir+180) * _fo_camobjxydis, _fo_camobjzdis ];

			_dive = _fo_dive_last;
		};
	}
	else
	{
		titletext[ "Follow Mode Disabled", "plain down", _wait*15 ];

		if (_li_listshow) then
		{
			(findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTOFF;
			(findDisplay 5100 displayCtrl 5) ctrlShow false;
			(findDisplay 5100 displayCtrl 6) ctrlShow true;
			if (_focus) then
			{ (findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTON }
			else
			{ (findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTOFF };
			if (SHOWTRIGGER) then
			{
				(findDisplay 5100 displayCtrl 3) ctrlShow false;
			};
		};

		_fo_camobjxydis = sqrt((_campos_rel select 0)^2.0 + (_campos_rel select 1)^2.0);
		_fo_camobjzdis = _campos_rel select 2;
		_fo_dive_last = _dive;
		_fo_dir_last = _dir;

		if (_behind) then
		{
			if (_focus) then
			{
				_fc_camdir_add = _be_camdir_add;
			}
			else
			{

			};
		}
		else
		{
			if (_focus) then
			{
				_fc_camdir_add = ( ( ((getposASL _obj select 0) - (getposASL _cam select 0)) atan2 ((getposASL _obj select 1) - (getposASL _cam select 1)) ) -90.0 ) * -1;
				if ( _fc_camdir_add >= 360.0 ) then { _fc_camdir_add = _fc_camdir_add - 360.0 };
				if ( _fc_camdir_add < 0.0 ) then { _fc_camdir_add = _fc_camdir_add + 360.0 };
				_fc_camdir_add = _dir - _fc_camdir_add;
				if ( _fc_camdir_add >= 360.0 ) then { _fc_camdir_add = _fc_camdir_add - 360.0 };
				if ( _fc_camdir_add < 0.0 ) then { _fc_camdir_add = _fc_camdir_add + 360.0 };
			}
			else
			{

			};
		};
	};
};


_ChangeModeBehind =
{
	_behind = !(_behind);

	if (_behind) then
	{
		titletext[ "Behind Mode Enabled", "plain down", _wait*15 ];

		if (_li_listshow) then
		{
			(findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTON;
		};

		if (_follow) then
		{
			_be_camobjxydis_tar = sqrt((_campos_rel select 0)^2.0 + (_campos_rel select 1)^2.0);
			_be_camobjxydis = _be_camobjxydis_tar;

			_be_camdir_add = 0.0;
			_be_camobjdir_add = 0.0;

			_campos_rel = [ cos((((getdir _obj)+90.0)*-1)+_be_camobjdir_add) * _be_camobjxydis_tar, sin((((getdir _obj)+90.0)*-1)+_be_camobjdir_add) * _be_camobjxydis_tar, _campos_rel select 2 ];

			_dir = ((getdir _obj) -90) * -1;
			if (_dir >= 360.0) then { _dir = _dir - 360.0 };
			if (_dir < 0.0) then { _dir = _dir + 360.0 };
		};
	}
	else
	{
		titletext[ "Behind Mode Disabled", "plain down", _wait*15 ];

		if (_li_listshow) then
		{
			(findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTOFF;
		};
	};
};


_ChangeModeFocus =
{
	_focus = !(_focus);

	if (_focus) then
	{
		titletext[ "Focus Mode Enabled", "plain down", _wait*15 ];

		if (_li_listshow) then
		{
			(findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTON;
		};

		if (_follow) then
		{

		}
		else
		{
			_fc_sw_camobjdir = ( ( ((getposASL _obj select 0) - (getposASL _cam select 0)) atan2 ((getposASL _obj select 1) - (getposASL _cam select 1)) ) +90 ) * -1;
			_campos_rel = [ cos(_fc_sw_camobjdir) * _fo_camobjxydis, sin(_fc_sw_camobjdir) * _fo_camobjxydis, _fo_camobjzdis ];
			_objpos = getposASL _obj;

			_fc_camdir_add = 0.0;
			_fc_camdive_add = 0.0;

			if (_behind) then
			{
				_campos_rel = [ cos(((getdir _obj)+90)*-1) * _fo_camobjxydis, sin(((getdir _obj)+90)*-1) * _fo_camobjxydis, _fo_camobjzdis ];

				_dir = ((getdir _obj) -90) * -1;
				if (_dir >= 360.0) then { _dir = _dir - 360.0 };
				if (_dir < 0.0) then { _dir = _dir + 360.0 };
			};
		};
	}
	else
	{
		titletext[ "Focus Mode Disabled", "plain down", _wait*15 ];

		if (_li_listshow) then
		{
			(findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTOFF;
		};
	};
};


_ChangeModeTrigger =
{
	_trigger = !(_trigger);

	if (_trigger) then
	{
		titletext[ "Warhead Trigger Set",  "plain down", _wait*10 ];

		if (_li_listshow) then
		{
			(findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTON;
		};

		call _SetFiredHandler;
	}
	else
	{
		titletext[ "Warhead Trigger Cancel",  "plain down", _wait*10 ];

		if (_li_listshow) then
		{
			(findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF;
		};

		_obj removeEventHandler ["fired", _tr_ehidx];
	};
};


_OpenList =
{
	_li_listshow = true;

	_accx = 0.0;
	_accy = 0.0;
	_accz = 0.0;
	_accdir = 0.0;
	_accdive = 0.0;
	_acczoom = 0.0;

	call _CloseMap;
	call _CloseHelp;

	setmouseposition [0.75,0.50];

	createDialog "GCam_Dialog_List";
	waituntil{ctrlShown(findDisplay 5100 displayCtrl 0)};

	(findDisplay 5100 displayCtrl 0) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_List = _this"];
	(findDisplay 5100 displayCtrl 0) ctrlSetEventHandler ["LBSelChanged", "GCam_MouseSelect_List = _this"];
	(findDisplay 5100 displayCtrl 3) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_ListTrigger = _this"];
	(findDisplay 5100 displayCtrl 3) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_ListTrigger = _this"];
	(findDisplay 5100 displayCtrl 4) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_ListFollow = _this"];
	(findDisplay 5100 displayCtrl 4) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_ListFollow = _this"];
	(findDisplay 5100 displayCtrl 5) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_ListBehind = _this"];
	(findDisplay 5100 displayCtrl 5) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_ListBehind = _this"];
	(findDisplay 5100 displayCtrl 6) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_ListFocus = _this"];
	(findDisplay 5100 displayCtrl 6) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_ListFocus = _this"];
	(findDisplay 5100 displayCtrl 7) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_ListClose = _this"];
	(findDisplay 5100 displayCtrl 7) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_ListClose = _this"];
	(findDisplay 5100 displayCtrl 8) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_ListTimeInc = _this"];
	(findDisplay 5100 displayCtrl 8) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_ListTimeInc = _this"];
	(findDisplay 5100 displayCtrl 9) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_ListTimeDec = _this"];
	(findDisplay 5100 displayCtrl 9) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_ListTimeDec = _this"];

	(findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF;
	(findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTOFF;
	(findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTOFF;
	(findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTOFF;
	(findDisplay 5100 displayCtrl 7) ctrlSetTextColor COLORBUTTONTEXTOFF;
	(findDisplay 5100 displayCtrl 8) ctrlSetTextColor COLORBUTTONTEXTOFF;
	(findDisplay 5100 displayCtrl 9) ctrlSetTextColor COLORBUTTONTEXTOFF;
	(findDisplay 5100 displayCtrl 10) ctrlSetTextColor COLORTEXT;

	if (_follow) then
	{
		(findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTON;
		(findDisplay 5100 displayCtrl 6) ctrlShow false;
		if (_behind) then
		{ (findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTON }
		else
		{ (findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTOFF };
		if (SHOWTRIGGER) then
		{
			if (_trigger) then
			{ (findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTON }
			else
			{ (findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF };
		}
		else
		{
			(findDisplay 5100 displayCtrl 3) ctrlShow false;
		};
	}
	else
	{
		(findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF;
		(findDisplay 5100 displayCtrl 5) ctrlShow false;
		if (_focus) then
		{ (findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTON }
		else
		{ (findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTOFF };
	};
	if (SHOWTIMEACC) then
	{
		(findDisplay 5100 displayCtrl 10) ctrlSetBackgroundColor COLORTEXTBACKGROUND;
		(findDisplay 5100 displayCtrl 10) ctrlSetText format["accTime:%1",acctime];
	}
	else
	{
		(findDisplay 5100 displayCtrl 8) ctrlShow false;
		(findDisplay 5100 displayCtrl 9) ctrlShow false;
		(findDisplay 5100 displayCtrl 10) ctrlShow false;
	};
	ctrlSetFocus (findDisplay 5100 displayCtrl 4);

	_li_objlist = nearestObjects [_obj, ["AllVehicles"], _scandistance];

	_so_objlist = _li_objlist;
	call _SelectObjects;
	call _ListObjects;
	_li_objlist = _so_objlist;
};


_CloseList =
{
	_li_listshow = false;

	closedialog 5100;
	waituntil{!(ctrlShown(findDisplay 5100 displayCtrl 0))};

	GCam_MouseSelect_List set [1,-1];
	GCam_KeyDown set [1,-1];
	GCam_KeyDown_List set [1,-1];
	GCam_KeyDown_ListTrigger set [1,-1];
	GCam_KeyDown_ListFollow set [1,-1];
	GCam_KeyDown_ListBehind set [1,-1];
	GCam_KeyDown_ListFocus set [1,-1];
	GCam_KeyDown_ListClose set [1,-1];
	GCam_KeyDown_ListTimeInc set [1,-1];
	GCam_KeyDown_ListTimeDec set [1,-1];
	GCam_KeyUp set [1,-1];
	GCam_MouseClick_ListClose set [1,-1];
};


_OpenMap =
{
	_ma_mapshow = true;

	_accx = 0.0;
	_accy = 0.0;
	_accz = 0.0;
	_accdir = 0.0;
	_accdive = 0.0;
	_acczoom = 0.0;

	setmouseposition [0.50,0.75];

	call _CloseList;
	call _CloseHelp;

	createDialog "GCam_Dialog_Map";
	waituntil{ctrlShown(findDisplay 5101 displayCtrl 0)};

	(findDisplay 5101 displayCtrl 0) ctrlSetBackgroundColor COLORMAPBACKGROUND;
	(findDisplay 5101 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF;
	(findDisplay 5101 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTOFF;

	(findDisplay 5101 displayCtrl 0) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_Map = _this"];
	(findDisplay 5101 displayCtrl 3) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_MapScan = _this"];
	(findDisplay 5101 displayCtrl 3) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_MapScan = _this"];
	(findDisplay 5101 displayCtrl 4) ctrlSetEventHandler ["KeyDown", "GCam_KeyDown_MapClose = _this"];
	(findDisplay 5101 displayCtrl 4) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_MapClose = _this"];

	ctrlSetFocus (findDisplay 5101 displayCtrl 3);

	createMarkerLocal["camera", [_campos select 0, _campos select 1]];
	"camera" setMarkerShapeLocal "ICON";
	"camera" setMarkerTypeLocal "mil_Arrow2";
	"camera" setMarkerColorLocal COLORICONCAMERA;
	"camera" setMarkerSizeLocal [0.35, 0.35];
	"camera" setMarkerDirLocal -(_dir) + 90;

	createMarkerLocal["object", [_objpos select 0, _objpos select 1]];
	"object" setMarkerShapeLocal "ICON";
	"object" setMarkerTypeLocal "dot";

	(findDisplay 5101 displayCtrl 0) ctrlMapAnimAdd [0, ctrlMapScale (findDisplay 5101 displayCtrl 0), [_campos select 0,_campos select 1]];
	ctrlMapAnimCommit (findDisplay 5101 displayCtrl 0);

	call _MarkerSet;

	_ma_scanpos = getposATL _obj;
	_ma_objlist = nearestObjects [_ma_scanpos, ["AllVehicles"], _scandistance];

	_so_objlist = _ma_objlist;
	call _SelectObjects;
	call _ScanMarkerSet;
	_ma_objlist = _so_objlist;

	onMapSingleClick "GCam_Map_Clicked_PosX = _pos select 0; GCam_Map_Clicked_PosY =_pos select 1; GCam_Map_Clicked = true";
};


_CloseMap =
{
	_ma_mapshow = false;

	{ deleteMarkerLocal _x } forEach _ma_marked_objlist;
	deleteMarkerLocal "circle";
	deleteMarkerLocal "camera";
	deleteMarkerLocal "object";
	onMapSingleClick "";

	closedialog 5101;
	waituntil{!(ctrlShown(findDisplay 5101 displayCtrl 0))};

	GCam_KeyDown set [1, -1];
	GCam_KeyDown_Map set [1,-1];
	GCam_KeyDown_MapScan set [1,-1];
	GCam_KeyDown_MapClose set [1,-1];
	GCam_KeyUp set [1, -1];
	GCam_MouseClick_MapClose set [1, -1];
	GCam_MouseClick_MapScan set [1,-1];
};


_OpenHelp =
{
	_helpshow = true;

	setmouseposition [0.5,0.25];

	call _CloseList;
	call _CloseMap;

	createDialog "GCam_Dialog_Help";
	waituntil{ctrlShown(findDisplay 5103 displayCtrl 0)};

	(findDisplay 5103 displayCtrl 0) ctrlSetTextColor COLORTEXT;
	(findDisplay 5103 displayCtrl 0) ctrlSetBackgroundColor COLORTEXTBACKGROUND;
	(findDisplay 5103 displayCtrl 0) ctrlSetText format["%1",_helptext];
	(findDisplay 5103 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF;

	(findDisplay 5103 displayCtrl 3) ctrlSetEventHandler ["KeyDown", "GCam_Keydown_HelpClose = _this"];
	(findDisplay 5103 displayCtrl 3) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_HelpClose = _this"];

	ctrlSetFocus (findDisplay 5103 displayCtrl 3);
};


_CloseHelp =
{
	_helpshow = false;

	closedialog 5103;
	waituntil{!(ctrlShown(findDisplay 5103 displayCtrl 0))};

	GCam_KeyDown set [1,-1];
	GCam_KeyDown_HelpClose set [1,-1];
	GCam_KeyUp set [1,-1];
	GCam_MouseClick_HelpClose set [1,-1];
};


_ClickSwitch =
{
	_cs_match = false;
	_cs_mancnt = 0;

	_cs_clickinterv = diag_tickTime - _cs_bdtime;
	if ( _mousebu == 0 and _cs_clickinterv < 0.2 ) then
	{
		_cs_change = true;

		_cs_objlist = nearestObjects [_cam, ["AllVehicles"], 700.0];

		_so_objlist = _cs_objlist;
		call _SelectObjects;
		_cs_objlist = _so_objlist;

		if (_follow) then { _cs_objlist = _cs_objlist - [_cs_objlist select 0] };


		{
			_cs_corrattde = 0.0;
			_cs_zcor = 0.0;
			if (_x isKindOf "Man") then
			{
				_cs_mancnt = _cs_mancnt + 1;
				if (_cs_mancnt < 30) then
				{
					_cs_corrattde = ((_x selectionposition "head_axis") select 2) - 1.57;

					_cs_notreach = true;
				}
				else
				{
					_cs_notreach = false;
				};
			}
			else
			{
				if (typeOf _x == "2S6M_TUNGUSKA") then { _cs_zcor = 2.0 };

				_cs_notreach = true;
			};

			if (_cs_notreach) then
			{
				_cs_objpos = getposATL _x;
				_cs_scrpos = worldtoscreen [ _cs_objpos select 0, _cs_objpos select 1, (_cs_objpos select 2) + 1.2 + _cs_zcor + _cs_corrattde ];
				if (count _cs_scrpos == 0) then { _cs_scrpos = [100.0,100.0] };

				_cs_scr_dis = [0.5,0.5] distance _cs_scrpos;

				switch (true) do
				{
					case (_x isKindOf "Car"):
					{
						_cs_clickareasize_coef = 2.5;
					};
					case (_x isKindOf "Tank"):
				    {
						_cs_clickareasize_coef = 4.0;
					};
					case (_x isKindOf "Helicopter"):
				    {
						_cs_clickareasize_coef = 7.5;
					};
					case (_x isKindOf "Air"):
				    {
						_cs_clickareasize_coef = 11.0;
					};
					case (_x isKindOf "Ship"):
				    {
						_cs_clickareasize_coef = 3.0;
					};
					default
					{
						_cs_clickareasize_coef = 1.0;
					};
				};
				_cs_clickareasize = (1.30 / (0.1 + (_campos distance (getposasl _x)) )) * _cs_clickareasize_coef * (0.5 / _cfzoom);

				if ( !(_cs_match) and (_cs_scr_dis < _cs_clickareasize) ) then
				{
					_obj = _x;
					_cs_match = true;
				};
			};
		} foreach _cs_objlist;

		if ( _cs_match and ((_obj != _obj_last) or !(_follow)) ) then
		{
			call _ResetCamera;
			_obj_last = _obj;
		};

		_cs_change = false;
	};

	GCam_MouseBD set [1, -1];
	GCam_MouseBU set [1, -1];
};


_SetFiredHandler =
{
	_tr_ehidx = _obj addEventHandler["fired",
	{
		_tr_obj = _this select 0;
		_tr_ammo = _this select 4;
		 if ( (_tr_ammo iskindof "MissileBase") or (_tr_ammo iskindof "LaserBombCore") or (_tr_ammo iskindof "Arty_Sh_Base") ) then
		 {
		 	GCam_Obj = nearestObject[_tr_obj,_tr_ammo];
		 	if (!(isnull GCam_Obj)) then { GCam_Trigger = true };
		 };
	}];
};


_SmoothMove =
{
	GCam_KeyDown set [1,-1];
	GCam_MouseBD set [1,-1];
	GCam_MouseBU set [1,-1];

	_sm_loop = true;
	_sm_cnt = 0;
	_sm_campos = getposASL _cam;
	_sm_objpos = getposASL _obj;
	_sm_campos_tar_last = [ (_sm_objpos select 0) + (_campos_rel select 0), (_sm_objpos select 1) + (_campos_rel select 1), (_sm_objpos select 2) + (_campos_rel select 2) ];

	if ( _ma_mapshow ) then { { deleteMarkerLocal _x } forEach _ma_marked_objlist };

	while { ( [_sm_campos select 0, _sm_campos select 1] distance [_sm_campos_tar_last select 0, _sm_campos_tar_last select 1] ) > 0.1 and _sm_cnt < 110 and _sm_loop } do
	{
		if ( _li_listshow and !(ctrlShown(findDisplay 5100 displayCtrl 0)) ) then
		{
			_keyd = -1;
			_keyu = -1;
			GCam_MouseSelect_List set [1,-1];
			GCam_KeyDown set [1,-1];
			GCam_KeyDown_List set [1,-1];
			GCam_KeyDown_ListTrigger set [1,-1];
			GCam_KeyDown_ListFollow set [1,-1];
			GCam_KeyDown_ListBehind set [1,-1];
			GCam_KeyDown_ListFocus set [1,-1];
			GCam_KeyDown_ListClose set [1,-1];
			GCam_KeyDown_ListTimeInc set [1,-1];
			GCam_KeyDown_ListTimeDec set [1,-1];
			GCam_MouseClick_ListClose set [1,-1];

			_li_listshow = false;
		};

		if ( _ma_mapshow and !(ctrlShown(findDisplay 5101 displayCtrl 0)) ) then
		{
			{ deleteMarkerLocal _x } forEach _ma_marked_objlist;
			deleteMarkerLocal "circle";
			deleteMarkerLocal "camera";
			deleteMarkerLocal "object";
			onMapSingleClick "";

			_keyd = -1;
			_keyu = -1;
			GCam_KeyDown set [1, -1];
			GCam_KeyDown_Map set [1,-1];
			GCam_KeyDown_MapScan set [1,-1];
			GCam_KeyDown_MapClose set [1,-1];
			GCam_KeyUp set [1, -1];
			GCam_MouseClick_MapClose set [1, -1];
			GCam_MouseClick_MapScan set [1,-1];

			_ma_mapshow = false;
		};

		if (!(isnil "GCam_KeyDown")) then { _keyd = GCam_KeyDown select 1 };
		if (_keyd == 200 or _keyd == 203 or _keyd == 205 or _keyd == 208) then
		{
			if ( _changedkey == 200 and (_keyd == 208 or _keyd == 203 or _keyd == 205) ) then
			{
				_obj = _obj_last;
				if ( SWITCHADJDIS ) then { call _SwitchAdjustDistance };
			};
			if ( _changedkey == 208 and (_keyd == 200 or _keyd == 203 or _keyd == 205) ) then
			{
				_obj = _obj_last;
				if ( SWITCHADJDIS ) then { call _SwitchAdjustDistance };
			};
			if ( _changedkey == 203 and (_keyd == 200 or _keyd == 208 or _keyd == 205) ) then
			{
				_obj = _obj_last;
				if ( SWITCHADJDIS ) then { call _SwitchAdjustDistance };
			};
			if ( _changedkey == 205 and (_keyd == 200 or _keyd == 208 or _keyd == 203) ) then
			{
				_obj = _obj_last;
				if ( SWITCHADJDIS ) then { call _SwitchAdjustDistance };
			};
			_changedkey = -1;

			_sm_loop = false;
		};

		_acczoom = _acczoom * ZOOMATTEN;


		_mousebd = GCam_MouseBD select 1;
		_mousebu = GCam_MouseBU select 1;
		if (isnil "_mousebd") then { _mousebd = -1 };
		if (isnil "_mousebu") then { _mousebu = -1 };

		if (_mousebd == 1 and _mousebu == 1) then
		{
			_acczoom = 0.0;
			_zoom = 0.7;
			_cam camSetFov _zoom;
			_cfzoom = sin ((_zoom / 1.8) * 90.0);
		};
		if (_mousebd == 0 and _mousebu == 0) then
		{
			_sm_loop = false;
		};
		if ( (_mousebu == 0) or (_mousebu == 1 and _mousebd == 1) ) then
		{
			GCam_MouseBD set [1, -1];
			GCam_MouseBU set [1, -1];
		};

		_wheel = GCam_MouseWheel select 1;
		if (_wheel > 0.0001 or _wheel < -0.0001) then
		{
			_acczoom = _acczoom - _wheel * 0.12 * CFWHEEL * sin((_zoom / 2.0) * 90.0);
			GCam_MouseWheel set [1, 0];
		};
		if ((abs _acczoom) > 0.0001) then
		{
			_zoom = _zoom + _acczoom;
			if (_zoom < 0.01) then
			{
				_zoom = 0.01;
				_acczoom = 0.0;
			};
			if (_zoom > 2.0) then
			{
				_zoom = 2.0;
				_acczoom = 0.0;
			};
			_cam camSetFov _zoom;
			_cfzoom = sin ((_zoom / 1.8) * 90);
		};

		_sm_objpos = getposASL _obj;

		if ( _follow and _behind ) then
		{
			_be_objdir = ((getdir _obj) -90) * -1;
			if (_be_objdir >= 360.0) then { _be_objdir = _be_objdir - 360.0 };
			if (_be_objdir < 0.0) then { _be_objdir = _be_objdir + 360.0 };

			_be_camdir_tar = _dir - _be_camdir_add;
			if ( _be_camdir_tar >= 360.0 ) then { _be_camdir_tar = _be_camdir_tar - 360.0 };
			if ( _be_camdir_tar < 0.0 ) then { _be_camdir_tar = _be_camdir_tar + 360.0 };

			_be_camdir_dif = _be_objdir - _be_camdir_tar;
			if ( _be_camdir_dif >= 360.0 ) then { _be_camdir_dif = _be_camdir_dif - 360.0 };
			if ( _be_camdir_dif < 0.0 ) then { _be_camdir_dif = _be_camdir_dif + 360.0 };

			_be_camdir_dif = _be_camdir_dif + _be_camobjdir_add;
			if ( _be_camdir_dif >= 360.0 ) then { _be_camdir_dif = _be_camdir_dif - 360.0 };
			if ( _be_camdir_dif < 0.0 ) then { _be_camdir_dif = _be_camdir_dif + 360.0 };

			switch (true) do
			{
				case (_be_camdir_dif >= 0.0 and _be_camdir_dif < 180.0) : { _dir = _dir + (abs(sin(_be_camdir_dif/2.0))) * 15.0 * ((_sm_cnt atan2 15.0)/90.0) };
				case (_be_camdir_dif >= 180.0 and _be_camdir_dif < 360.0) : { _dir = _dir - (abs(sin(_be_camdir_dif/2.0))) * 15.0 * ((_sm_cnt atan2 15.0)/90.0) };
			};
			if ( _dir >= 360.0 ) then { _dir = _dir - 360.0 };
			if ( _dir < 0.0 ) then { _dir = _dir + 360.0 };

			_campos_rel = [ cos(_be_objdir+180.0+_be_camobjdir_add) * _be_camobjxydis_tar, sin(_be_objdir+180.0+_be_camobjdir_add) * _be_camobjxydis_tar, _campos_rel select 2 ];
		};


		if ( !(_follow) and _focus ) then
		{
			if ( _behind ) then
			{
				_fc_objdir = ((getdir _obj) -90.0) * -1;
				if (_fc_objdir >= 360.0) then { _fc_objdir = _fc_objdir - 360.0 };
				if (_fc_objdir < 0.0) then { _fc_objdir = _fc_objdir + 360.0 };

				_be_camdir_tar = _dir - _fc_camdir_add;
				if ( _be_camdir_tar >= 360.0 ) then { _be_camdir_tar = _be_camdir_tar - 360.0 };
				if ( _be_camdir_tar < 0.0 ) then { _be_camdir_tar = _be_camdir_tar + 360.0 };

				_be_camdir_dif = _fc_objdir - _be_camdir_tar;
				if ( _be_camdir_dif >= 360.0 ) then { _be_camdir_dif = _be_camdir_dif - 360.0 };
				if ( _be_camdir_dif < 0.0 ) then { _be_camdir_dif = _be_camdir_dif + 360.0 };

				_be_camdir_dif = _be_camdir_dif + _be_camobjdir_add;
				if ( _be_camdir_dif >= 360.0 ) then { _be_camdir_dif = _be_camdir_dif - 360.0 };
				if ( _be_camdir_dif < 0.0 ) then { _be_camdir_dif = _be_camdir_dif + 360.0 };

				switch (true) do
				{
					case (_be_camdir_dif >= 0.0 and _be_camdir_dif < 180.0) : { _dir = _dir + (abs(sin(_be_camdir_dif/2.0))) * 15.0 * ((_sm_cnt atan2 15.0)/90.0) };
					case (_be_camdir_dif >= 180.0 and _be_camdir_dif < 360.0) : { _dir = _dir - (abs(sin(_be_camdir_dif/2.0))) * 15.0 * ((_sm_cnt atan2 15.0)/90.0) };
				};
				if ( _dir >= 360.0 ) then { _dir = _dir - 360.0 };
				if ( _dir < 0.0 ) then { _dir = _dir + 360.0 };

				_campos_rel = [ cos(_fc_objdir+180.0+_be_camobjdir_add) * _be_camobjxydis_tar, sin(_fc_objdir+180.0+_be_camobjdir_add) * _be_camobjxydis_tar, _fo_camobjzdis ];
			}
			else
			{
				_fc_objpos = _sm_objpos;
				_fc_campos = _sm_campos;

				_fc_camobjdir = ( ( ((_fc_objpos select 0) - (_fc_campos select 0)) atan2 ((_fc_objpos select 1) - (_fc_campos select 1)) ) -90.0 ) * -1;
				if (_fc_camobjdir >= 360.0) then { _fc_camobjdir = _fc_camobjdir - 360.0 };
				if (_fc_camobjdir < 0.0) then { _fc_camobjdir = _fc_camobjdir + 360.0 };

				_fc_camobjdir_dif = _dir - _fc_camobjdir;
				if (_fc_camobjdir_dif >= 360.0) then { _fc_camobjdir_dif = _fc_camobjdir_dif - 360.0 };
				if (_fc_camobjdir_dif < 0.0) then { _fc_camobjdir_dif = _fc_camobjdir_dif + 360.0 };

				_fc_camobjdir_dif = _fc_camobjdir_dif - _fc_camdir_add;
				if (_fc_camobjdir_dif >= 360.0) then { _fc_camobjdir_dif = _fc_camobjdir_dif - 360.0 };
				if (_fc_camobjdir_dif < 0.0) then { _fc_camobjdir_dif = _fc_camobjdir_dif + 360.0 };

				switch (true) do
				{
					case (_fc_camobjdir_dif > 0.0 and _fc_camobjdir_dif < 180.0) : { _dir = _dir - (abs(sin(_fc_camobjdir_dif/2.0))) * 20.0 };
					case (_fc_camobjdir_dif > 180.0 and _fc_camobjdir_dif < 360.0) : { _dir = _dir + (abs(sin(_fc_camobjdir_dif/2.0))) * 20.0 };
				};
				if ( _dir >= 360.0 ) then { _dir = _dir - 360.0 };
				if ( _dir < 0.0 ) then { _dir = _dir + 360.0 };

				_fc_sw_camobjdir = ( ( (_re_camposrel_last select 0) atan2 (_re_camposrel_last select 1) ) -90.0 ) * -1;
				_campos_rel = [ cos(_fc_sw_camobjdir) * _fo_camobjxydis, sin(_fc_sw_camobjdir) * _fo_camobjxydis, _fo_camobjzdis ];
			};

			_sm_camobjxydis = sqrt(((_sm_campos select 0) - (_sm_objpos select 0))^2 + ((_sm_campos select 1) - (_sm_objpos select 1))^2.0);
			if ( _obj isKindOf "Man" ) then { _sm_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30.0/(_sm_camobjxydis+0.1))) };

			_sm_camobjdive = (sqrt(((_sm_objpos select 0) - (_sm_campos select 0))^2 + ((_sm_objpos select 1) - (_sm_campos select 1))^2) atan2 (((_sm_objpos select 2) - (_sm_campos select 2)) + 1.57 + _sm_corrattde) - 90.0) * -1;
			_sm_dive_tar = _sm_camobjdive + _fc_camdive_add;
			_sm_dive_dif = _sm_dive_tar - _dive;

			switch (true) do
			{
				case (_sm_dive_dif > 0.0) : { _dive = _dive + abs sin(_sm_dive_dif/2.0) * 15.0 * ((_sm_cnt atan2 15.0)/90.0) };
				case (_sm_dive_dif <= 0.0) : { _dive = _dive - abs sin(_sm_dive_dif/2.0) * 15.0 * ((_sm_cnt atan2 15.0)/90.0) };
			};
			if (_dive > 89.0) then { _dive = 89.0 };
			if (_dive < -89.0) then { _dive = -89.0 };
		};

		if ( (_cs_change and !(_behind)) or (!(_follow) and !(_focus)) ) then
		{
			_campos_rel = [ cos(_dir+180.0) * _fo_camobjxydis, sin(_dir+180.0) * _fo_camobjxydis, _fo_camobjzdis ];
		};


		if ( SWITCHCENTER or _cs_change ) then
		{
			if ( _follow or ( !(_focus) and !(_follow) ) ) then
			{
				_sm_camobjxydis = sqrt(((_sm_campos select 0) - (_sm_objpos select 0))^2 + ((_sm_campos select 1) - (_sm_objpos select 1))^2.0);
				if ( _obj isKindOf "Man" ) then { _sm_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30.0/(_sm_camobjxydis+0.1))) };

				_sm_camobjdive = (sqrt(((_sm_objpos select 0) - (_sm_campos select 0))^2 + ((_sm_objpos select 1) - (_sm_campos select 1))^2.0) atan2 (((_sm_objpos select 2) - (_sm_campos select 2)) + 1.57 + _sm_corrattde) - 90.0) * -1;
				_sm_dive_dif = _sm_camobjdive - _dive;

				switch (true) do
				{
					case (_sm_dive_dif > 0.0) : { _dive = _dive + abs sin(_sm_dive_dif/2.0) * 15.0 * ((_sm_cnt atan2 15.0)/90.0) };
					case (_sm_dive_dif <= 0.0) : { _dive = _dive - abs sin(_sm_dive_dif/2.0) * 15.0 * ((_sm_cnt atan2 15.0)/90.0) };
				};
				if (_dive > 89.0) then { _dive = 89.0 };
				if (_dive < -89.0) then { _dive = -89.0 };
			};
		};


		if (_behind) then
		{
			if (_obj isKindOf "Man") then { _be_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30.0/(_be_camobjxydis_tar+0.1))) };
		};


		if ( _ma_mapshow ) then
		{
			"camera" setMarkerPosLocal [_sm_campos select 0, _sm_campos select 1];
			"camera" setMarkerDirLocal -(_dir) + 90.0;
			"object" setMarkerPosLocal [_sm_objpos select 0, _sm_objpos select 1];
		};

		_sm_campos_tar = [ (_sm_objpos select 0) + (_campos_rel select 0), (_sm_objpos select 1) + (_campos_rel select 1), (_sm_objpos select 2) + (_campos_rel select 2) ];
		_sm_camobjdis_ary = [ (_sm_campos_tar select 0) - (_sm_campos select 0), (_sm_campos_tar select 1) - (_sm_campos select 1), (_sm_campos_tar select 2) - (_sm_campos select 2) ];
		_sm_campos = [ (_sm_campos select 0) + ((((_sm_camobjdis_ary select 0)/3)) * ((_sm_cnt atan2 110.0)/90.0)) + ((_sm_campos_tar select 0) - (_sm_campos_tar_last select 0)) * ((_sm_cnt atan2 5)/90.0), (_sm_campos select 1) + ((((_sm_camobjdis_ary select 1)/3.0)) * ((_sm_cnt atan2 110.0)/90.0)) + ((_sm_campos_tar select 1) - (_sm_campos_tar_last select 1)) * ((_sm_cnt atan2 5.0)/90.0), (_sm_campos select 2) + ((((_sm_camobjdis_ary select 2)/3.0)) * ((_sm_cnt atan2 110.0)/90.0)) + (((_sm_campos_tar select 2) - (_sm_campos_tar_last select 2)) * ((_sm_cnt atan2 5.0)/90.0)) ];
		_cam setPosASL [_sm_campos select 0, _sm_campos select 1, (_sm_campos select 2) + _be_corrattde];
		_cam camSetTarget [ (_sm_campos select 0) + (cos _dir) * (cos _dive) * 100000.0, (_sm_campos select 1) + (sin _dir) * (cos _dive) * 100000.0, (_sm_campos select 2) + (sin _dive) * 100000.0];
		_cam camCommit 0;

		_sm_campos_tar_last = _sm_campos_tar;

		if ( (getposATL _cam select 2) < 0.5 ) then { _cam setPosATL [ getposASL _cam select 0, getposASL _cam select 1, 0.501 - _be_corrattde ] };

		_sm_cnt = _sm_cnt + 1;
		_wait = accTime / (diag_fps * 2);
		sleep _wait;
	};

	_keyd = -1;
	GCam_KeyDown set [1, -1];
};


_ChaseMissile =
{
	GCam_KeyDown set [1,-1];
	GCam_KeyUp set [1,-1];
	GCam_MouseBD set [1,-1];
	GCam_MouseBU set [1,-1];

	_cm_obj = GCam_Obj;
	_cm_objpos = getposASL _cm_obj;
	_cm_campos = _campos;
	_cm_campos_rel = [(_cm_campos select 0)-(_cm_objpos select 0),(_cm_campos select 1)-(_cm_objpos select 1),(_cm_campos select 2)-(_cm_objpos select 2)];
	_cm_loop = true;

	while {(alive _cm_obj) and _cm_loop} do
	{
		_accx = _accx * MOVEATTEN;
		_accy = _accy * MOVEATTEN;
		_accz = _accz * MOVEATTEN;
		_accdir = _accdir * TURNATTEN;
		_accdive = _accdive * TURNATTEN;
		_acczoom = _acczoom * ZOOMATTEN;

		if ( _li_listshow and !(ctrlShown(findDisplay 5100 displayCtrl 0)) ) then
		{
			_keyd = -1;
			_keyu = -1;
			GCam_MouseSelect_List set [1,-1];
			GCam_KeyDown set [1,-1];
			GCam_KeyDown_List set [1,-1];
			GCam_KeyDown_ListTrigger set [1,-1];
			GCam_KeyDown_ListFollow set [1,-1];
			GCam_KeyDown_ListBehind set [1,-1];
			GCam_KeyDown_ListFocus set [1,-1];
			GCam_KeyDown_ListClose set [1,-1];
			GCam_KeyDown_ListTimeInc set [1,-1];
			GCam_KeyDown_ListTimeDec set [1,-1];
			GCam_MouseClick_ListClose set [1,-1];

			_li_listshow = false;
		};

		if (!(_li_listshow)) then
		{
			_mousepos = [ GCam_MouseMove select 1, GCam_MouseMove select 2 ];
			_accdir = _accdir + (_mousepos select 0) * 0.9 * CFTRK * (-1) * _cfzoom / (cos abs(_dive / (1.0 + _cfzoom))) * _mouseacc;
			_dir = _dir + _accdir;
			if (_dir >= 360.0) then { _dir = _dir - 360.0 };
			if (_dir < 0.0) then { _dir = _dir + 360.0 };

			_accdive = _accdive + (_mousepos select 1) * 2.6 * CFTRK * (-1) * _cfzoom * _mouseacc;
			_dive = _dive + _accdive;
			if (_dive > 89.9) then
			{
				_dive = 89.9;
				_accdive = 0.0;
			};
			if (_dive < -89.9) then
			{
				_dive = -89.9;
				_accdive = 0.0;
			};
			GCam_MouseMove set [ 1, (GCam_MouseMove select 1)*0.8 ];
			GCam_MouseMove set [ 2, (GCam_MouseMove select 2)*0.8 ];
		};

		_mousebd = GCam_MouseBD select 1;
		_mousebu = GCam_MouseBU select 1;
		if (isnil "_mousebd") then { _mousebd = -1 };
		if (isnil "_mousebu") then { _mousebu = -1 };
		if (_mousebd == 1 and _mousebu == 1) then
		{
			_acczoom = 0.0;
			_zoom = 0.7;
			_cam camSetFov _zoom;
			_cfzoom = sin ((_zoom / 1.8) * 90.0);
		};
		if (_mousebd == 0 and _mousebu == 0) then
		{
			_cm_loop = false;
		};
		if ( (_mousebu == 0) or (_mousebu == 1 and _mousebd == 1) ) then
		{
			GCam_MouseBD set [1, -1];
			GCam_MouseBU set [1, -1];
		};

		if (!(isnil "GCam_KeyDown")) then { _keyd = GCam_KeyDown select 1 };
		if (!(isnil "GCam_KeyUp")) then { _keyu = GCam_KeyUp select 1 };
		if (_keyd == _keyu) then
		{
			GCam_KeyDown set [1, -1];
			GCam_KeyUp set [1, -1];
		};

		if (_keyd == 17 and _keyu != 17) then
		{
			_accx = _accx + 0.05 * (cos _dir) * CFMOVE * _cfzoom;
			_accy = _accy + 0.05 * (sin _dir) * CFMOVE * _cfzoom;
		};
		if (_keyd == 31 and _keyu != 31) then
		{
			_accx = _accx - 0.05 * (cos _dir) * CFMOVE * _cfzoom;
			_accy = _accy - 0.05 * (sin _dir) * CFMOVE * _cfzoom;
		};
		if (_keyd == 30 and _keyu != 30) then
		{
			_accx = _accx - 0.05 * (sin _dir) * CFMOVE * _cfzoom;
			_accy = _accy + 0.05 * (cos _dir) * CFMOVE * _cfzoom;
		};
		if (_keyd == 32 and _keyu != 32) then
		{
			_accx = _accx + 0.05 * (sin _dir) * CFMOVE * _cfzoom;
			_accy = _accy - 0.05 * (cos _dir) * CFMOVE * _cfzoom;
		};
		if (_keyd == 16 and _keyu != 16) then
		{
			_accz = _accz + 0.05 * CFMOVE * _cfzoom;
		};
		if (_keyd == 44 and _keyu != 44) then
		{
			_accz = _accz - 0.05 * CFMOVE * _cfzoom;
		};
		if (_keyd == 3 and _keyu != 3) then
		{
			_accx = _accx + 0.075 * CFMOVE * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accy = _accy + 0.075 * CFMOVE * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accz = _accz + 0.075 * CFMOVE * (sin _dive) * _cfzoom * _cfalt;
		};
		if (_keyd == 45 and _keyu != 45) then
		{
			_accx = _accx - 0.075 * CFMOVE * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accy = _accy - 0.075 * CFMOVE * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accz = _accz - 0.075 * CFMOVE * (sin _dive) * _cfzoom * _cfalt;
		};

		_wheel = GCam_MouseWheel select 1;
		if (_wheel > 0.0001 or _wheel < -0.0001) then
		{
			_acczoom = _acczoom - 0.12 * _wheel * CFWHEEL * sin((_zoom / 2.0) * 90.0);
			GCam_MouseWheel set [1, 0];
		};
		if ((abs _acczoom) > 0.0001) then
		{
			_zoom = _zoom + _acczoom;
			if (_zoom < 0.01) then
			{
				_zoom = 0.01;
				_acczoom = 0.0;
			};
			if (_zoom > 2.0) then
			{
				_zoom = 2.0;
				_acczoom = 0.0;
			};
			_cam camSetFov _zoom;
			_cfzoom = sin ((_zoom / 1.8) * 90);
		};

		_cm_campos_rel = [ (_cm_campos_rel select 0) + _accx, (_cm_campos_rel select 1) + _accy, (_cm_campos_rel select 2) + _accz ];
		_cm_objpos = getposASL _cm_obj;
		_cm_campos = [ (_cm_objpos select 0) + (_cm_campos_rel select 0), (_cm_objpos select 1) + (_cm_campos_rel select 1), (_cm_objpos select 2) + (_cm_campos_rel select 2) ];
		_cam setPosASL [ _cm_campos select 0, _cm_campos select 1, _cm_campos select 2 ];
		_cam camSetTarget [ (_cm_campos select 0) + (cos _dir) * (cos _dive) * 100000.0, (_cm_campos select 1) + (sin _dir) * (cos _dive) * 100000.0, (_cm_campos select 2) + (sin _dive) * 100000.0];
		_cam camCommit 0;

		_wait = accTime / (diag_fps * 2);
		sleep _wait;
	};

	_campos_rel = [(_cm_campos select 0)-(_objpos select 0),(_cm_campos select 1)-(_objpos select 1),(_cm_campos select 2)-(_objpos select 2)];

	_keyd = -1;
	_keyu = -1;
	GCam_KeyDown set [1, -1];
	GCam_KeyUp set [1, -1];
};


_SwitchAdjustDistance =
{
	switch (true) do
	{
		case (_obj isKindOf "Car"):
		{
			_campos_rel set [ 2, 1.2 + 1.2 ];
			_fo_camobjxydis = 6.6;
			_fo_camobjzdis = 2.4;
		};
		case (_obj isKindOf "Tank"):
	    {
			_campos_rel set [ 2, 1.2 + 1.55 ];
			_fo_camobjxydis = 7.5;
			_fo_camobjzdis = 2.75;
		};
		case (_obj isKindOf "Helicopter"):
	    {
			_campos_rel set [ 2, 1.2 + 2.7 ];
			_fo_camobjxydis = 10.0;
			_fo_camobjzdis = 3.9;
		};
		case (_obj isKindOf "Air"):
	    {
			_campos_rel set [ 2, 1.2 + 2.7 ];
			_fo_camobjxydis = 15.0;
			_fo_camobjzdis = 2.9;
		};
		case (_obj isKindOf "Ship"):
	    {
			_campos_rel set [ 2, 1.2 + 1.5 ];
			_fo_camobjxydis = 7.5;
			_fo_camobjzdis = 2.7;
		};
		default
		{
			_campos_rel set [ 2, 1.2 + 0.5 ];
			_fo_camobjxydis = 2.6;
			_fo_camobjzdis = 1.7;
		};
	};

	if ( _behind ) then
	{
		_be_camobjxydis_tar = _fo_camobjxydis;
		_be_camobjxydis = _be_camobjxydis_tar;
	};

	if ( _follow and !(_behind) ) then
	{
		_re_camobjdir = ( ( (_re_camposrel_last select 0) atan2 (_re_camposrel_last select 1) ) -90.0 ) * -1;
		_campos_rel = [ cos(_re_camobjdir) * _fo_camobjxydis, sin(_re_camobjdir) * _fo_camobjxydis, _fo_camobjzdis ];
	};
};


_ResetCamera =
{
	_accx = 0;
	_accy = 0;
	_accz = 0;
	_accdir = 0;
	_accdive = 0;
	_acczoom = 0;

	titletext[ "", "plain down", 0.0 ];
	if (_li_listshow) then { lbClear 0 };

	_re_camposrel_last = _campos_rel;

	if ( SWITCHADJDIS ) then
	{
		call _SwitchAdjustDistance;
	};


	if (!(_obj isKindOf "Man")) then
	{
		_be_corrattde = 0.0;
		_fc_corrattde = 0.0;
	};

	if ( SWITCHCENTER or _cs_change ) then
	{
		if ( _behind ) then
		{
			_be_camdir_add = 0.0;
		};
		if ( !(_follow) and _focus ) then
		{
			_fc_camdir_add = 0.0;
			_fc_camdive_add = 0.0;
		};
	};


	if (_trigger) then { _obj_last removeEventHandler ["fired", _tr_ehidx] };

	if ( SWITCHSMOOTH ) then { call _SmoothMove };

	if (_trigger) then { call _SetFiredHandler };


	if ( _follow and _behind ) then
	{
		_be_objdir = ((getdir _obj) -90.0) * -1;
		if (_be_objdir >= 360.0) then { _be_objdir = _be_objdir - 360.0 };
		if (_be_objdir < 0.0) then { _be_objdir = _be_objdir + 360.0 };

		_dir = _be_objdir + _be_camdir_add;
		if (_dir >= 360.0) then { _dir = _dir - 360.0 };
		if (_dir < 0.0) then { _dir = _dir + 360.0 };

		_dir = _dir + _be_camobjdir_add;
		if ( _dir >= 360.0 ) then { _dir = _dir - 360.0 };
		if ( _dir < 0.0 ) then { _dir = _dir + 360.0 };

		_campos_rel = [ cos(_be_objdir+180.0+_be_camobjdir_add) * _be_camobjxydis_tar, sin(_be_objdir+180.0+_be_camobjdir_add) * _be_camobjxydis_tar, _campos_rel select 2 ];
	};

	if ( _cs_change and _follow and !(_behind) ) then
	{
		_campos_rel = [ cos(_dir+180.0) * _fo_camobjxydis, sin(_dir+180.0) * _fo_camobjxydis, _fo_camobjzdis ];
	};

	if ( !(_follow) and _focus ) then
	{
		if ( _behind ) then
		{
			_fc_objdir = ((getdir _obj) -90.0) * -1;
			if (_fc_objdir >= 360.0) then { _fc_objdir = _fc_objdir - 360.0 };
			if (_fc_objdir < 0.0) then { _fc_objdir = _fc_objdir + 360.0 };

			_dir = _fc_objdir + _fc_camdir_add;
			if (_dir >= 360.0) then { _dir = _dir - 360.0 };
			if (_dir < 0.0) then { _dir = _dir + 360.0 };

			_dir = _dir + _be_camobjdir_add;
			if ( _dir >= 360.0 ) then { _dir = _dir - 360.0 };
			if ( _dir < 0.0 ) then { _dir = _dir + 360.0 };

			_campos_rel = [ cos(_fc_objdir+180.0+_be_camobjdir_add) * _fo_camobjxydis, sin(_fc_objdir+180.0+_be_camobjdir_add) * _fo_camobjxydis, _fo_camobjzdis ];
		}
		else
		{

		};
	};

	if ( !(_follow) and !(_focus) ) then
	{
		_campos_rel = [ cos(_dir+180.0) * _fo_camobjxydis, sin(_dir+180.0) * _fo_camobjxydis, _fo_camobjzdis ];
	};


	_objpos = getposASL _obj;
	_campos = [ (_objpos select 0) + (_campos_rel select 0) , (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2) ];
	_cam setPosASL [ _campos select 0, _campos select 1, (_campos select 2) + _be_corrattde ];
	_cam camSetTarget [ (_campos select 0) + (cos _dir) * (cos _dive) * 100000.0, (_campos select 1) + (sin _dir) * (cos _dive) * 100000.0, (_campos select 2) + (sin _dive) * 100000.0];
	_cam camCommit 0;

	_tx_crewname = "";
	if ( count(crew _obj) > 1 ) then
	{
		{
			if (((crew _obj) select 0) != _x) then { _tx_crewname = _tx_crewname + ", " };
			_tx_crewname = _tx_crewname + format["%1", name _x];
		} forEach (crew _obj);
	}
	else
	{
		_tx_crewname = name _obj;
	};

	titletext[ format[ "%1 : %2\n%3", getText( configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName" ), _tx_crewname, group _obj], "plain down", _wait*40 ];
};



sleep _wait;

_ehid_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", "GCam_KeyDown = _this"];
_ehid_keyup = (findDisplay 46) displayAddEventHandler ["KeyUp", "GCam_KeyUp = _this"];
_ehid_mousemove = (findDisplay 46) displayAddEventHandler ["MouseMoving", "GCam_MouseMove = _this"];
_ehid_mousezchange = (findDisplay 46) displayAddEventHandler ["MouseZChanged", "GCam_MouseWheel = _this"];
_ehid_mousebd = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "GCam_MouseBD = _this"];
_ehid_mousebu = (findDisplay 46) displayAddEventHandler ["MouseButtonUp", "GCam_MouseBU = _this"];

_obj = vehicle (_this select 0);
if (isnil"_obj") then { _obj = player };
_obj_last = _obj;
_dir = ((getdir _obj)-90)*-1;
_dive = INITCAMAGL;
_campos_rel = [ cos(_dir+180) * INITCAMDISY, sin(_dir+180) * INITCAMDISY, INITCAMDISZ ];
_objpos = getposASL _obj;
_campos = [ (_objpos select 0) + (_campos_rel select 0), (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2)];


_cam = "camera" camCreate [0.0,0.0,0.0];
_cam setPosASL [_campos select 0, _campos select 1, _campos select 2];
_cam camSetTarget [ (_campos select 0) + (cos _dir) * (cos _dive) * 100000.0, (_campos select 1) + (sin _dir) * (cos _dive) * 100000.0, (_campos select 2) + (sin _dive) * 100000.0];
_cam cameraEffect ["Internal", "Back"];
_cam camSetFov _zoom;
_cam camCommit 0;

sleep _wait;
showCinemaBorder false;

call _ResetCamera;



while {!(_loopexit)} do
{
	_accx = _accx * MOVEATTEN;
	_accy = _accy * MOVEATTEN;
	_accz = _accz * MOVEATTEN;
	_accdir = _accdir * TURNATTEN;
	_accdive = _accdive * TURNATTEN;
	_acczoom = _acczoom * ZOOMATTEN;

	if (GCam_Trigger) then
	{
		GCam_Trigger = false;

		if (_follow) then
		{
			_obj removeEventHandler ["fired", _tr_ehidx];
			_trigger = false;

			if (_li_listshow) then
			{
				(findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF;
			};

			call _ChaseMissile;

			_follow = false;
			_focus = false;

			if (_li_listshow) then
			{
				(findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTOFF;
				(findDisplay 5100 displayCtrl 3) ctrlShow false;
				(findDisplay 5100 displayCtrl 5) ctrlShow false;
				(findDisplay 5100 displayCtrl 6) ctrlShow true;
				(findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTOFF;
			};
		};
	};


	_mousebd = GCam_MouseBD select 1;
	_mousebu = GCam_MouseBU select 1;
	if (isnil "_mousebd") then { _mousebd = -1 };
	if (isnil "_mousebu") then { _mousebu = -1 };

	if (_mousebd == 1 and _mousebu == 1 and !(_ma_mapshow)) then
	{
		_acczoom = 0.0;
		_zoom = 0.7;
		_cam camSetFov _zoom;
		_cfzoom = sin ((_zoom / 1.8) * 90.0);
	};
	if (_mousebd == 0 and _mousebu != 0 and !(_cs_mousedowned)) then
	{
		_cs_bdtime = diag_tickTime;

		_cs_mousedowned = true;
		_mousemove = true;
		GCam_MouseMove = [0,0,0];
	};
	if ( (_mousebu == 0) or (_mousebu == 1 and _mousebd == 1) ) then
	{
		_cs_mousedowned = false;
		_mousemove = false;
		_mbld = false;

		if (!(_li_listshow) and !(_ma_mapshow) and !(_helpshow)) then { call _ClickSwitch };

		GCam_MouseBD set [1, -1];
		GCam_MouseBU set [1, -1];
	};

	if (!(_li_listshow) and !(_ma_mapshow) and !(_helpshow)) then
	{
		_mousepos = [ GCam_MouseMove select 1, GCam_MouseMove select 2 ];
		_accdir = _accdir + (_mousepos select 0) * 0.9 * CFTRK * (-1) * _cfzoom / (cos abs(_dive / (1.0 + _cfzoom))) * _mouseacc;
		_dir = _dir + _accdir;
		if (_dir >= 360.0) then { _dir = _dir - 360.0 };
		if (_dir < 0.0) then { _dir = _dir + 360.0 };

		_accdive = _accdive + (_mousepos select 1) * 2.6 * CFTRK * (-1) * _cfzoom * _mouseacc;
		_dive = _dive + _accdive;
		if (_dive > 89.9) then
		{
			_dive = 89.9;
			_accdive = 0.0;
		};
		if (_dive < -89.9) then
		{
			_dive = -89.9;
			_accdive = 0.0;
		};
		GCam_MouseMove set [ 1, (GCam_MouseMove select 1)*0.8 ];
		GCam_MouseMove set [ 2, (GCam_MouseMove select 2)*0.8 ];
	};


	if (!(isnil "GCam_KeyDown")) then { _keyd = GCam_KeyDown select 1 };
	if (!(isnil "GCam_KeyUp")) then { _keyu = GCam_KeyUp select 1 };
	if (_keyd == _keyu) then
	{
		GCam_KeyDown set [1, -1];
		GCam_KeyUp set [1, -1];
		_be_keypushed = false;
	};

	if (_keyd == 17 and _keyu != 17) then
	{
		if (_behind and _follow) then
		{
			_accx = _accx + (cos _be_camobjdir) * CFMOVE * 0.05 * _cfzoom;
			_accy = _accy + (sin _be_camobjdir) * CFMOVE * 0.05 * _cfzoom;
		}
		else
		{
			_accx = _accx + (cos _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_accy = _accy + (sin _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;

		};
		_be_keypushed = true;
	};
	if (_keyd == 31 and _keyu != 31) then
	{
		if (_behind and _follow) then
		{
			_accx = _accx - (cos _be_camobjdir) * CFMOVE * 0.05 * _cfzoom;
			_accy = _accy - (sin _be_camobjdir) * CFMOVE * 0.05 * _cfzoom;
		}
		else
		{
			_accx = _accx - (cos _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_accy = _accy - (sin _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
		};
		_be_keypushed = true;
	};
	if (_keyd == 30 and _keyu != 30) then
	{
		if (_behind and _follow) then
		{
			if ( (180 - abs(180 - _be_camobjdir_dif)) < 170 ) then { _be_camobjdir_add = _be_camobjdir_add - CFMOVE * 2.2 * _cfzoom };
			if ( _be_camobjdir_add >= 360.0 ) then { _be_camobjdir_add = _be_camobjdir_add - 360.0 };
			if ( _be_camobjdir_add < 0.0 ) then { _be_camobjdir_add = _be_camobjdir_add + 360.0 };
		}
		else
		{
			_accx = _accx - (sin _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_accy = _accy + (cos _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_be_keypushed = true;
		};
	};
	if (_keyd == 32 and _keyu != 32) then
	{
		if (_behind and _follow) then
		{
			if ( (180 - abs(180 - _be_camobjdir_dif)) < 170 ) then { _be_camobjdir_add = _be_camobjdir_add + CFMOVE * 2.2 * _cfzoom };
			if ( _be_camobjdir_add >= 360.0 ) then { _be_camobjdir_add = _be_camobjdir_add - 360.0 };
			if ( _be_camobjdir_add < 0.0 ) then { _be_camobjdir_add = _be_camobjdir_add + 360.0 };
		}
		else
		{
			_accx = _accx + (sin _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_accy = _accy - (cos _dir) * CFMOVE * 0.05 * _cfzoom * _cfalt;
			_be_keypushed = true;
		};
	};
	if (_keyd == 16 and _keyu != 16) then
	{
		if ( _follow ) then
		{
			_accz = _accz + CFMOVE * 0.05 * _cfzoom;
		}
		else
		{
			_accz = _accz + CFMOVE * 0.05 * _cfzoom * _cfalt;
		};
	};
	if (_keyd == 44 and _keyu != 44) then
	{
		if ( _follow ) then
		{
			_accz = _accz - CFMOVE * 0.05 * _cfzoom;
		}
		else
		{
			_accz = _accz - CFMOVE * 0.05 * _cfzoom * _cfalt;
		};
	};
	if (_keyd == 3 and _keyu != 3) then
	{
		if (_behind and _follow) then
		{
			_be_camobjdive = (sqrt(((_objpos select 0) - (_campos select 0))^2.0 + ((_objpos select 1) - (_campos select 1))^2.0) atan2 ((_objpos select 2) - (_campos select 2) + 1.57 + _be_corrattde) - 90.0) * -1;
			_accx = _accx + 1.5 * CFMOVE * 0.05 * (cos _be_camobjdir) * (cos _be_camobjdive) * _cfzoom;
			_accy = _accy + 1.5 * CFMOVE * 0.05 * (sin _be_camobjdir) * (cos _be_camobjdive) * _cfzoom;
			_accz = _accz + 1.5 * CFMOVE * 0.05 * (sin _be_camobjdive) * _cfzoom;
		}
		else
		{
			_accx = _accx + 1.5 * CFMOVE * 0.05 * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accy = _accy + 1.5 * CFMOVE * 0.05 * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accz = _accz + 1.5 * CFMOVE * 0.05 * (sin _dive) * _cfzoom * _cfalt;
		};
		_be_keypushed = true;
	};
	if (_keyd == 45 and _keyu != 45) then
	{
		if (_behind and _follow) then
		{
			_be_camobjdive = (sqrt(((_objpos select 0) - (_campos select 0))^2.0 + ((_objpos select 1) - (_campos select 1))^2.0) atan2 ((_objpos select 2) - (_campos select 2) + 1.57 + _be_corrattde) - 90.0) * -1;
			_accx = _accx - 1.5 * CFMOVE * 0.05 * (cos _be_camobjdir) * (cos _be_camobjdive) * _cfzoom;
			_accy = _accy - 1.5 * CFMOVE * 0.05 * (sin _be_camobjdir) * (cos _be_camobjdive) * _cfzoom;
			_accz = _accz - 1.5 * CFMOVE * 0.05 * (sin _be_camobjdive) * _cfzoom;
		}
		else
		{
			_accx = _accx - 1.5 * CFMOVE * 0.05 * (cos _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accy = _accy - 1.5 * CFMOVE * 0.05 * (sin _dir) * (cos _dive) * _cfzoom * _cfalt;
			_accz = _accz - 1.5 * CFMOVE * 0.05 * (sin _dive) * _cfzoom * _cfalt;
		};
		_be_keypushed = true;
	};


	if (_keyd == 33 and _keyu == 33) then
	{
		call _ChangeModeFollow;
	};

	if (_keyd == 48 and _keyu == 48) then
	{
		call _ChangeModeBehind;
	};

	if (_keyd == 46 and _keyu == 46) then
	{
		call _ChangeModeFocus;
	};

	if (SHOWTRIGGER and _keyd == 20 and _keyu == 20) then
	{
		call _ChangeModeTrigger;
	};

	if (_keyd == 200 and _keyu == 200) then
	{
		call _SelectCycleUnits;

		if (count _cy_objlist_ingroup > 0) then
		{
			_cy_num = _cy_num + 1;
			if ((count _cy_objlist_ingroup) == _cy_num) then
			{
				_cy_num = 0;
			};
			_obj = _cy_objlist_ingroup select _cy_num;

			while {_obj iskindof "BIS_alice_emptydoor"} do
			{
				_cy_num = _cy_num + 1;
				if ((count _cy_objlist_ingroup) == _cy_num) then
				{
					_cy_num = 0;
				};
				_obj = _cy_objlist_ingroup select _cy_num;
			};

			_changedkey = 200;
			call _ResetCamera;
			_obj_last = _obj;
		};
	};
	if (_keyd == 208 and _keyu == 208) then
	{
		call _SelectCycleUnits;

		if (count _cy_objlist_ingroup > 0) then
		{
			_cy_num = _cy_num - 1;
			if (_cy_num < 0) then
			{
				_cy_num = (count _cy_objlist_ingroup) - 1;
			};
			_obj = _cy_objlist_ingroup select _cy_num;

			while {_obj iskindof "BIS_alice_emptydoor"} do
			{
				_cy_num = _cy_num - 1;
				if (_cy_num < 0) then
				{
					_cy_num = (count _cy_objlist_ingroup) - 1;
				};
				_obj = _cy_objlist_ingroup select _cy_num;
			};

			_changedkey = 208;
			call _ResetCamera;
			_obj_last = _obj;
		};
	};
	if (_keyd == 205 and _keyu == 205) then
	{
		call _SelectCycleLeaders;

		_cy_num = _cy_num + 1;
		if ((count _cy_objlist_leader) == _cy_num) then
		{
			_cy_num = 0;
		};
		_obj = _cy_objlist_leader select _cy_num;

		_cy_selectnum = 1;
		while {_obj iskindof "BIS_alice_emptydoor" and count(units(group _obj)) > _cy_selectnum} do
		{
			_obj = units(group _obj) select _cy_selectnum;

			_cy_selectnum = _cy_selectnum + 1;
		};

		_changedkey = 205;
		call _ResetCamera;
		_obj_last = _obj;
	};
	if (_keyd == 203 and _keyu == 203) then
	{
		call _SelectCycleLeaders;

		_cy_num = _cy_num - 1;
		if (_cy_num < 0) then
		{
			_cy_num = (count _cy_objlist_leader) - 1;
		};
		_obj = _cy_objlist_leader select _cy_num;

		_cy_selectnum = 1;
		while {_obj iskindof "BIS_alice_emptydoor" and count(units(group _obj)) > _cy_selectnum} do
		{
			_obj = units(group _obj) select _cy_selectnum;

			_cy_selectnum = _cy_selectnum + 1;
		};

		_changedkey = 203;
		call _ResetCamera;
		_obj_last = _obj;
	};

	if (_keyd == 38 and _keyu == 38) then
	{
		_li_listshow = !(_li_listshow);

		if (_li_listshow) then
		{ call _OpenList }
		else
		{ call _CloseList };
	};
	if (_li_listshow) then
	{
		if (_mousebd == 0 and _mousebu != 0 and _mousemove) then
		{
			_mousepos = [ GCam_MouseMove select 1, GCam_MouseMove select 2 ];
			_accdir = _accdir + (_mousepos select 0) * 1.35 * CFTRK * (-1) * _cfzoom / (cos abs(_dive / (1.0 + _cfzoom))) * _mouseacc;
			_dir = _dir + _accdir;
			if (_dir >= 360.0) then { _dir = _dir - 360.0 };
			if (_dir < 0.0) then { _dir = _dir + 360.0 };

			_accdive = _accdive + (_mousepos select 1) * 3.9 * CFTRK * (-1) * _cfzoom * _mouseacc;
			_dive = _dive + _accdive;
			if (_dive > 89.9) then
			{
				_dive = 89.9;
				_accdive = 0.0;
			};
			if (_dive < -89.9) then
			{
				_dive = -89.9;
				_accdive = 0.0;
			};
			GCam_MouseMove set [ 1, (GCam_MouseMove select 1)*0.8 ];
			GCam_MouseMove set [ 2, (GCam_MouseMove select 2)*0.8 ];
		};

		_keyd_list = GCam_KeyDown_List select 1;
		if (isnil "_keyd_list") then { _keyd_list = -1 };
		_keyd_listtrigger = GCam_KeyDown_ListTrigger select 1;
		if (isnil "_keyd_listtrigger") then { _keyd_listtrigger = -1 };
		_keyd_listfollow = GCam_KeyDown_ListFollow select 1;
		if (isnil "_keyd_listfollow") then { _keyd_listfollow = -1 };
		_keyd_listbehind = GCam_KeyDown_ListBehind select 1;
		if (isnil "_keyd_listbehind") then { _keyd_listbehind = -1 };
		_keyd_listfocus = GCam_KeyDown_ListFocus select 1;
		if (isnil "_keyd_listfocus") then { _keyd_listfocus = -1 };
		_keyd_listclose = GCam_KeyDown_ListClose select 1;
		if (isnil "_keyd_listclose") then { _keyd_listclose = -1 };
		_keyd_listtimeinc = GCam_KeyDown_ListTimeInc select 1;
		if (isnil "_keyd_listtimeinc") then { _keyd_listtimeinc = -1 };
		_keyd_listtimedec = GCam_KeyDown_ListTimeDec select 1;
		if (isnil "_keyd_listtimedec") then { _keyd_listtimedec = -1 };
		_mclick_listfollow = GCam_MouseClick_ListFollow select 1;
		if (isnil "_mclick_listfollow") then { _mclick_listfollow = -1 };
		_mclick_listbehind = GCam_MouseClick_ListBehind select 1;
		if (isnil "_mclick_listbehind") then { _mclick_listbehind = -1 };
		_mclick_listfocus = GCam_MouseClick_ListFocus select 1;
		if (isnil "_mclick_listfocus") then { _mclick_listfocus = -1 };
		_mclick_listclose = GCam_MouseClick_ListClose select 1;
		if (isnil "_mclick_listclose") then { _mclick_listclose = -1 };
		_mclick_listtrigger = GCam_MouseClick_ListTrigger select 1;
		if (isnil "_mclick_listtrigger") then { _mclick_listtrigger = -1 };
		_mclick_listtimeinc = GCam_MouseClick_ListTimeInc select 1;
		if (isnil "_mclick_listtimeinc") then { _mclick_listtimeinc = -1 };
		_mclick_listtimedec = GCam_MouseClick_ListTimeDec select 1;
		if (isnil "_mclick_listtimedec") then { _mclick_listtimedec = -1 };

		_mselect_list = GCam_MouseSelect_List select 1;
		if (isnil "_mselect_list") then { _mselect_list = -1 };

		if ( _mselect_list != -1 ) then
		{
			ctrlSetFocus (findDisplay 5100 displayCtrl 4);

			sleep (_wait * 20);
			if ( alive(_li_objlist select _mselect_list) ) then
			{
				_obj = _li_objlist select _mselect_list;
			};

			lbSetCurSel [0, 0];
			lbClear 0;
			GCam_MouseSelect_List set [1,-1];
			GCam_MouseBD set [1, -1];
			GCam_MouseBU set [1, -1];

			_li_objlist = nearestObjects [_obj, ["AllVehicles"], _scandistance];
			if ((count _li_objlist) == 0) then
			{
				_obj = _obj_last;
				_li_objlist = nearestObjects [_obj, ["AllVehicles"], _scandistance];
			};

			if ((_obj != _obj_last) or !(_follow)) then
			{
				call _ResetCamera;
				_obj_last = _obj;
			};

			_so_objgroup = grpNull;

			_so_objlist = _li_objlist;
			call _SelectObjects;
			call _ListObjects;
			_li_objlist = _so_objlist;
		};

		if (_mclick_listfollow == 0 or _keyd_listfollow == 28 or _keyd_listfollow == 57) then
		{
			call _ChangeModeFollow;

			GCam_KeyDown_ListFollow set [1,-1];
			GCam_MouseClick_ListFollow set [1,-1];
		};

		if (_mclick_listbehind == 0 or _keyd_listbehind == 28 or _keyd_listbehind == 57) then
		{
			call _ChangeModeBehind;

			GCam_KeyDown_ListBehind set [1,-1];
			GCam_MouseClick_ListBehind set [1,-1];
		};

		if (_mclick_listfocus == 0 or _keyd_listfocus == 28 or _keyd_listfocus == 57) then
		{
			call _ChangeModeFocus;

			GCam_KeyDown_ListFocus set [1,-1];
			GCam_MouseClick_ListFocus set [1,-1];
		};

		if (_mclick_listtimeinc == 0 or _keyd_listtimeinc == 28 or _keyd_listtimeinc == 57) then
		{
			if ( (acctime + 0.1) <= 2.0 ) then { setacctime ((round((acctime + 0.1)*10))*0.1) };
			(findDisplay 5100 displayCtrl 10) ctrlSetText format["accTime:%1",acctime];
			_mouseacc = acctime^1.5 + 0.007;
			GCam_KeyDown_ListTimeInc set [1,-1];
			GCam_MouseClick_ListTimeInc set [1,-1];
		};
		if (_mclick_listtimedec == 0 or _keyd_listtimedec == 28 or _keyd_listtimedec == 57) then
		{
			if ( (acctime - 0.1) >= 0.0 ) then { setacctime ((round((acctime - 0.1)*10))*0.1) };
			(findDisplay 5100 displayCtrl 10) ctrlSetText format["accTime:%1",acctime];
			_mouseacc = acctime^1.5 + 0.007;
			GCam_KeyDown_ListTimeDec set [1,-1];
			GCam_MouseClick_ListTimeDec set [1,-1];
		};

		if (_mclick_listtrigger == 0 or _keyd_listtrigger == 28 or _keyd_listtrigger == 57) then
		{
			call _ChangeModeTrigger;

			GCam_KeyDown_ListTrigger set [1,-1];
			GCam_MouseClick_ListTrigger set [1,-1];
		};

		if ( !(ctrlShown(findDisplay 5100 displayCtrl 0)) or _keyd_list == 38 or _keyd_listtrigger == 38 or _keyd_listfollow == 38 or _keyd_listbehind == 38 or _keyd_listfocus == 38 or _keyd_listclose == 38 or _keyd_listclose == 28 or _keyd_listclose == 57 or _keyd_listtimeinc == 38 or _keyd_listtimedec == 38 or _mclick_listclose == 0 ) then
		{
			call _CloseList;
		};
	};


	if (_keyd == 50 and _keyu == 50) then
	{
		_ma_mapshow = !(_ma_mapshow);

		if (_ma_mapshow) then
		{ call _OpenMap }
		else
		{ call _CloseMap };
	};
	if (_ma_mapshow) then
	{
		if ( alive _obj ) then
		{
			_ma_objpos = getposASL _obj;

			"camera" setMarkerPosLocal [_campos select 0, _campos select 1];
			"camera" setMarkerDirLocal -(_dir) + 90;
			"object" setMarkerPosLocal [_ma_objpos select 0, _ma_objpos select 1];
			if ((speed _obj) > 4) then
			{
				"object" setMarkerTypeLocal "mil_Arrow2";
				"object" setMarkerSizeLocal [0.45, 0.45];
				"object" setMarkerDirLocal (getdir _obj);
			}
			else
			{
				"object" setMarkerTypeLocal "dot";
				"object" setMarkerSizeLocal [1, 1];
			};

			_tx_crewname = "";
			if ( (count(crew _obj)) > 1) then
			{
				{
					if (((crew _obj) select 0) != _x) then { _tx_crewname = _tx_crewname + ", " };
					_tx_crewname = _tx_crewname + format["%1", name _x];
				} forEach (crew _obj);
			}
			else
			{
				_tx_crewname = name _obj;
			};
			"object" setMarkerTextLocal format["%1 : %2", getText (configFile >> "CfgVehicles" >> (typeOf _obj) >> "displayName"), _tx_crewname];
		}
		else
		{
			"object" setMarkerSizeLocal [0.0, 0.0];
			"object" setMarkerTextLocal "";
		};

		if (GCam_Map_Clicked) then
		{
			if (_ma_scanned and [_ma_scanpos select 0, _ma_scanpos select 1] distance [GCam_Map_Clicked_PosX, GCam_Map_Clicked_PosY] < _scandistance) then
			{
				_ma_objlist = nearestObjects [ [GCam_Map_Clicked_PosX, GCam_Map_Clicked_PosY, (getposATL _cam select 2)+50], ["AllVehicles"], _scandistance ];

				_so_objlist = _ma_objlist;
				call _SelectObjects;
				_ma_objlist = _so_objlist;

				if ( count _ma_objlist > 0 ) then
				{
					if ( ([(getposASL(_ma_objlist select 0)) select 0, (getposASL(_ma_objlist select 0)) select 1] distance [GCam_Map_Clicked_PosX, GCam_Map_Clicked_PosY]) < (10+abs(speed(_ma_objlist select 0))) ) then
					{
						_obj = _ma_objlist select 0;

						call _MarkerSet;
						call _ResetCamera;
						_obj_last = _obj;
					};
				};
			};

			_ma_scanpos = [GCam_Map_Clicked_PosX, GCam_Map_Clicked_PosY, getposATL _cam select 2];
			_ma_objlist = nearestObjects [_ma_scanpos, ["AllVehicles"], _scandistance];

			_so_objlist = _ma_objlist;
			call _SelectObjects;
			call _ScanMarkerSet;
			_ma_objlist = _so_objlist;

			GCam_Map_Clicked = false;
			ctrlSetFocus (findDisplay 5101 displayCtrl 3);
		};

		_keyd_map = GCam_KeyDown_Map select 1;
		if (isnil "_keyd_map") then { _keyd_map = -1 };
		_keyd_mapscan = GCam_KeyDown_MapScan select 1;
		if (isnil "_keyd_mapscan") then { _keyd_mapscan = -1 };
		_keyd_mapclose = GCam_KeyDown_MapClose select 1;
		if (isnil "_keyd_mapclose") then { _keyd_mapclose = -1 };
		_mclick_mapscan = GCam_MouseClick_MapScan select 1;
		if (isnil "_mclick_mapscan") then { _mclick_mapscan = -1 };
		_mclick_mapclose = GCam_MouseClick_MapClose select 1;
		if (isnil "_mclick_mapclose") then { _mclick_mapclose = -1 };

		if ( _keyd_mapscan == 28 or _keyd_mapscan == 57 or _mclick_mapscan == 0 ) then
		{
			GCam_KeyDown_MapScan set [1,-1];
			GCam_MouseClick_MapScan set [1,-1];

			_ma_scanpos = getposATL _obj;
			_ma_objlist = nearestObjects [_ma_scanpos, ["AllVehicles"], _scandistance];

			_so_objlist = _ma_objlist;
			call _SelectObjects;
			call _ScanMarkerSet;
			_ma_objlist = _so_objlist;

			ctrlSetFocus (findDisplay 5101 displayCtrl 3);
		};

		if (_ma_scanned) then
		{
			_ma_passtime = diag_tickTime - _ma_scantime;
			if (_ma_passtime > 5.0) then
			{
				{
					deleteMarkerLocal _x;
				} forEach _ma_marked_objlist;
				_ma_scanned = false;
			};
			if (_ma_passtime > 0.25) then
			{
				deleteMarkerLocal "circle";
			};
		};

		if ( !(ctrlShown(findDisplay 5101 displayCtrl 0)) or _keyd_mapclose == 28 or _keyd_mapclose == 57 or _mclick_mapclose == 0 ) then
		{
			call _CloseMap;
		};
	};


	if (_keyd == 35 and _keyu == 35) then
	{
		_helpshow = !(_helpshow);

		if (_helpshow) then
		{ call _OpenHelp }
		else
		{ call _CloseHelp };
	};
	if (_helpshow) then
	{
		_keyd_helpclose = GCam_KeyDown_HelpClose select 1;
		if (isnil "_keyd_helpclose") then { _keyd_helpclose = -1 };
		_mclick_helpclose = GCam_MouseClick_HelpClose select 1;
		if (isnil "_mclick_helpclose") then { _mclick_helpclose = -1 };

		if ( !(ctrlShown(findDisplay 5103 displayCtrl 0)) or _keyd_helpclose == 57 or _keyd_helpclose == 28 or _mclick_helpclose == 0 ) then
		{
			call _CloseHelp;
		};
	};

	if (_keyd == 49 and _keyu == 49) then
	{
		camUseNVG _nvg;
		_nvg = !(_nvg);
	};

	if ( (!(LIMITQUIT) and _keyd == 57) or !(alive player) or GCamKill) then
	{
		if ( !(alive player) or GCamKill ) then { _quit = true };

		if ( _keyd == 57 ) then
		{
			setmouseposition [0.500,0.575];

			createDialog "GCam_Dialog_Quit";
			waituntil{ctrlShown(findDisplay 5102 displayCtrl 0)};

			(findDisplay 5102 displayCtrl 0) ctrlSetTextColor COLORTEXT;
			(findDisplay 5102 displayCtrl 0) ctrlSetBackgroundColor COLORTEXTBACKGROUND;
			(findDisplay 5102 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF;
			(findDisplay 5102 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTOFF;

			(findDisplay 5102 displayCtrl 3) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_QuitOk = _this"];
			(findDisplay 5102 displayCtrl 3) ctrlSetEventHandler ["KeyDown", "GCam_Keydown_QuitOk = _this"];
			(findDisplay 5102 displayCtrl 4) ctrlSetEventHandler ["MouseButtonClick", "GCam_MouseClick_QuitCancel = _this"];
			(findDisplay 5102 displayCtrl 4) ctrlSetEventHandler ["KeyDown", "GCam_Keydown_QuitCancel = _this"];

			ctrlSetFocus (findDisplay 5102 displayCtrl 4);

			_quitchk = true;
			_quit = false;
			while {_quitchk} do
			{
    			_mclick_quitok = GCam_MouseClick_QuitOk select 1;
				if (isnil "_mclick_quitok") then { _mclick_quitok = -1 };
				_keyd_quitok = GCam_Keydown_QuitOk select 1;
				if (isnil "_keyd_quitok") then { _keyd_quitok = -1 };
				_mclick_quitcancel = GCam_MouseClick_QuitCancel select 1;
				if (isnil "_mclick_quitcancel") then { _mclick_quitcancel = -1 };
				_keyd_quitcancel = GCam_Keydown_QuitCancel select 1;
				if (isnil "_keyd_quitcancel") then { _keyd_quitcancel = -1 };

				if ( !(ctrlShown(findDisplay 5102 displayCtrl 0)) or _mclick_quitcancel == 0 or _keyd_quitcancel == 28 or _keyd_quitcancel == 57 ) then
				{
					closedialog 5102;
					_quitchk = false;
				};

				if ( _mclick_quitok == 0 or _keyd_quitok == 28 or _keyd_quitok == 57 ) then
				{
					_quit = true;
					_quitchk = false
				};

				GCam_MouseClick_QuitOk set [1,-1];
				GCam_Keydown_QuitOk set [1,-1];
				GCam_MouseClick_QuitCancel set [1,-1];
				GCam_Keydown_QuitCancel set [1,-1];

				sleep _wait;
			};

			closedialog 5102;

			GCam_KeyDown set [1, -1];
			GCam_KeyUp set [1, -1];
		};

		if ( _quit ) then
		{
			if (_trigger) then { _obj removeEventHandler ["fired", _tr_ehidx] };
			setacctime _initacctime;

			titletext["","plain down",0.0];
			camUseNVG false;
			enableTeamSwitch _initteamswitch;

			(findDisplay 46) displayRemoveEventHandler ["KeyDown", _ehid_keydown];
			(findDisplay 46) displayRemoveEventHandler ["KeyUp", _ehid_keyup];
			(findDisplay 46) displayRemoveEventHandler ["MouseMoving", _ehid_mousemove];
			(findDisplay 46) displayRemoveEventHandler ["MouseZChanged", _ehid_mousezchange];
			(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _ehid_mousebd];
			(findDisplay 46) displayRemoveEventHandler ["MouseButtonUp", _ehid_mousebu];

			_cam cameraEffect ["Terminate", "BACK"];
			camDestroy _cam;
			_loopexit = true;
		};
	};

	_wheel = GCam_MouseWheel select 1;
	if ((_wheel > 0.0001 or _wheel < -0.0001) and !(_ma_mapshow)) then
	{
		_acczoom = _acczoom - _wheel * 0.12 * CFWHEEL * sin((_zoom / 2.0) * 90.0);
		GCam_MouseWheel set [1, 0];
	};
	if ((abs _acczoom) > 0.0001) then
	{
		_zoom = _zoom + _acczoom;
		if (_zoom < 0.01) then
		{
			_zoom = 0.01;
			_acczoom = 0.0;
		};
		if (_zoom > 2.0) then
		{
			_zoom = 2.0;
			_acczoom = 0.0;
		};
		_cam camSetFov _zoom;
		_cfzoom = sin ((_zoom / 1.8) * 90);
	};

	if (!(_follow)) then
	{
		_cfalt = 1.0 + 100.0 * (getposATL _cam select 2) / 1000.0;
		if (_cfalt > 100.0) then { _cfalt = 100.0 };
	};


	if ( _so_objgroup != (group _obj) and !(alive(leader(group _obj))) ) then { _so_objgroup = group _obj };

	if ( (isnull _obj) or (count(crew _obj)) == 0 ) then
	{
		if (isnull _obj) then { sleep (_wait*100) };

		_so_objlist = nearestObjects [ [_objpos select 0, _objpos select 1,(getposATL _cam select 2)-(_campos_rel select 2)], ["AllVehicles"], 10 ];
		if ( alive(_so_objlist select 0) ) then
		{
			_obj = _so_objlist select 0;

			_so_objlist = nearestObjects [ [_objpos select 0, _objpos select 1,(getposATL _cam select 2)-(_campos_rel select 2)], ["AllVehicles"], _scandistance ];
			call _SelectObjects;
		}
		else
		{
			_so_objlist = nearestObjects [ [_objpos select 0, _objpos select 1,(getposATL _cam select 2)-(_campos_rel select 2)], ["AllVehicles"], _scandistance ];
			call _SelectObjects;
		};

		if (_li_listshow) then
		{
			lbSetCurSel [2, 0];
			lbClear 2;
			call _ListObjects;
		};

		if ( (count _so_objlist) == 0 ) then
		{
			titletext["Camera lost the follow unit.","plain down",_wait*20];

			_obj = player;
		}
		else
		{
			_obj = _so_objlist select 0;
		};

		call _ResetCamera;
		_obj_last = _obj;
	};


	if ( _behind and _follow ) then
	{
		_be_objdir = ((getdir _obj) -90.0) * -1;
		if (_be_objdir >= 360.0) then { _be_objdir = _be_objdir - 360.0 };
		if (_be_objdir < 0.0) then { _be_objdir = _be_objdir + 360.0 };

		_be_camobjtardir = _be_objdir + _be_camobjdir_add;
		if (_be_camobjtardir >= 360.0) then { _be_camobjtardir = _be_camobjtardir - 360.0 };
		if (_be_camobjtardir < 0.0) then { _be_camobjtardir = _be_camobjtardir + 360.0 };

		_be_camobjdir = ( ((_campos_rel select 0) atan2 (_campos_rel select 1)) + 90.0 ) * -1;
		if (_be_camobjdir >= 360.0) then { _be_camobjdir = _be_camobjdir - 360.0 };
		if (_be_camobjdir < 0.0) then { _be_camobjdir = _be_camobjdir + 360.0 };

		_be_camobjdir_dif = _be_camobjtardir - _be_camobjdir;
		if (_be_camobjdir_dif >= 360.0) then { _be_camobjdir_dif = _be_camobjdir_dif - 360.0 };
		if (_be_camobjdir_dif < 0.0) then { _be_camobjdir_dif = _be_camobjdir_dif + 360.0 };

		_be_camobjxydis = sqrt(((_campos select 0) - (_objpos select 0))^2.0 + ((_campos select 1) - (_objpos select 1))^2.0);
		if ( _be_camobjxydis > 2.0 ) then { _be_turncoef = 1.0 + (10.0/(_cam distance _obj)) };

		switch (true) do
		{
			case (_be_camobjdir_dif > 180.0 and _be_camobjdir_dif < 360.0):
			{
				_accx = _accx - (sin _be_camobjdir) * (abs(sin((_be_camobjdir_dif)/2.0))) * _be_turncoef * BEHINDSPDAROUND;
				_accy = _accy + (cos _be_camobjdir) * (abs(sin((_be_camobjdir_dif)/2.0))) * _be_turncoef * BEHINDSPDAROUND;
				_be_lr = 1;
			};
			case (_be_camobjdir_dif >= 0.0 and _be_camobjdir_dif <= 180.0):
			{
				_accx = _accx + (sin _be_camobjdir) * (abs(sin((_be_camobjdir_dif)/2.0))) * _be_turncoef * BEHINDSPDAROUND;
				_accy = _accy - (cos _be_camobjdir) * (abs(sin((_be_camobjdir_dif)/2.0))) * _be_turncoef * BEHINDSPDAROUND;
				_be_lr = -1;
			};
		};

		if ( _be_lr != _be_lr_last and !(_be_keypushed) ) then
		{
			_accx = 0.0;
			_accy = 0.0;
			_be_lr_last = _be_lr;
		};

		if ( _be_keypushed ) then { _be_camobjxydis_tar = sqrt(((_campos select 0) - (_objpos select 0))^2.0 + ((_campos select 1) - (_objpos select 1))^2.0) };
		_accx = _accx - ((cos _be_camobjdir) * (sin(_be_camobjxydis_tar - _be_camobjxydis)) * 2.4);
		_accy = _accy - ((sin _be_camobjdir) * (sin(_be_camobjxydis_tar - _be_camobjxydis)) * 2.4);
		if ( _be_camobjxydis < 0.4 ) then
		{
			_be_camobjxydis_tar = 0.41;
			_accx = - ((cos _be_camobjdir) * 0.01);
			_accy = - ((sin _be_camobjdir) * 0.01);
		};


		_be_camdir_add = _be_camdir_add + _accdir;
		if ( _be_camdir_add >= 360.0 ) then { _be_camdir_add = _be_camdir_add - 360.0 };
		if ( _be_camdir_add < 0.0 ) then { _be_camdir_add = _be_camdir_add + 360.0 };

		_be_camdir_tar = _dir - _be_camdir_add;
		if ( _be_camdir_tar >= 360.0 ) then { _be_camdir_tar = _be_camdir_tar - 360.0 };
		if ( _be_camdir_tar < 0.0 ) then { _be_camdir_tar = _be_camdir_tar + 360.0 };

		_be_camdir_dif = _be_objdir - _be_camdir_tar;
		if ( _be_camdir_dif >= 360.0 ) then { _be_camdir_dif = _be_camdir_dif - 360.0 };
		if ( _be_camdir_dif < 0.0 ) then { _be_camdir_dif = _be_camdir_dif + 360.0 };

		_be_camdir_dif = _be_camdir_dif + _be_camobjdir_add;
		if ( _be_camdir_dif >= 360.0 ) then { _be_camdir_dif = _be_camdir_dif - 360.0 };
		if ( _be_camdir_dif < 0.0 ) then { _be_camdir_dif = _be_camdir_dif + 360.0 };

		switch (true) do
		{
			case (_be_camdir_dif >= 0.0 and _be_camdir_dif < 180.0) : { _dir = _dir + (abs(sin(_be_camdir_dif/2.0))) * _cfzoom * (_be_turncoef^BEHINDSPDROTATE) };
			case (_be_camdir_dif >= 180.0 and _be_camdir_dif < 360.0) : { _dir = _dir - (abs(sin(_be_camdir_dif/2.0))) * _cfzoom * (_be_turncoef^BEHINDSPDROTATE) };
		};
		if ( _dir >= 360.0 ) then { _dir = _dir - 360.0 };
		if ( _dir < 0.0 ) then { _dir = _dir + 360.0 };

		if ( _obj isKindOf "Man" ) then { _be_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30.0/(_be_camobjxydis_tar+0.1))) };
	};

	if ( _focus and !(_follow) ) then
	{
		_fc_objpos = getposASL _obj;
		_fc_campos = getposASL _cam;

		_fc_camobjdir = ( ( ((_fc_objpos select 0) - (_fc_campos select 0)) atan2 ((_fc_objpos select 1) - (_fc_campos select 1)) ) -90.0 ) * -1;
		if (_fc_camobjdir >= 360.0) then { _fc_camobjdir = _fc_camobjdir - 360.0 };
		if (_fc_camobjdir < 0.0) then { _fc_camobjdir = _fc_camobjdir + 360.0 };

		_fc_camobjdir_dif = _dir - _fc_camobjdir;
		if (_fc_camobjdir_dif >= 360.0) then { _fc_camobjdir_dif = _fc_camobjdir_dif - 360.0 };
		if (_fc_camobjdir_dif < 0.0) then { _fc_camobjdir_dif = _fc_camobjdir_dif + 360.0 };

		_fc_camdir_add = _fc_camdir_add + _accdir;
		if (_fc_camdir_add >= 360.0) then { _fc_camdir_add = _fc_camdir_add - 360.0 };
		if (_fc_camdir_add < 0.0) then { _fc_camdir_add = _fc_camdir_add + 360.0 };

		_fc_camobjdir_dif = _fc_camobjdir_dif - _fc_camdir_add;
		if (_fc_camobjdir_dif >= 360.0) then { _fc_camobjdir_dif = _fc_camobjdir_dif - 360.0 };
		if (_fc_camobjdir_dif < 0.0) then { _fc_camobjdir_dif = _fc_camobjdir_dif + 360.0 };

		switch (true) do
		{
			case (_fc_camobjdir_dif > 0.0 and _fc_camobjdir_dif < 180.0) : { _dir = _dir - (abs(sin(_fc_camobjdir_dif/2.0))) * 20.0 };
			case (_fc_camobjdir_dif > 180.0 and _fc_camobjdir_dif < 360.0) : { _dir = _dir + (abs(sin(_fc_camobjdir_dif/2.0))) * 20.0 };
		};
		if ( _dir >= 360.0 ) then { _dir = _dir - 360.0 };
		if ( _dir < 0.0 ) then { _dir = _dir + 360.0 };


		_fc_camobjxydis = sqrt(((_fc_campos select 0) - (_fc_objpos select 0))^2.0 + ((_fc_campos select 1) - (_fc_objpos select 1))^2.0);
		if ( _obj isKindOf "Man" ) then { _fc_corrattde = (((_obj selectionposition "head_axis") select 2) - 1.57) * (abs sin(30/(_fc_camobjxydis+0.1))) };

		_fc_camobjdive = (sqrt(((_fc_objpos select 0) - (_fc_campos select 0))^2.0 + ((_fc_objpos select 1) - (_fc_campos select 1))^2.0) atan2 (((_fc_objpos select 2) - (_fc_campos select 2)) + 1.57 + _fc_corrattde) - 90.0) * -1;
		_fc_camobjdive_dif = _fc_camobjdive - _dive;

		_fc_camdive_add = _fc_camdive_add + _accdive;
		_fc_camobjdive_dif = _fc_camobjdive_dif + _fc_camdive_add;

		switch (true) do
		{
			case (_fc_camobjdive_dif > 0.0) : { _dive = _dive + abs(sin(_fc_camobjdive_dif/2.0)) * 20.0 };
			case (_fc_camobjdive_dif <= 0.0) : { _dive = _dive - abs(sin(_fc_camobjdive_dif/2.0)) * 20.0 };
		};
		if (_dive > 89.0) then { _dive = 89.0 };
		if (_dive < -89.0) then { _dive = -89.0 };
	};

	_campos_rel = [ (_campos_rel select 0) + _accx, (_campos_rel select 1) + _accy, (_campos_rel select 2) + _accz ];
	if (_follow) then
	{
		_objpos = getposASL _obj;
	};
	_campos = [ (_objpos select 0) + (_campos_rel select 0) , (_objpos select 1) + (_campos_rel select 1), (_objpos select 2) + (_campos_rel select 2) ];
	_cam setPosASL [ _campos select 0, _campos select 1, (_campos select 2) + _be_corrattde ];
	_cam camSetTarget [ (_campos select 0) + (cos _dir) * (cos _dive) * 100000.0, (_campos select 1) + (sin _dir) * (cos _dive) * 100000.0, (_campos select 2) + (sin _dive) * 100000.0];
	_cam camCommit 0;


	if ( (getposATL _cam select 2) < 0.5 ) then
	{
		_cam setPosATL [ _campos select 0, _campos select 1, 0.501 ];
		if (_follow) then
		{
			_campos_rel set [ 2, (getposASL _cam select 2) - _be_corrattde - (getposASL _obj select 2) ];
		}
		else
		{
			_objpos set [ 2 , getposASL _obj select 2];
			_campos_rel set [ 2, (getposASL _cam select 2) - _be_corrattde - (_objpos select 2) ];
		};
		if ( _accz < 0.0 ) then { _accz = 0.0 };
	};

	_wait = accTime / (diag_fps * 2);
	sleep _wait;
};
