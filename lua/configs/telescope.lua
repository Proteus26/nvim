local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function project_picker()
    local projects_file = vim.fn.stdpath("data") .. "/projects.json"
    local projects = {}

    if vim.fn.filereadable(projects_file) == 1 then
        local ok, data = pcall(vim.fn.json_decode, vim.fn.readfile(projects_file))
        if ok and data then
            projects = data
        end
    end

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values

    pickers.new({}, {
        prompt_title = "Projects",
        finder = finders.new_table({
            results = projects,
            entry_maker = function(entry)
                return {
                    value = entry.path,
                    display = entry.name .. " (" .. entry.path .. ")",
                    ordinal = entry.name,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd("cd " .. selection.value)
                require("telescope.builtin").find_files()
            end)
            return true
        end,
    }):find()
end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-p>"] = function() project_picker() end,
            },
            n = {
                ["<C-p>"] = function() project_picker() end,
            },
        },
    },
    extensions = {
    },
})

vim.api.nvim_create_user_command("Projects", project_picker, {})
