// F3 - Disable Thermals
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_allowedList", "_allowedTypes", "_allowedUnits"];

// SET KEY VARIABLES
// Using the arguments passed to the script, we first define some local variables.

params [["_allowedList", [], [[]]]];

// INTERPRET RESTRICTED ARRAY
// Loop through the array containing the allowed classes and units and split them into two

_allowedTypes = [];
_allowedUnits = [];
{
  if (_x isEqualType "") then {_allowedTypes pushBack _x};
  if (_x isEqualType objNull) then {_allowedUnits pushBack _x};
} forEach _allowedList;

// PERFORM CHECKS
// Check if any vehicle is one of the allowed vehicles or in the allowed types, if not, disable their thermals.

{
	private _vehicleToCheck = _x;

	if (_vehicleToCheck in _allowedUnits || {{_vehicleToCheck isKindOf _x} count _allowedTypes > 0}) then {
		// This is an allowed vehicle, ignore it
	} else {
		_vehicleToCheck disableTIEquipment true;
	}
} foreach vehicles;