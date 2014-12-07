while {true} do
{
  if("bomb" call INV_HasLicense)then{isterror=true;};
  _nextflag = getPos player nearestObject "FlagCarrierUNO_EP1";
  switch(typeOf _nextflag) do
  {
    case "FlagCarrierUNO_EP1": { 
      titletext ["This area is under full jurisdiction of the United Nations!","plain down"];
      if (isun) then { paybonus = paybonus + 20; };
    };
    case "FlagCarrierBLUFOR_EP1": { titletext ["This area is under full jurisdiction of the Police!","plain down"]; };
  };
  sleep 5;
};