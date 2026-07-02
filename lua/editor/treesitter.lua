vim.pack.add({
    { src = "https://github.com/neovim-treesitter/nvim-treesitter", branch = "main" },
})

local ts_ok, ts = pcall(require, "nvim-treesitter")
if not ts_ok then return end

local parsers = {
    "c", "cpp", "cuda", "python", "r", "fortran", "lua", "vim", "vimdoc", "query", "zsh", "go", "gomod", "gosum",
    "gowork",
}

ts.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
    callback = function(args)
        if vim.bo[args.buf].buftype ~= "" then return end

        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        pcall(function() ts.install({ lang }):wait(60000) end)

        if pcall(vim.treesitter.start, args.buf, lang) then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldenable = false
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
    extension = {
        cu = "cuda",
        cuh = "cuda",
    },
})
