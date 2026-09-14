vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

local no_autoformat = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
}

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cuda = { "clang-format" },
		go = { "goimports", "gofmt" },
		python = { "ruff_organize_imports", "ruff_format" },
		rust = { "rustfmt" },
		java = { "google-java-format" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		zsh = { "shfmt" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = function(bufnr)
		if vim.tbl_contains(no_autoformat, vim.bo[bufnr].filetype) then
			return nil
		end
		return {
			timeout_ms = 1000,
			lsp_format = "fallback",
		}
	end,
})
