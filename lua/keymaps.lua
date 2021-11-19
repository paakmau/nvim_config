local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true
}

map('n', '<leader>e', ':NvimTreeFocus<CR>', opts)

map('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
map('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
map('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
map('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
map('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
map('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts)

map('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', opts)

map('t', '<esc>', [[<C-\><C-n>]], opts)
map('t', 'jk', [[<C-\><C-n>]], opts)

map('i', '<C-h>', [[<esc><C-W>h]], opts)
map('i', '<C-j>', [[<esc><C-W>j]], opts)
map('i', '<C-k>', [[<esc><C-W>k]], opts)
map('i', '<C-l>', [[<esc><C-W>l]], opts)
map('n', '<C-h>', [[<C-W>h]], opts)
map('n', '<C-j>', [[<C-W>j]], opts)
map('n', '<C-k>', [[<C-W>k]], opts)
map('n', '<C-l>', [[<C-W>l]], opts)
map('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
map('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
map('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
map('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
