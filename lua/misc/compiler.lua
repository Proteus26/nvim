vim.pack.add({
    { src = "https://github.com/stevearc/overseer.nvim" },
    { src = "https://github.com/Zeioth/compiler.nvim" },
})

require("overseer").setup()
require("compiler").setup()

vim.keymap.set("n", "<leader>rr", "<cmd>CompilerOpen<CR>", { desc = "Open compiler menu" })
vim.keymap.set("n", "<leader>rt", "<cmd>CompilerToggleResults<CR>", { desc = "Toggle compiler results" })
vim.keymap.set("n", "<leader>rs", "<cmd>CompilerStop<CR>", { desc = "Stop compiler task" })
