IFARRAY =

[

"IF1",
"IF2",
"IF3",
"IF4",
"IF5"

];

for [{_i=0}, {_i < (count IFARRAY)}, {_i=_i+1}] do

{

_b = "InvisibleFence2" createvehiclelocal getmarkerpos (IFARRAY select _i);
_b setdir markerdir (IFARRAY select _i);

};