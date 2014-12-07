_killer = _this select 0;
_owner  = _this select 1;

if(_killer == _owner)exitwith{};
["addWarrant",player,"NPC Murder",2000] execVM "warrant.sqf";
