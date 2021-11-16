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
            g.nvim_tree_group_empty = 1
            g.nvim_tree_disable_window_picker = 1

            require'nvim-tree'.setup {
                open_on_setup = true,
                auto_close = true,
                view = {
                    width = 40,
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
            require('indent_blankline').setup {
                char = '▏',
                show_first_indent_level = false,
                filetype_exclude = {'help', 'git', 'markdown', 'text', 'terminal', 'lspinfo', 'packer'},
                buftype_exclude = {'terminal', 'nofile'}
            }
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = 'maintained',
                highlight = {
                    enable = true
                }
            }
        end
    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            local nvim_lsp = require('lspconfig')

            -- Use a loop to conveniently call 'setup' on multiple servers
            local servers = {'clangd', 'cmake', 'jdtls', 'sumneko_lua', 'rust_analyzer'}
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup {
                    flags = {
                        debounce_text_changes = 500
                    }
                }
            end
        end
    }

    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            require('nvim-lsp-installer').on_server_ready(function(server)
                server:setup{}
            end)
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
