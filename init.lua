require "vanta.options"
require "vanta.plugins"
require "vanta.lsp"
require "vanta.treesitter"
require "vanta.completion"
require "vanta.keymaps"
vim.cmd "set background=light"
vim.cmd "colorscheme solarized" -- set the solarized color scheme

vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }
