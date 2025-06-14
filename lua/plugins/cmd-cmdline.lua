return {
    {
        "hrsh7th/cmp-cmdline",
        dependencies = { "hrsh7th/nvim-cmp" },
        event = "CmdlineEnter",
        config = function()
            require("configs.cmp-cmdline")
        end,
    }
}
