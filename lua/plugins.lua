return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd [[colorscheme tokyonight]]
        end
    }

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
            require('lualine').setup {
                theme = 'tokyonight'
            }
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

            -- Setup lspconfig.
            local capabilities =
                require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- Use a loop to conveniently call 'setup' on multiple servers
            local servers = {'clangd', 'cmake', 'jdtls', 'sumneko_lua', 'rust_analyzer'}
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup {
                    capabilities = capabilities,
                    flags = {
                        debounce_text_changes = 500
                    }
                }
            end
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/vim-vsnip'},
        config = function()
            -- Setup nvim-cmp.
            local cmp = require 'cmp'

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
                        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
                    end
                },
                mapping = {
                    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
                    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
                    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close()
                    }),
                    ['<CR>'] = cmp.mapping.confirm({
                        select = true
                    })
                },
                sources = cmp.config.sources({{
                    name = 'nvim_lsp'
                }, {
                    name = 'buffer'
                }, {
                    name = 'path'
                }, {
                    name = 'vsnip'
                }})
            })
        end
    }

    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            local lsp_installer_servers = require('nvim-lsp-installer.servers')

            local servers = {{'clangd', {}}, {'cmake', {}}, {'jdtls', {}}, {'sumneko_lua', {}}, {'rust_analyzer', {}}}

            for _, lsp in ipairs(servers) do
                local server_available, requested_server = lsp_installer_servers.get_server(lsp[1])
                if server_available then
                    requested_server:on_ready(function()
                        requested_server:setup(lsp[2])
                    end)
                    if not requested_server:is_installed() then
                        -- Queue the server to be installed
                        requested_server:install()
                    end
                end
            end

        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
