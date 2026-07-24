vim.pack.add({
	'https://github.com/akinsho/toggleterm.nvim',
})

require('toggleterm').setup({
	direction = 'float',
	float_opts = {
		border = 'single',
	},
})
