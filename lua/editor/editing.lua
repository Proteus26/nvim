vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.comment" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.indentscope" },
})

require("mini.comment").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.indentscope").setup({
	symbol = "│",
	options = {
		try_as_border = true,
	},
})

require("mini.indentscope").setup({
	symbol = "│",
	options = {
		try_as_border = true,
	},
})

local function set_indentscope_hl()
	local ok, palette = pcall(require, "catppuccin.palettes")
	if ok then
		local colors = palette.get_palette()
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = colors.surface2, bg = "none" })
	end
end

set_indentscope_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("MiniIndentscopeHl", { clear = true }),
	callback = set_indentscope_hl,
})
