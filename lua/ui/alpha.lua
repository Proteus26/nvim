vim.pack.add({ { src = "https://github.com/goolord/alpha-nvim" } })

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then return end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	         "                                                                       ",
         "                                                                       ",
         "                                                                       ",
         "                                                                       ",
         "                                                                       ",
         "                                                                       ",
         "                                                                     ",
         "       ████ ██████           █████      ██                     ",
         "      ███████████             █████                             ",
         "      █████████ ███████████████████ ███   ███████████   ",
         "     █████████  ███    █████████████ █████ ██████████████   ",
         "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
         "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
         " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
         "                                                                       ",
         "                                                                       ",
         "                                                                       ",
         "                                                                       ",
         "                                                                       ",
         "                                                                       ",
}

vim.cmd("highlight DashboardHeader guifg=#F7778F")
dashboard.section.header.opts.hl = "DashboardHeader"

dashboard.section.buttons.val = {
    dashboard.button("n", "  New File", "<cmd>ene <CR>"),
    dashboard.button("e", "󰈞  Recent Files", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("p", "󰉋  Projects", "<cmd>Telescope projects<CR>"),
    dashboard.button("q", "󰈆  Quit Neovim", "<cmd>qa<CR>"),
}

alpha.setup(dashboard.opts)
