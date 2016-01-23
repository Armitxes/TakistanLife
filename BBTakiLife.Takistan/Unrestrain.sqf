if (!alive player)exitwith{};

isstunned=true;

hintSilent "You have been restrained!";
_resTime = (time/60);

waitUntil {!(animationState player in animRestrained) or (_resTime+5 <= (time/60))};

if(animationState player in animRestrained)then{
	hintSilent "You managed to free yourself!";
	(format ["%1 switchmove ""%2"";", player, "amovppnemstpsnonwnondnon"]) call toClients;
}else{hintSilent "You have been released!"};

isstunned=false;
StunActiveTime=0;