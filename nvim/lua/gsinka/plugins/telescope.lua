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

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')
-- require('telescope').load_extension('dap')
