local opts = { noremap = true, silent = true }
--[[ local term_opts = { silent = true } ]]

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " " -- meant for a specific buffer, you generally use it based on a filetype

-- Modes
-- term_mode = "t",
-- command_mode = "c",

-- Normal --
-- Update
--[[ vim.keymap.set("n", "<leader>u", function() ]]
--[[ 	vim.fn.system("git clone https://github.com/sayanta01/nvim ~/.config/nvim") ]]
--[[ 	vim.api.nvim_echo({ { "Repository cloned successfully!", "Normal" } }, true, {}) ]]
--[[ end, { desc = "Update" }) ]]

-- Beginning & End
--[[ keymap("n", "<C-b>", "<ESC>^i", opts) ]]
--[[ keymap("n", "<C-e>", "<End>", opts) ]]
--[[ keymap("i", "<C-b>", "<ESC>^i", opts) ]]
--[[ keymap("i", "<C-e>", "<End>", opts) ]]

-- Half down/up
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Search term in middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "NNzzv", opts)

-- Edit same word all together
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

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
--[[ keymap("n", "<S-o>", ":BufferLineMoveNext<CR>", opts) -- fix this ]]
--[[ keymap("n", "<S-i>", ":BufferLineMovePrev<CR>", opts) -- fix this ]]

-- New buffer
keymap("n", "<S-b>", ":enew <CR>", opts)

-- Delete (not cut)
keymap("n", "dd", '"_dd', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

keymap("n", "<C-v>", ":vsplit<CR>", opts)
keymap("n", "<C-s>", ":split<CR>", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)

-- Move current line / block with Alt-j/k vscode.
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

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
keymap("x", "p", '"_dP', opts)

-- Visual Block --
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
