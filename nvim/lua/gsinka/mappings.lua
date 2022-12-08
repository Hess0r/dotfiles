local keymap = require('gsinka.keymap')
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
local tnoremap = keymap.tnoremap
local opts = keymap.opts
local optsNoSilent = keymap.optsNoSilent

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

nnoremap('<leader>ve', [[<cmd>e $MYVIMRC<CR>]], opts)
nnoremap('<leader><CR>', [[<cmd>source $MYVIMRC<CR>]], opts)

nnoremap('<leader>', [[<cmd>WhichKey '<Space>'<CR>]], opts)
vnoremap('<leader>', [[<cmd>WhichKeyVisual '<Space>'<CR>]], opts)

nnoremap('<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
nnoremap('<leader>sf', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
nnoremap('<leader>sg', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], opts)
nnoremap('<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
nnoremap('<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
nnoremap('<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
nnoremap('<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
nnoremap('<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
nnoremap('<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
nnoremap('<leader>sm', [[<cmd>lua require('telescope.builtin').marks()<CR>]], opts)
nnoremap('<leader>sw', [[<cmd>lua require('telescope.builtin').spell_suggest()<CR>]], opts)
nnoremap('<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)

nnoremap('<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], opts)
nnoremap('<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], opts)
nnoremap('<leader>gd', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], opts)
nnoremap('<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], opts)
nnoremap('<leader>gp', [[<cmd>Gdiffsplit<CR>]], opts)

nnoremap('<leader>n', [[<cmd>Lexplore %:p:h<CR>]], opts)
nnoremap('<leader>m', [[<cmd>Lexplore<CR>]], opts)

nnoremap('<leader>n', [[<cmd>NnnPicker<CR>]], opts)
nnoremap('<C-A-n>', [[<cmd>NnnExplorer %:p:h<CR>]], opts)
tnoremap('<C-A-n>', [[<cmd>NnnExplorer %:p:h<CR>]], opts)
nnoremap('<C-A-p>', [[<cmd>NnnPicker<CR>]], opts)
tnoremap('<C-A-p>', [[<cmd>NnnPicker<CR>]], opts)

tnoremap('<ESC><ESC>', [[<C-\><C-n>]], opts)

-- nnoremap('<leader>f', [[<cmd>Neoformat<CR>]], opts)

nnoremap('<leader>rr', [[:s/<C-r><C-w>/]], optsNoSilent)

nnoremap('<leader>x', [[<cmd>set spell!<CR>]], opts)

nnoremap('<leader>t', ':FloatermToggle scratch<CR>')
-- nnoremap('<F1>', ':FloatermToggle scratch<CR>')
-- tnoremap('<F1>', '<C-\\><C-n>:FloatermToggle scratch<CR>')

