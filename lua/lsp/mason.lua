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

vim.diagnostic.config({
  signs = false,

  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = function(diagnostic)
      -- Use a cross for errors
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return '󰅘' 
      -- Use an exclamation mark for warnings
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return '󰳤' 
      -- Fallback for info and hints (you can change this)
      else
        return '󱗝' 
      end
    end,
  },
  
  underline = true,
})
