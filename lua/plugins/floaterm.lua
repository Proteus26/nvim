return {
    "nvzone/floaterm",
    event = "VeryLazy",
    opts = function()
        local opts = require("configs.floaterm").opts
        opts.border = true
        return opts
    end,
}
