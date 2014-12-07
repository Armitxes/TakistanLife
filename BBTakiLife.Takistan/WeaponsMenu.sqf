// Made By TomNyeTheScGuy.........
_start = createDialog "WeaponsMenu";

#define WeaponsMenu 2119

thingsAvailable = [
"----Pistols----",
"UZI (PDW)",
"30Rnd UZI Mag",
"M9",
"M9 Mag",
"M9 Stun Mag",
"Glock-17",
"G17 Mag",
"Makarov",
"Makarov Mag",
"Colt1911",
"M1911 Mag",
"Revolver",
"Gold Revolver",
"Revolver Mag",
"----SMGs----",
"MP5",
"MP5 Stun Mag",
"----Machine Guns----",
"MG36",
"100Rnd MG36 Mag",
"Mk48 Mod 0",
"100Rnd Mk48 Mag",
"M60E4",
"100Rnd M60 Mag",
"M249 SAW",
"200Rnd M249 Mag",
"PK",
"PK Mag",
"M8 SAW",
"100Rnd M8 Mag",
"----Snipers----",
"M24",
"M24 Mag",
"Mk17 Sniper",
"Mk17 Sniper SD",
"SVD",
"SVD Mag",
"",
"",
"",
"",
""
];

{
	lbAdd [WeaponsMenu, _x];
} forEach thingsAvailable;