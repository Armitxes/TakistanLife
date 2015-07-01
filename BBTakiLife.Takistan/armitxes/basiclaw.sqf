_action = _this select 0;

switch (_action) do  {
	case "add": {
		if(isjudge && PLAYERDATA select 2 > 0) then {
		
		} else { server globalChat "Only judges with BB Membership may suggest new paragraphs for the constitution."; };
	};
};