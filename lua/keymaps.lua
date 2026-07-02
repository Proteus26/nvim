local map = vim.keymap.set

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle reveal_force_cwd<CR>", { desc = "Toggle Explorer" })

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search text in project" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find open buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Search keymaps" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Search diagnostics" })
map("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "Resume last picker" })

-- Yazi / floaterm
map("n", "<leader>-", "<cmd>Yazi<CR>", { desc = "Open Yazi at file" })
map("n", "<leader>cw", "<cmd>Yazi cwd<CR>", { desc = "Open Yazi at cwd" })
map("n", "<leader>tt", "<cmd>FloatermToggle<CR>", { desc = "Toggle floating terminal" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate Right" })

-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffers
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bD", "<cmd>%bd|e#|bd#<CR>", { desc = "Delete all other buffers" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        map("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        map("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
        map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "List references" }))
        map("n", "gt", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
        map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover docs" }))
        map("n", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))

        map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        map({ "n", "v" }, "<leader>cf", function()
            local ok, conform = pcall(require, "conform")
            if ok then
                conform.format({ async = true, lsp_format = "fallback" })
            else
                vim.lsp.buf.format({ async = true })
            end
        end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))

        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
            vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
            vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
        map("n", "<leader>wl", function()
            vim.print(vim.lsp.buf.list_workspace_folders())
        end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))
    end,
})

-- Diagnostics
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
map("n", "<leader>db", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Buffer diagnostics list" })

-- QoL
map("v", "<", "<gv", { desc = "Indent left, keep selection" })
map("v", ">", ">gv", { desc = "Indent right, keep selection" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down, centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up, centered" })
map("n", "n", "nzzzv", { desc = "Next search result, centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result, centered" })

map("v", "<leader>p", '"_dP', { desc = "Paste without yanking replaced text" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "J", "mzJ`z", { desc = "Join line, keep cursor position" })

-- Save / quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>W", "<cmd>wa<CR>", { desc = "Save all files" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })

-- Terminal
map("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Terminal in horizontal split" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Terminal in vertical split" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("UserTerminalSplits", { clear = true }),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.cmd.startinsert()
    end,
})
