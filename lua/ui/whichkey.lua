vim.pack.add({
    { src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup({
    preset = "modern",
    delay = 0,
    triggers = {
        { "<leader>", mode = { "n", "v" } },
    },
})

require("which-key").add({
    { "<leader>f", group = "Find (Telescope)" },
    { "<leader>h", group = "Git hunks" },
    { "<leader>s", group = "Split/window" },
    { "<leader>b", group = "Buffer" },
    { "<leader>d", group = "Diagnostics" },
    { "<leader>D", group = "Debug (DAP)" },
    { "<leader>c", group = "Code" },
    { "<leader>w", group = "Workspace" },
    { "<leader>r", group = "Run/Compiler" },
    { "<leader>t", group = "Terminal" },
})
