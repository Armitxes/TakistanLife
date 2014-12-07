robpoolsafe = 0;
crobpoolsafe = 0; 

while{true} do {
  if(robpoolsafe < 200000)then{robpoolsafe = robpoolsafe + round random 5000; publicVariable "robpoolsafe"};
  if(crobpoolsafe < 300000)then{crobpoolsafe = crobpoolsafe + round random 6000; publicVariable "crobpoolsafe"};
  sleep 110;
};
