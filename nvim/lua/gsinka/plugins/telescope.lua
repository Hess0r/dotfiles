local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    path_display = { truncate = 1 },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-r>"] = actions.delete_buffer,
        },
        n = {
          ["<c-r>"] = actions.delete_buffer,
        }
      }
    }
  }
})
