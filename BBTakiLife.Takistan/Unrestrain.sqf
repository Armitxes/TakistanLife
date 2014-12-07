if (!alive player)exitwith{};

isstunned=true;

player groupchat "You have been restrained!";
_resTime = (time/60);

waituntil {(animationstate player != "civillying01") or (_resTime+5 <= (time/60))};

if(animationstate player == "civillying01")then{
	player groupchat "You managed to free yourself!";
	(format ["%1 switchmove ""%2"";", player, "amovppnemstpsnonwnondnon"]) call toClients;
}else{player groupchat "You have been released!"};

isstunned=false;
StunActiveTime=0;