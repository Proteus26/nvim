vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },

    {
        src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
    }
})

vim.g.neo_tree_remove_legacy_commands = true

local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then return end

neotree.setup({
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    buffers = {
        show_unloaded = true
    },
    sources = { "filesystem", "buffers", "git_status" },
    source_selector = {
        winbar = true,
        content_layout = "center",
        sources = {
            { source = "filesystem",  display_name = " File" },
            { source = "buffers",     display_name = "󰈔 Bufs" },
            { source = "git_status",  display_name = "󰊢 Git" },
            { source = "diagnostics", display_name = "󰒡 Diagnostic" },
        },
    },
    default_component_configs = {
        indent = { padding = 0 },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            folder_empty_open = "",
            default = "󰈔",
        },
        modified = { symbol = "" },
        git_status = {
            symbols = {
                added = "",
                deleted = "",
                modified = "",
                renamed = "➜",
                untracked = "★",
                ignored = "◌",
                unstaged = "✗",
                staged = "✓",
                conflict = "",
            },
        },
    },
    commands = {
        system_open = function(state)
            local filepath = state.tree:get_node():get_id()
            vim.ui.open(filepath)
        end,
        
        parent_or_close = function(state)
            local node = state.tree:get_node()
            if (node.type == "directory" or node:has_children()) and node:is_expanded() then
                state.commands.toggle_node(state)
            else
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end
        end,
        
        child_or_open = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" or node:has_children() then
                if not node:is_expanded() then
                    state.commands.toggle_node(state)
                else
                    require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                end
            else
                state.commands.open(state)
            end
        end,
        
        copy_selector = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local results = {
                e = { val = modify(filename, ":e"), msg = "Extension only" },
                f = { val = filename, msg = "Filename" },
                F = { val = modify(filename, ":r"), msg = "Filename w/o extension" },
                h = { val = modify(filepath, ":~"), msg = "Path relative to Home" },
                p = { val = modify(filepath, ":."), msg = "Path relative to CWD" },
                P = { val = filepath, msg = "Absolute path" },
            }

            local messages = {
                { "\nChoose to copy to clipboard:\n", "Normal" },
            }
            for i, result in pairs(results) do
                if result.val and result.val ~= "" then
                    vim.list_extend(messages, {
                        { ("%s."):format(i), "Identifier" },
                        { (" %s: "):format(result.msg) },
                        { result.val, "String" },
                        { "\n" },
                    })
                end
            end
            vim.api.nvim_echo(messages, false, {})
            local result = results[vim.fn.getcharstr()]
            if result and result.val and result.val ~= "" then
                vim.notify("Copied: " .. result.val)
                vim.fn.setreg("+", result.val)
            end
        end,
        
        find_in_dir = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require("telescope.builtin").find_files {
                cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
            }
        end,
    },
    window = {
        width = 30,
        mappings = {
            ["<space>"] = false,
            ["<S-CR>"] = "system_open",
            ["[b"] = "prev_source",
            ["]b"] = "next_source",
            F = "find_in_dir",
            O = "system_open",
            Y = "copy_selector",
            h = "parent_or_close",
            l = "child_or_open",
        },
    },
    filesystem = {
        follow_current_file = {
            enabled = true,
        },
        hijack_netrw_behavior = "disabled",
        use_libuv_file_watcher = true,
    },
    event_handlers = {
        {
            event = "neo_tree_buffer_enter",
            handler = function(_) vim.opt_local.signcolumn = "auto" end,
        },
    },
})
