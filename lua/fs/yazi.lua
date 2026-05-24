vim.pack.add({
    { src = "https://github.com/mikavilpas/yazi.nvim" }
})

local yazi = require("yazi")

yazi.setup({
    open_for_directories = true,
    floating_window_scaling_factor = 0.71,
    yazi_floating_window_winblend = 0,
})
