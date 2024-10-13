local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	vim.keymap.set(mode, lhs, rhs, opts)
end
local opts = { noremap = true, silent = true, desc = "which_key_ignore" }

-- space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- Meant for a specific buffer, you generally use it based on a filetype

-- keep centered
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "NNzzv", opts)
map("n", "}", "}zzzv", opts)
map("n", "{", "{zzzv", opts)
map("n", "J", "mzJ`z", opts)

-- switch window
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprev<CR>", opts)

-- resize window
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- delete not cut
map("n", "dd", '"_dd', opts)
map("n", "x", '"_x', opts)

map("x", "p", '"_dP', opts) -- Paste without overwriting register

map({ "i", "n" }, "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Escape for Clear hlsearch" })

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- move up/down
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- better up/down on wrap
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "which_key_ignore" })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "which_key_ignore" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "which_key_ignore" })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "which_key_ignore" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "which_key_ignore" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "which_key_ignore" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "which_key_ignore" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "which_key_ignore" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "which_key_ignore" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "which_key_ignore" })
