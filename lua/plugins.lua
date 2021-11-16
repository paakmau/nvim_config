return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            local g = vim.g
            g.nvim_tree_quit_on_open = 1
            g.nvim_tree_indent_markers = 1
            g.nvim_tree_highlight_opened_files = 3
            g.nvim_tree_disable_window_picker = 1

            require'nvim-tree'.setup {
                open_on_setup = true,
                auto_close = true,
                view = {
                    width = 32,
                    auto_resize = true
                }
            }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('lualine').setup {}
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup {}
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                char = "▏",
                show_first_indent_level = false,
                filetype_exclude = {'help', 'git', 'markdown', 'text', 'terminal', 'lspinfo', 'packer'},
                buftype_exclude = {'terminal', 'nofile'}
            }
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
