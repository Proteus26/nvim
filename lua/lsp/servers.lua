local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = { "clangd", "gopls", "pyright", "lua_ls" }

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
        },
    },
})

vim.lsp.enable(servers)
