local plugins = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}

for _, repo in ipairs(plugins) do
    vim.pack.add({ { src = "https://github.com/" .. repo } })
end

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()

mason_lspconfig.setup({
    -- ensure_installed = { "clangd", "pyright", "gopls" },
    -- automatic_installation = true,
})

local capabilities = require('blink.cmp').get_lsp_capabilities()

--[[
local servers = { "clangd", "pyright", "gopls" }
for _, lsp in ipairs(servers) do
    if lsp == "clangd" then
        lspconfig[lsp].setup({
            capabilities = capabilities,
            cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" }
        })
    else
        lspconfig[lsp].setup({
            capabilities = capabilities,
        })
    end
end
--]]
