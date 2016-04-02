if(dragging && !(isciv)) then
{
	dragging = false;
	detach dragciv; 
	format['if(player == %2)then{ [%1] execVM "putinjail.sqf"; };', player, dragciv] call toClients;   
	dragciv = null;
};