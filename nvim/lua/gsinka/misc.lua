-- ICONS
-- require'nvim-web-devicons'.setup{}

-- SNIPPETS
require("luasnip/loaders/from_vscode").lazy_load()

-- NETRW
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- AUTOPAIRS
require("nvim-autopairs").setup{}
