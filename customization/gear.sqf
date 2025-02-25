#include "core\gearCore.sqf" //DO NOT REMOVE

// Call this with [this, "LOADOUT", (optional) "GROUPNAME"] call FNC_GearScript; in the Init field of the unit
// Example:
// [this, "SL", "1'1"] call FNC_GearScript;\
//
// more info: https://github.com/dklollol/Olsen-Framework-Arma-3/wiki/gear.sqf

//when set to false, facewear types that are whitelisted will not be removed
FW_force_remove_facewear = false;

//forces adding an item to inventory. Works only if container is specified!
FW_enableOverfill = true;

_unit call FNC_RemoveAllGear;

switch (_type) do {
	
	#include "loadouts\CTSMC.sqf" //Multicam
	//#include "loadouts\CTSMCB.sqf" //Multicam Black
	//#include "loadouts\CTSMCT.sqf" //Multicam Tropic
	//#include "loadouts\CTSATACSFG.sqf" //ATACS FG
	//#include "loadouts\CTSMCA.sqf" //Multicam Arido
	//#include "loadouts\CTSAOR1.sqf" //AOR1
	//#include "loadouts\CTSFSB.sqf" //Multicam RUS
	//#include "loadouts\CTSRUS.sqf" //Gorka RUS
};