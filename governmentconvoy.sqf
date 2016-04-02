// script written by Eddie Vedder for the Chernarus life Revivved mission


sleep 10;
govconvoygroup = createGroup west;
_counter = 1200;
_counter2 = 0;
_added = false;
convoywinner = "Neither";


while {true} do {
	sleep (convoyrespawntime*55);
	"hint ""The Government convoy will leave in a few minutes."";" call broadcast;
	sleep (convoyrespawntime*5);

	//Gets position to spawn
	_array  = [[convspawn1, 10], [convspawn2, 10], [convspawn3, 10], [convspawn4, 10], [convspawn5, 10]];
	_spawn   = (floor(random(count _array)));						
	_pos    = (_array select _spawn) select 0;
	_radius = (_array select _spawn) select 1;

	// spawn markers truck and soldiers
	_markerobj = createMarker ["convoy",[0,0]];																				
	_markername = "convoy";																														
	_markerobj setMarkerShape "ICON";								
	"convoy" setMarkerType "Marker";										
	"convoy" setMarkerColor "ColorRed";																														
	"convoy" setMarkerText "Government Convoy";

	convoy_marker_active = 1;
	convoyhascash=true; publicvariable "convoyhascash";
	convoytruck = "Ural_TK_CIV_EP1" createVehicle getPos _pos;

	convoytruck setVehicleInit "
		convoytruck = this; 
		this setVehicleVarName ""convoytruck"";  
		this setAmmoCargo 0;  
		clearWeaponCargo this;
		clearMagazineCargo this;
	";	
	processinitcommands;
	publicVariable "convoytruck";
 
	deleteVehicle convoysoldier;
	convoysoldier = govconvoygroup createUnit ["US_Soldier_Officer_EP1", _pos, [], _radius, "FORM"];
	convoysoldier setvehicleinit 'convoysoldier = this;this setVehicleVarName "convoysoldier";';
	removeAllWeapons convoysoldier;

	processInitCommands;
	govconvoygroup selectLeader convoysoldier;

	convoysoldier moveInDriver convoytruck; 
	convoysoldier assignAsDriver convoytruck;
	govconvoygroup setBehaviour "AWARE";
	govconvoygroup setCombatMode "GREEN";

	//put guards in car with convoysoldier
	sleep 2;
	convoysoldier doMove getPos copbase1;

	//start mission loop
	("server globalchat ""The Government Convoy appeared! Cops and UN protect the convoy from armed civilians and escort to your base, it has your pay checks!"";") call broadcast;
	while {true} do {
	("if(alive player and isciv and player distance convoytruck <= 150)then{titleText [""The Government is operating in this area! Turn back or you will be shot!"", ""plain down""]};") call broadcast;
	"convoy" setmarkerpos getpos convoytruck;
		
	if (!alive convoysoldier and !_added) then { convoytruck lock false; };
		
	if (_counter >= 15) then {
		convoysoldier domove getpos copbase1;
		_counter = 0;
	};
	
	if ((convoytruck distance (getMarkerPos "policebase") < 100) || (convoytruck distance (getMarkerPos "UNstat") < 100)) exitWith {  
		("if (iscop || isun) then {[""dollarz"",govconvoybonus] call INV_AddInventoryItem; player sidechat format[""you received $%1 for the successfully escorting the convoy"", govconvoybonus];};") call broadcast;
		convoywinner = "Cops and UN";
	};
	
	if(!moneyintruck) exitWith {
		 convoywinner = "Civs";	
	};
	
	if (_counter2 >= 900) exitWith {
		convoywinner = "Neither";
	};
		
	if (!alive convoytruck) exitWith {
		("server globalchat ""The government truck has been destroyed the money has burned"";") call broadcast;
		convoywinner = "Neither";
	};
			
	_counter2 = _counter2 + 1;
	_counter = _counter + 1;	
	sleep 1;
};
	
//mission has ended resetting vars and deleting units



(format ['server globalChat "%2 side won the government convoy mission, next truck leaves in %1 minutes!";', convoyrespawntime, convoywinner]) call broadcast;
deletevehicle convoysoldier;
deletevehicle convoytruck;
deletemarker "convoy";

_endmissionounter = 0;
_counter = 0;
_counter2 = 0;
moneyintruck = true;
_added = false;
convoywinner = "Neither";
};