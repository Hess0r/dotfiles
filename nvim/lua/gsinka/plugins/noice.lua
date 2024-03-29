require('noice').setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
    cmdline_output_to_split = false,
  },
  cmdline = {
    view = 'cmdline',
    format = {
      search_down = {
        view = 'cmdline',
      },
      search_up = {
        view = 'cmdline',
      },
    },
  },
  routes = {
    {
      filter = {
        event = 'msg_show',
        kind = '',
        -- find = 'written',
      },
      opts = { skip = true },
    },
  },
  commands = {
    all = {
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {},
    }
  },
  -- messages = {
  --   enabled = false,
  -- }
})
