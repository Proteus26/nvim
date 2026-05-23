vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" }
})

require("gitsigns").setup({
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },

  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 500,
    ignore_whitespace = false,
  },

  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end, { desc = 'Next Git hunk' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end, { desc = 'Previous Git hunk' })

    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage selected hunk' })
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset selected hunk' })
    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage entire buffer' })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset entire buffer' })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk inline' })
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, { desc = 'Blame line (full popup)' })
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle inline line blame' })
    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff against index' })
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = 'Diff against last commit' })

    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk text object' })
  end
})
