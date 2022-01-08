-- SETS
vim.opt.number = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.errorbells = false
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
-- soptt guicursor=
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 20
vim.opt.signcolumn = 'yes'
vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.shortmess = vim.o.shortmess .. 'c'
vim.opt.updatetime = 50
vim.opt.wildignore = vim.o.wildignore .. '*/tmp/*'
vim.opt.wildignore = vim.o.wildignore .. '*/vendor/*'
vim.opt.wildignore = vim.o.wildignore .. '*/node_modules/*'
vim.opt.wildmenu = true
vim.opt.list = true
vim.opt.listchars = 'tab:» ,eol:↲'
vim.opt.completeopt = 'menu,menuone,noselect'

-- PLUGINS
local vim_plug_path = vim.fn.stdpath'data' .. '/site/autoload/plug.vim'

if vim.fn.empty(vim.fn.glob(vim_plug_path)) > 0 then
  vim.fn.execute('!curl -fLo ' .. vim_plug_path .. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
end

local Plug = vim.fn['plug#']

vim.call('plug#begin')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'joshdick/onedark.vim'
  Plug('junegunn/fzf', { ['do'] = function() vim.call('fzf#install') end })
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'neovim/nvim-lspconfig'
  Plug 'tpope/vim-commentary'
  Plug('nvim-treesitter/nvim-treesitter', {['do'] = function() vim.cmd(':TSUpdate') end})
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'b0o/schemastore.nvim'
  Plug 'onsails/lspkind-nvim'
  Plug 'sbdchd/neoformat'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'airblade/vim-gitgutter'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'liuchengxu/vim-which-key'
vim.call('plug#end')

-- COLORS
vim.cmd('colorscheme onedark')
vim.g.airline_theme = 'onedark'

-- ICONS
require'nvim-web-devicons'.setup{}

-- KEYMAPPINGS
vim.g.mapleader=" "

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>ve', [[<cmd>e $MYVIMRC<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader><CR>', [[<cmd>source $MYVIMRC<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>', [[<cmd>WhichKey '<Space>'<CR>]], opts)
vim.api.nvim_set_keymap('v', '<leader>', [[<cmd>WhichKeyVisual '<Space>'<CR>]], opts)

vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tagsopts)
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sm', [[<cmd>lua require('telescope.builtin').marks()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>Neoformat<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gd', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], opts)

-- TREESITTER
local nvim_treesitter = require'nvim-treesitter.configs'
nvim_treesitter.setup {
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  -- indent = {
  --   enable = true,
  --   disable = { "yaml" },
  -- },
  -- textobjects = {
  --   select = {
  --     enable = true,
  --     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
  --     keymaps = {
  --       -- You can use the capture groups defined in textobjects.scm
  --       ['af'] = '@function.outer',
  --       ['if'] = '@function.inner',
  --       ['ac'] = '@class.outer',
  --       ['ic'] = '@class.inner',
  --     },
  --   },
  --   move = {
  --     enable = true,
  --     set_jumps = true, -- whether to set jumps in the jumplist
  --     goto_next_start = {
  --       [']m'] = '@function.outer',
  --       [']]'] = '@class.outer',
  --     },
  --     goto_next_end = {
  --       [']M'] = '@function.outer',
  --       [']['] = '@class.outer',
  --     },
  --     goto_previous_start = {
  --       ['[m'] = '@function.outer',
  --       ['[['] = '@class.outer',
  --     },
  --     goto_previous_end = {
  --       ['[M'] = '@function.outer',
  --       ['[]'] = '@class.outer',
  --     },
  --   },
  -- },
  ensure_installed = "maintained",
}

-- LSP
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

--local sumneko_root_path = "/home/gsinka/.config/nvim/lua-language-server"
local sumneko_root_path = vim.fn.stdpath'data' .. "/site/lua-language-server"

local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function config(_config)
  return vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }, _config or {})
end

-- local servers = { 'tsserver', 'bashls', 'dockerls', 'gopls', 'yamlls', 'intelephense' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     },
--     capabilities = capabilities
--   }
-- end

nvim_lsp.tsserver.setup(config())

nvim_lsp.bashls.setup(config())

nvim_lsp.dockerls.setup(config())

nvim_lsp.gopls.setup(config())

nvim_lsp.yamlls.setup(config())

nvim_lsp.intelephense.setup(config())

nvim_lsp.jsonls.setup(config({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  }
}))

nvim_lsp.sumneko_lua.setup(config({
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
        preloadFileSize = 200,
      },
    },
  },
}))

local pid = vim.fn.getpid()
nvim_lsp.omnisharp.setup(config({
  on_attach = on_attach,
  cmd = { vim.env.HOME .. "/.cache/omnisharp-vim/omnisharp-roslyn/run", "--languageserver", "--hostPID", tostring(pid) };
}))

-- AUTOCOMPLETE
local cmp = require'cmp'
local lspkind = require'lspkind'
local luasnip = require'luasnip'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    -- ['<Tab>'] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ['<S-Tab>'] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({with_text = true, maxwidth = 50})
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- SNIPPETS
require("luasnip/loaders/from_vscode").lazy_load()

-- WHICHKEY
vim.g.which_key_map = {
  s = {
    name = '+search',
    b = 'cur buf fuzzy find',
    d = 'grep string',
    f = 'find files',
    h = 'help tags',
    m = 'marks',
    o = 'document symbols',
    p = 'live grep',
    t = 'tags',
  },
  g = {
    name = '+git',
    c = 'commits',
    d = 'buffer history',
    s = 'status',
    b = 'branches',
  },
  h = {
    name = '+git-hunks',
    p = 'preview hunk',
    s = 'stage hunk',
    u = 'undo hunl',
  },
  e = 'show line diagnostic',
  q = 'set location list for diagnostics',
  f = 'format',
  D = 'jump to type definition',
  ['?'] = 'show previously open files',
  ['ve'] = 'edit vimrc',
  ['v'] = {name = 'which_key_ignore'},
  ['rn'] = 'rename',
  ['r'] = {name = 'which_key_ignore'},
  ['ca'] = 'coda action',
  ['c'] = {name = 'which_key_ignore'},
  ['<CR>'] = 'reload config',
}

vim.cmd([[
  highlight default link WhichKeyFloating  Pmenu
  highlight default link WhichKey          Operator
  highlight default link WhichKeySeperator DiffAdded
  highlight default link WhichKeyGroup     Identifier
  highlight default link WhichKeyDesc      Function

  autocmd! FileType which_key
  autocmd  FileType which_key set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
]])

vim.call('which_key#register', '<Space>', 'g:which_key_map')
