require("lint").linters_by_ft = {
    python = { "flake8" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    dockerfile = { "hadolint" },
    sh = { "shellcheck" },
    bash = { "shellcheck" },
    sql = { "sqlfluff" },
    fish = { "fish" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
