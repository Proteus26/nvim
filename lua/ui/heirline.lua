vim.pack.add({
    { src = "https://github.com/zeioth/heirline-components.nvim" },
    { src = "https://github.com/rebelot/heirline.nvim" }
})

local status_ok_heirline, heirline = pcall(require, "heirline")
local status_ok_comp, lib = pcall(require, "heirline-components.all")
if not (status_ok_heirline and status_ok_comp) then return end

pcall(require("heirline-components").setup)

local heirline_opts = {
    opts = {
        disable_winbar_cb = function(args) -- Avoid showing winbar on greeters/menus
            local is_disabled = not require("heirline-components.buffer").is_valid(args.buf) or
                lib.condition.buffer_matches({
                    buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
                    filetype = {
                        "NvimTree",
                        "neo%-tree",
                        "dashboard",
                        "Outline",
                        "aerial",
                        "rnvimr",
                        "yazi"
                    },
                }, args.buf)
            return is_disabled
        end,
    },
    tabline = {
		lib.component.tabline_conditional_padding(),
        lib.component.tabline_buffers(),
        lib.component.fill { hl = { bg = "tabline_bg" } },
        lib.component.tabline_tabpages()
    },
    winbar = {
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false,
        {
            condition = function() return not lib.condition.is_active() end,
            {
                lib.component.neotree(),
                lib.component.compiler_play(),
                lib.component.fill(),
                lib.component.compiler_redo(),
                lib.component.aerial(),
            },
        },
        {
            lib.component.neotree(),
            lib.component.compiler_play(),
            lib.component.fill(),
            lib.component.breadcrumbs(),
            lib.component.fill(),
            lib.component.compiler_redo(),
            lib.component.aerial(),
        }
    },
    statuscolumn = { 
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        lib.component.foldcolumn(),
        lib.component.numbercolumn(),
        lib.component.signcolumn(),
    }
}

lib.init.subscribe_to_events()
heirline.load_colors(lib.hl.get_colors())
heirline.setup(heirline_opts)
