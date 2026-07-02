vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
    { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
    { src = "https://github.com/nvim-neotest/nvim-nio" },
    { src = "https://github.com/leoluz/nvim-dap-go" },
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup()
require("dap-go").setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "dap" },
}

dap.configurations.cpp = {
    {
        name = "Launch (gdb)",
        type = "gdb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
}
dap.configurations.c = dap.configurations.cpp

local map = vim.keymap.set
map("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
map("n", "<F10>", dap.step_over, { desc = "Debug: Step over" })
map("n", "<F11>", dap.step_into, { desc = "Debug: Step into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: Step out" })
map("n", "<leader>Db", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
map("n", "<leader>Du", dapui.toggle, { desc = "Debug: Toggle UI" })
