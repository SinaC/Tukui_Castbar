---------------------------------------------------------------------------------------------
-- AddOn Name: Tukui_Castbar
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: Standalone Castbar for default Tukui
-- Credits: All credits goes to the original author: Krevlorne @ EU-Ulduar
---------------------------------------------------------------------------------------------

local addon, ns = ...

ns.config={
	["separateplayer"] = true, -- separate player castbar
	["separatetarget"] = true, -- separate target castbar
	["separatefocus"] = true, -- separate focus castbar
	["separatefocustarget"]  = true, -- separate focustarget castbar

	player = {
		["width"] = 250, -- width of player castbar
		["height"] = 21, -- height of player castbar
	},
	target = {
		["width"] = 250, -- width of target castbar
		["height"] = 21, -- height of target castbar
	},
	focus = {
		["width"] = 350, -- width of focus castbar
		["height"] = 26, -- height of focus castbar
	},
	focustarget = {
		["width"] = 250, -- width of focus castbar
		["height"] = 21, -- height of focus castbar
	}
}
