vim.pack.add({
    { src = "https://github.com/mikavilpas/yazi.nvim" }
})

local status_ok, yazi = pcall(require, "yazi")
if not status_ok then return end

yazi.setup({
    open_for_directories = true,
    floating_window_scaling_factor = 0.71,
    yazi_floating_window_winblend = 0,
})
