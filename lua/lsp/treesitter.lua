vim.pack.add({
    { 
        src = "https://github.com/nvim-treesitter/nvim-treesitter", 
        branch = "main" 
    },
})

local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

treesitter_configs.setup({
    ensure_installed = { 
        "c", 
	"cpp", 
	"cuda", 
	"python", 
	"r", 
	"fortran", 
	"verilog", 
	"lua", 
	"vim", 
	"vimdoc", 
	"query", 
	"zsh", 
	"go", "gomod", "gosum", "gowork",
	"hyprlang"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
})

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
  extension = {
        cu = "cuda",
        cuh = "cuda",
    },
})
