--[[ Build Island ModKit by Toybox
roblox.com/groups/7712711/Toybox-Development#!/about
]]

local mymod = {
	description = "Goofy Melee Combat";
	credit = "nicholast013";
	v = 0.1;
}

--[[ This kit contains objects named "Gear" and "Items"

The children of "Items" will be imported into the Stamper Tool when
the mod is loaded. Some examples have been provided. 

The children of "Gear" will be parented into Lighting when the mod is
loaded, where they will be accessible via the give/ admin command

Other objects may be added in the future

]]

-- This function is called when the mod is loaded
function mymod.start(mods)
	--[[ mods is a table that contains all of the loaded mods
	ex:
	local yourmod = mods["#yourmod"]
	local description = yourmod.description
	]]
end

--[[ You can define code in this module outside of the start function,
as well as member variables for your module, but any yielding code
outside of the start function may cause issues in the server loading
your mod.
]]
return mymod

