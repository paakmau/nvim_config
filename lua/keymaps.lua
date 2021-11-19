local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true
}

map('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)
