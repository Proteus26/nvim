vim.pack.add({
    { src = "https://github.com/saghen/blink.lib", branch = "main" },
    { src = "https://github.com/rafamadriz/friendly-snippets", branch = "main" },
    {
        src = "https://github.com/saghen/blink.cmp",
        branch = "v2",
        build = function()
            require('blink.cmp').build():wait(60000)
        end,
    },
})

local blink = require("blink.cmp")

blink.setup({
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    cmdline = {
        enabled = true,
    },
    signature = { enabled = true },
    completion = {
        trigger = {
            show_on_insert_on_trigger_character = true,
        },
        menu = {
            auto_show = true,
            draw = {
                columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
            },
        },
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        ghost_text = { enabled = true },
    },
    keymap = {
        preset = 'super-tab',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    },
    fuzzy = { 
		implementation = "lua",
	},
})
