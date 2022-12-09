local dap = require('dap')
local nvim_dap = require('mason-nvim-dap')

nvim_dap.setup({
    ensure_installed = { 'php' },
    automatic_setup = true,
})

nvim_dap.setup_handlers({
    function (source_name)
      require('mason-nvim-dap.automatic_setup')(source_name)
    end,
    php = function(source_name)
      local exe_path = vim.fn.stdpath('data') .. '/mason/bin/php-debug-adapter'
      dap.adapters.php = {
        type = 'executable',
        command = exe_path
      }
      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9003
        }
      }
    end
  })
