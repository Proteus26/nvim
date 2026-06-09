vim.pack.add({
  'https://github.com/nvzone/volt',
  'https://github.com/nvzone/floaterm',
})

require('floaterm').setup({
  border = true,
  size = { h = 60, w = 70 },

  mappings = { sidebar = nil, term = nil },

  terminals = {
    { name = "Terminal" },
  },
})
