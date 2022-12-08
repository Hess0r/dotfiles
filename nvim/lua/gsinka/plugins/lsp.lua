local keymap = require('gsinka.keymap')
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
local opts = keymap.opts

require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  nnoremap('gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
  nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  nnoremap('gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
  nnoremap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  nnoremap('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  nnoremap('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  nnoremap('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  nnoremap('<space>wq', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
  nnoremap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  nnoremap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  nnoremap('<space>ca', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
  nnoremap('gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  nnoremap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  nnoremap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  nnoremap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- nnoremap('<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  nnoremap('<space>q', '<cmd>lua require("telescope.builtin").diagnostics({bufnr=0})<CR>', opts)
  nnoremap('<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

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

nvim_lsp.intelephense.setup(config())

nvim_lsp.cssls.setup(config())

nvim_lsp.eslint.setup(config())

nvim_lsp.html.setup(config())

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
  },
})

require('mason-null-ls').setup({ automatic_installation = true })
