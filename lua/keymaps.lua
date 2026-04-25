vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal_force_cwd<CR>", { desc = "Toggle Explorer" })

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = "Find Files" })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = "Search text in project" })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = "Find open buffers" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate Left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate Right" })
