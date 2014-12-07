ENV_ZEIT_MORGEN = 02;
ENV_ZEIT_ABEND  = 21;

while {isServer} do

{

if (SkipTimeDay == 0) exitWith {};
_WarteBeiTag   = (_this select 0) * 60;
_WarteBeiNacht = (_this select 1) * 60;
_SkiptDuration = (_this select 2);
currentTime = daytime;

while {true} do

	{

	if ((daytime > ENV_ZEIT_ABEND) or (daytime < ENV_ZEIT_MORGEN)) then

		{

		if (_WarteBeiNacht == 0) then

			{

			if (daytime < ENV_ZEIT_MORGEN) then

				{

				skiptime (floor(ENV_ZEIT_MORGEN - daytime));

				}
				else
				{

				skiptime ((floor(24 - daytime)) + ENV_ZEIT_MORGEN);

				};

			}
			else
			{

			sleep _WarteBeiNacht;

			};

		}
		else
		{

		sleep _WarteBeiTag;

		};

	format['skiptime %1', _SkiptDuration] call broadcast;
	currentTime = daytime;

	};

};

