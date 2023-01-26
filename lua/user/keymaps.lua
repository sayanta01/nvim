local opts = { noremap = true, silent = true }
--[[ local term_opts = { silent = true } ]]

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   term_mode = "t",
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   command_mode = "c",
--   visual_block_mode = "x",

-- Normal --
-- Wrap Text
--[[ keymap("n", "<C-w>", "<ESC>:set wrap <CR>", opts) ]]
-- keymap("i", "<C-w-w>", "<ECS>:set wrap <CR>", opts)
--[[ keymap("v", "<C-w>", "<ESC>:set wrap <CR>", opts) ]]

-- No Wrap Text
--[[ keymap("n", "<C-M-w>", "<ESC>:set nowrap <CR>", opts) ]]
--[[ keymap("i", "<C-M-w>", "<ESC>:set nowrap <CR>", opts) ]]
--[[ keymap("v", "<C-M-w>", "<ESC>:set nowrap <CR>", opts) ]]

-- Line number
--[[ keymap("n", "<leader>n", "<cmd> set nu! <CR>", opts) ]]
--[[ keymap("n", "<leader>nn", "<cmd> set rnu! <CR>", opts) ]]
--[[ keymap("n", "<leader>m", "<cmd> set cursorcolumn! <CR>", opts) ]]

-- Beginning & End
keymap("n", "<C-b>", "<ESC>^i", opts)
keymap("n", "<C-e>", "<End>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Copy whole file
keymap("n", "<leader>y", ":%y<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-o>", "<cmd>BufferLineMoveNext<CR>", opts)
keymap("n", "<S-i>", "<cmd>BufferLineMovePrev<CR>", opts)

-- New buffer
keymap("n", "<S-b>", ":enew <CR>", opts)

-- Move text up and down
keymap("n", "<A-l>", ":m .+1<CR>==", opts)
keymap("n", "<A-h>", ":m .-2<CR>==", opts)

keymap("n", "<C-v>", "<cmd>vsplit<CR>", opts)
keymap("n", "<C-s>", "<cmd>split<CR>", opts)

-- Edit same word all together
keymap("n", "<leader>k", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- go to  beginning and end
keymap("i", "<C-b>", "<ESC>^i", opts)
keymap("i", "<C-e>", "<End>", opts)

-- navigate within insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
