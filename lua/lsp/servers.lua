vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

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

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--query-driver=/nix/store/**/bin/*",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
})

local servers = { "clangd", "gopls", "pyright", "lua_ls", "nil_ls", "rust_analyzer" }
vim.lsp.enable(servers)
