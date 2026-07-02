local plugins = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}

for _, repo in ipairs(plugins) do
    vim.pack.add({ { src = "https://github.com/" .. repo } })
end

require("mason").setup()

vim.diagnostic.config({
    signs = false,

    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = function(diagnostic)
            if diagnostic.severity == vim.diagnostic.severity.ERROR then
                return '󰅘'
            elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                return '󰳤'
            else
                return '󱗝'
            end
        end,
    },

    underline = true,
})
