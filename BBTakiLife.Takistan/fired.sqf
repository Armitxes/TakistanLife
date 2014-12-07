//Created by Wulfer and ArMaTec;
_detector = 
{
	_pos = _this select 0;
	_timenow = time;
	_array = [];
	while{time < (_timenow + 10) || (!(isnull _pos))}do
	{
		sleep 1;
		if(!(isnull _pos))then
		{
			if(count(nearestObjects [_pos, ["Man"], 10]) > 0)then
			{
				//Hint "Player Detected";
				{
					_x setVariable ["flashed",true, true];
					_array set [count _array,_x];
				}foreach nearestObjects [_pos, ["Man"], 10];
			}else{
				//Hint "Player Not Detected";
				{
					_unit = _x;
					_unit setVariable ["flashed",false, true];
					{
						if(_x == _unit)then
						{
							_array = _array - [_x];
						};
					}foreach _array;
				}foreach _array;
			};
		};
	};
};
//player sidechat "shot";
_shooter = _this Select 0; 
_ammotype = _this Select 4;
_bullet = nearestObject [_shooter , _ammotype];
_BPos = [];
while {!isNull _bullet and ((velocity _bullet)select 0 > 0.1)} do
{
	_BPos = getPos _bullet;
};
switch (_ammotype) do
{
    case "SmokeShell":
    {
		[_bullet] call _detector;
    };   
    case "G_40mm_Smoke":
    {
		[_bullet] call _detector;
    };   
    case "F_40mm_Green":
    {
		[_bullet] call _detector;
	};
};
sleep 10;
nodeleteammo = ["PipeBomb","BAF_ied_v1","BAF_ied_v2","BAF_ied_v3","BAF_ied_v4"];
if !(_ammotype in nodeleteammo) then
{
	deleteVehicle _bullet;
};

_detector = nil;