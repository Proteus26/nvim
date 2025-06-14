return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },

    {
        "stevearc/conform.nvim",
        event = 'BufWritePre',
        config = function()
            require "configs.conform"
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.lint"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- LSP servers
                "clangd",
                "dockerfile-language-server",
                "gopls",
                "html-lsp",
                "typescript-language-server",
                "dart-debug-adapter",
                "lua-language-server",
                "tailwindcss-language-server",
                "rust-analyzer",
                "verible",
                "jdtls",
                "cmake-language-server",
                "taplo",
                "json-lsp",
                "lemminx",
                "pyright",
                "bash-language-server",
                "hyprls",
                "sqlls",

                "stylua",
                "black",
                "prettierd",
                "rustfmt",
                "gofmt",
                "clang-format",
                "google-java-format",
                "shfmt",
                "sql-formatter",

                "flake8",
                "eslint_d",
                "hadolint",
                "shellcheck",
                "sqlfluff",
            },
        },
    },

    {
        "b0o/schemastore.nvim",
        lazy = true,
    },
}
