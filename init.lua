require "ruth.options"
require "ruth.plugins"
require "ruth.keymaps"
require "ruth.lsp"
require "ruth.completion"
require "ruth.treesitter"
vim.cmd "set background=light"
vim.cmd "colorscheme solarized" -- set the solarized color scheme

vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }
