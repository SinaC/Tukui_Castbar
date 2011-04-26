local addon, ns = ...

ns.config={
    ["separateplayer"] = true, -- separate player castbar
    ["separatetarget"] = true, -- separate target castbar
    ["separatefocus"] = true, -- separate focus castbar
    ["separatefocustarget"]  = true, -- separate focustarget castbar
    player = {
--test
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
