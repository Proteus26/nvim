vim.pack.add({
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
})

local status_ok, noice = pcall(require, "noice")
if not status_ok then return end

local enable_conceal = false

noice.setup({
	presets = {
		bottom_search = true,
		command_palette = true,
	},

	cmdline = {
		view = "cmdline_popup",
		format = {
			cmdline = { conceal = enable_conceal, icon = "" },
			search_down = { conceal = enable_conceal },
			search_up = { conceal = enable_conceal },
			filter = { conceal = enable_conceal },
			lua = { conceal = enable_conceal },
			help = { conceal = enable_conceal },
			input = { conceal = enable_conceal },
		}
	},

	messages = { enabled = false },

	lsp = {
		hover = { enabled = false },
		signature = { enabled = false },
		progress = { enabled = false },
		message = { enabled = false },
		smart_move = { enabled = false },
	},
})
