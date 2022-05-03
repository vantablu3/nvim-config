local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local okeymap = vim.api.nvim_set_keymap

--Remap space as leader key
okeymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
okeymap("n", "<C-h>", "<C-w>h", opts)
okeymap("n", "<C-j>", "<C-w>j", opts)
okeymap("n", "<C-k>", "<C-w>k", opts)
okeymap("n", "<C-l>", "<C-w>l", opts)

okeymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
okeymap("n", "<C-Up>", ":resize +2<CR>", opts)
okeymap("n", "<C-Down>", ":resize -2<CR>", opts)
okeymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
okeymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
okeymap("n", "<S-l>", ":bnext<CR>", opts)
okeymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode
okeymap("i", "jk", "<ESC> :w<CR>", { silent = false })

-- Visual --
-- Stay in indent mode
okeymap("v", "<", "<gv", opts)
okeymap("v", ">", ">gv", opts)

-- Move text up and down
okeymap("v", "<A-j>", ":m .+1<CR>==", opts)
okeymap("v", "<A-k>", ":m .-2<CR>==", opts)
okeymap("v", "p", '"_dP', opts)

-- toggl spelling
okeymap("n", "<F3>", ":set spell!<CR>", { silent = true })
