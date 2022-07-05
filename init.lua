local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

hand_monoid = {
	version = {1, 0, 0},
	fork = "fluxionary",

	modname = modname,
	modpath = modpath,

	S = S,

	has = {
	},

	log = function(level, messagefmt, ...)
		return minetest.log(level, ("[%s] %s"):format(modname, messagefmt:format(...)))
	end,

	dofile = function(...)
		return dofile(table.concat({modpath, ...}, DIR_DELIM) .. ".lua")
	end,
}

hand_monoid.dofile("util")
hand_monoid.dofile("settings")
hand_monoid.dofile("hand")
hand_monoid.dofile("monoid")
