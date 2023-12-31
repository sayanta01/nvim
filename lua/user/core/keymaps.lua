local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " " -- meant for a specific buffer, you generally use it based on a filetype

-- Update
-- vim.keymap.set("n", "<leader>u", function()
-- 	vim.fn.system("git clone --depth=1 https://github.com/sayanta01/nvim ~/.config/nvim")
-- 	vim.api.nvim_echo({ { "Repository cloned successfully!", "Normal" } }, true, {})
-- end, { desc = "Update" })

-- Keeping it centered
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "NNzzv", opts)
keymap("n", "}", "}zzzv", opts)
keymap("n", "{", "{zzzv", opts)
keymap("n", "J", "mzJ`z", opts)

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
keymap("n", "<S-Left>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<S-Right>", ":BufferLineMoveNext<CR>", opts)

-- Delete not cut
keymap("n", "dd", '"_dd', opts)
keymap("n", "x", '"_x', opts)

-- Edit same word all together
keymap("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Splits
keymap("n", "<leader>\\", ":vsplit<CR>", opts)
keymap("n", "<leader>-", ":split<CR>", opts)

-- Exit insert mode with jk
keymap("i", "jk", "<ESC>", opts)

-- Toggle terminal
keymap("n", "<A-\\>", ":ToggleTerm<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Better paste
keymap("x", "p", '"_dP', opts)

-- Move text up & down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)
