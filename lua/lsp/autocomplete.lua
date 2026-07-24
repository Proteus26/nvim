vim.pack.add({ 'https://github.com/saghen/blink.lib', 'https://github.com/saghen/blink.cmp' })

require('blink.cmp').setup({
	keymap = { preset = 'super-tab' },
	fuzzy = { implementation = "prefer_rust" }
})
