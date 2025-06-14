return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
        -- "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local header = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        dashboard.section.header.val = header

        dashboard.section.buttons.val = {
            dashboard.button("e", "   File explorer", ":NvimTreeToggle <CR>"),
            dashboard.button("f", "   Find file", ":Telescope find_files previewer=false<CR>"),
            dashboard.button("w", "󰱼   Find word", ":Telescope live_grep<CR>"),
            dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "   Config", ":e $MYVIMRC <CR>"),
            dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
            dashboard.button("m", "󱌣   Mason", ":Mason<CR>"),
            dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
        }

        -- set highlight groups
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ffffff" })
        dashboard.section.header.opts.hl = "DashboardHeader"

        vim.api.nvim_set_hl(0, "DashboardFooterNormal", { fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "DashboardFooterOrange", { fg = "#ffa500" })
        vim.api.nvim_set_hl(0, "DashboardFooterRed", { fg = "#D9534F" })

        vim.api.nvim_set_hl(0, "DashboardButtonKey", { fg = "#ffffff", bold = true })
        vim.api.nvim_set_hl(0, "DashboardButtonText", { fg = "#ffffff" })

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl_shortcut = "DashboardButtonKey"
            button.opts.hl = "DashboardButtonText"
        end

        dashboard.opts.opts.noautocmd = true

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local plugins = require("lazy").stats()
                local time = (math.floor(plugins.startuptime * 100) / 100)
                local footer_hl = "DashboardFooterNormal"

                if time > 60 then
                    footer_hl = "DashboardFooterRed"
                elseif time > 50 then
                    footer_hl = "DashboardFooterOrange"
                end

                dashboard.section.footer.opts.hl = footer_hl

                dashboard.section.footer.val = {
                    " ",
                    " ",
                    " ",
                    "󱐌 " .. plugins.count .. " plugins loaded in " .. time .. " ms",
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
