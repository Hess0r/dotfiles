" SETS
" =================
set number
" set ruler
set showmode
set showcmd
set nohlsearch
set nobackup
set noswapfile
set nowritebackup
set noerrorbells
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set guicursor=
set incsearch
set termguicolors
set scrolloff=20
set signcolumn=auto
set cmdheight=1
set hidden
set shortmess+=c
set updatetime=50
set wildignore+=*/tmp/*
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*
set wildmenu
set list
set listchars=tab:»\ ,eol:↲
" set linebreak
" =================

" PLUGINS
" =================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'neovim/nvim-lspconfig'
  Plug 'tpope/vim-commentary'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
call plug#end()

" COLORS
" =================
syntax on
colorscheme onedark
let g:airline_theme='onedark'
" =================

" ICONS
" =================
lua <<EOF
  require'nvim-web-devicons'.setup{}
EOF
" =================

" FILETYPES
" =================
filetype plugin on
" =================

" AUTOCOMMANDS
" =================
" autocmd bufwritepost init.vim source $MYVIMRC 
autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
" =================

" KEYMAPPINGS
" =================
let mapleader="\<space>"

nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <leader><CR> :source $MYVIMRC<CR>
lua <<EOF
  local opts = { noremap = true, silent = true }
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
EOF
" =================

" AUTOCOMPLETE
" =================
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
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
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    }),
    formatting = {
      format = lspkind.cmp_format({with_text = true, maxwidth = 50})
    }
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

EOF
" =================


" TREE-SITTER
" =================
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
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
  indent = {
    enable = false,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  ensure_installed = {
    "tsx",
    "php",
    "json",
    "yaml",
    "html",
    "scss",
    "bash",
    "css",
    "dockerfile",
    "go",
    "javascript",
    "jsdoc",
    "toml",
    "typescript",
    "vim",
    "lua",
    "java",
    "c_sharp",
  },
}
EOF
" =================

" LSP
" =================
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
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
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver', 'bashls', 'dockerls', 'gopls', 'yamlls', 'intelephense' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  }
end

  nvim_lsp.jsonls.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
      },
    }
  }

  local pid = vim.fn.getpid()
  nvim_lsp.omnisharp.setup {
    on_attach = on_attach,
    cmd = { vim.env.HOME .. "/.cache/omnisharp-vim/omnisharp-roslyn/run", "--languageserver", "--hostPID", tostring(pid) };
    capabilities = capabilities
  }
EOF

" =================

" SNIPPETS
" =================
lua << EOF
  require("luasnip/loaders/from_vscode").lazy_load()
EOF
" =================
