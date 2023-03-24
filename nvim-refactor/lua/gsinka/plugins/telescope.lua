local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    path_display = { truncate = 1 },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ["<c-r>"] = actions.delete_buffer,
      },
      n = {
        ["<c-r>"] = actions.delete_buffer,
      }
    },
  },
})
