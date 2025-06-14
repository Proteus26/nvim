return {
    {
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            require "configs.notify"
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require "configs.telescope"
        end,
    },

    {
        "ahmedkhalf/project.nvim",
        lazy = false,
        config = function()
            require("project_nvim").setup({
                detection_methods = { "lsp", "pattern" },

                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },

                show_hidden = false,

                silent_chdir = true,

                datapath = vim.fn.stdpath("data"),
            })

            require('telescope').load_extension('projects')
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                respect_buf_cwd = true,
                update_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
            })
        end,
    },

    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    },

    {
        "folke/which-key.nvim",
        lazy = false,
        config = function()
            require("which-key").setup({
                plugins = {
                    marks = true,
                    registers = true,
                    spelling = {
                        enabled = true,
                        suggestions = 20,
                    },
                },
            })
        end,
    },
}
