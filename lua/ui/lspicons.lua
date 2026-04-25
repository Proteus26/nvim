if vim.g.fallback_icons_enabled then return end

vim.pack.add({
    { src = "https://github.com/onsails/lspkind.nvim" }
})

local status_ok, lspkind = pcall(require, "lspkind")
if not status_ok then return end

lspkind.init({
    mode = "symbol",
    symbol_map = {
        Array = "󰅪",
        Boolean = "⊨",
        Class = "󰌗",
        Constructor = "",
        Copilot = "",
        Key = "󰌆",
        Namespace = "󰅪",
        Null = "NULL",
        Number = "#",
        Object = "󰀚",
        Package = "󰏗",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "󰀬",
        TypeParameter = "󰊄",
        Unit = "",
    },
})
