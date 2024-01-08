return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
      'jose-elias-alvarez/null-ls.nvim',
      'jayp0521/mason-null-ls.nvim',
      { 'j-hui/fidget.nvim', opts = {}, tag = 'legacy' },
      {
        'folke/neodev.nvim',
        config = function()
          require('neodev').setup()
        end,
      },
    },
    config = function()
      require('gsinka.plugins.lsp')
    end,
  },

  {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  },
};
