vim.pack.add({
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" }
})

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

lualine.setup({
    options = {
        theme = "auto",
        globalstatus = true,
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { "NvimTree", "neo-tree", "dashboard", "alpha" },
    },
    sections = {
        lualine_a = {
            {
                "mode",
                icon = "",
                separator = { left = "", right = "" },
                right_padding = 2,
            },
        },
        lualine_b = {
            { "branch", icon = "" },
            { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = { modified = "", readonly = "" },
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
            },
            { "fileformat", symbols = { unix = "" } },
            { "filetype", icon_only = true },
        },
        lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 2 } },
        },
        lualine_z = {
            {
                "location",
                separator = { left = "", right = "" },
				fmt = function(str) 
                    return str:match("^%s*(.-)%s*$") or str
                end,
                padding = { left = 1, right = 1 },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "neo-tree", "quickfix", "fugitive" },
})
