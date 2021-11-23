local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

vim.g.mapleader = ","

map("t", "<esc>", [[<C-\><C-n>]], opts)

map("i", "<C-h>", [[<esc><C-W>h]], opts)
map("i", "<C-j>", [[<esc><C-W>j]], opts)
map("i", "<C-k>", [[<esc><C-W>k]], opts)
map("i", "<C-l>", [[<esc><C-W>l]], opts)
map("n", "<C-h>", [[<C-W>h]], opts)
map("n", "<C-j>", [[<C-W>j]], opts)
map("n", "<C-k>", [[<C-W>k]], opts)
map("n", "<C-l>", [[<C-W>l]], opts)
map("t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
map("t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
map("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
map("t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)

map("n", "<leader><", [[<C-w>4<]], opts)
map("n", "<leader>>", [[<C-w>4>]], opts)
map("n", "<leader>-", [[<C-w>2-]], opts)
map("n", "<leader>+", [[<C-w>2+]], opts)
