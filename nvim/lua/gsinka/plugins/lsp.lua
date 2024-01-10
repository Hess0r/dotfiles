local wk = require('which-key')

require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = { exclude = { "hls" } } })

local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  wk.register({
    w = {
      name = 'Workspace',
      a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", 'Add workspace folder' },
      r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", 'Remove workspace folder' },
      l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", 'List workspace folders' },
      q = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", 'Workspace diagnostics' },
    },
    r = {
      name = 'Refactor',
      n = { "<cmd>lua vim.lsp.buf.rename()<CR>", 'Rename' },
    },
    c = {
      name = 'Code',
      a = { "<cmd>CodeActionMenu<CR>", 'Code actions' },
    },
    D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", 'Type definition' },
    e = { "<cmd>lua vim.diagnostic.open_float()<CR>", 'Open float' },
    q = { "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>", 'Buffer diagnostics' },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", 'Format' },
  }, { prefix = '<leader>' })

  wk.register({
    c = {
      name = 'Code',
      a = { "<cmd>CodeActionMenu<CR>", 'Code actions' },
    },
  }, { prefix = '<leader>', mode = 'v' })

  wk.register({
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", 'Hover' },
    g = {
      name = 'LSP Definitions',
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", 'Declaration' },
      d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", 'Definitions' },
      i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", 'Implementations' },
      r = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", 'References' },
    },
    ['<C-k>'] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", 'Signature help' },
    ['[d'] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", 'Goto prev diagnostic' },
    [']d'] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", 'Goto next diagnostic' },
  })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local function config(_config)
  return vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }, _config or {})
end

nvim_lsp.tsserver.setup(config())

nvim_lsp.bashls.setup(config())

nvim_lsp.dockerls.setup(config())

nvim_lsp.gopls.setup(config({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
}))

nvim_lsp.yamlls.setup(config())

nvim_lsp.intelephense.setup(config({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
}))

nvim_lsp.cssls.setup(config())

nvim_lsp.html.setup(config())

nvim_lsp.emmet_ls.setup(config({
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'blade' },
}))

nvim_lsp.tailwindcss.setup(config())

nvim_lsp.prismals.setup(config())

nvim_lsp.jsonls.setup(config({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  }
}))

nvim_lsp.lua_ls.setup(config({
  single_file_support = true,
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      }
    }
  }
}))

nvim_lsp.hls.setup(config())

nvim_lsp.elmls.setup(config())

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js', '.eslintrc.json' })
      end,
    }),
    -- null_ls.builtins.diagnostics.phpstan,

    null_ls.builtins.code_actions.gitsigns,

    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.pint,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })
