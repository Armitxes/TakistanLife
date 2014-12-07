_isAdmin = serverCommandAvailable "#kick";
if (_isAdmin) then {
player execVM "AdminMenu.sqf"; 
hint "Welcome Admin";
isitadmin = true;
};