vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.comment" },
    { src = "https://github.com/nvim-mini/mini.surround" },
    { src = "https://github.com/nvim-mini/mini.ai" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
})

require("mini.comment").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require('mini.pairs').setup()
