_initFileNames = [];

{

_filename = _x call INV_getitemFilename;
_item     = _x call INV_getitemScriptName;

if ((_filename != "") and (!(_filename in _initFileNames))) then

	{

	_initFileNames = _initFileNames + [_filename];
	["init", _item] execVM format["%1", _filename];

	};

} forEach INV_AlleItemsArray;
