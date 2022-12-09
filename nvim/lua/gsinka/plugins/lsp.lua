local keymap = require('gsinka.keymap')
local nnoremap = keymap.wknnoremap

require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  nnoremap('<leader>', {
    w = {
      name = 'Workspace',
      a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", 'Add workspace folder' },
      r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", 'Remove workspace folder' },
      l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", 'List workspace folders' },
      q = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", 'Workspace diagnostics' },
    },
    g = {
      name = 'LSP Definitions',
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", 'Declaration' },
      d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", 'Definitions' },
      i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", 'Implementations' },
      r = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", 'References' },
    },
    r = {
      name = 'Refactor',
      n = { "<cmd>lua vim.lsp.buf.rename()<CR>", 'Rename' },
    },
    c = {
      name = 'Code',
      a = { "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", 'Code actions' },
    },
    D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", 'Type definition' },
    e = { "<cmd>lua vim.diagnostic.open_float()<CR>", 'Open float' },
    q = { "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>", 'Buffer diagnostics' },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", 'Format' },
  })

  nnoremap('', {
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", 'Hover' },
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

nvim_lsp.gopls.setup(config())

nvim_lsp.yamlls.setup(config())

-- nvim_lsp.intelephense.setup(config())
nvim_lsp.phpactor.setup(config())

nvim_lsp.cssls.setup(config())

nvim_lsp.eslint.setup(config())

nvim_lsp.html.setup(config())

nvim_lsp.emmet_ls.setup(config())

nvim_lsp.jsonls.setup(config({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  }
}))

require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.trail_space.with({}),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.pint,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })
