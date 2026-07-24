vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { lsp_format = "first" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cuda = { "clang-format" },
		go = { "gofmt", "goimports" },
		python = { "ruff_format" },
		nix = { lsp_format = "first" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
