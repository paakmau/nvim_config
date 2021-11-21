return require("packer").startup({
    function(use)
        -- Packer can manage itself
        use("wbthomason/packer.nvim")

        use({
            "folke/tokyonight.nvim",
            config = function()
                vim.cmd([[colorscheme tokyonight]])
            end,
        })

        use({
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                local g = vim.g
                g.nvim_tree_quit_on_open = 1
                g.nvim_tree_indent_markers = 1
                g.nvim_tree_highlight_opened_files = 3
                g.nvim_tree_group_empty = 1
                g.nvim_tree_disable_window_picker = 1
                g.nvim_tree_respect_buf_cwd = 1

                local map = vim.api.nvim_set_keymap
                local opts = {
                    noremap = true,
                }
                map("n", "<leader>e", ":NvimTreeFocus<CR>:NvimTreeRefresh<CR>", opts)

                require("nvim-tree").setup({
                    update_cwd = true,
                    update_focused_file = {
                        enable = true,
                        update_cwd = true,
                    },
                    view = {
                        width = 37,
                        auto_resize = true,
                    },
                })
            end,
        })

        use({
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                local map = vim.api.nvim_set_keymap
                local opts = {
                    noremap = true,
                }
                map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", opts)
                map("n", "<leader>bl", ":BufferLineCycleNext<CR>", opts)
                map("n", "<leader>bH", ":BufferLineMovePrev<CR>", opts)
                map("n", "<leader>bL", ":BufferLineMoveNext<CR>", opts)
                map("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>", opts)
                map("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>", opts)
                map("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>", opts)
                map("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>", opts)
                map("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>", opts)
                map("n", "<leader>b6", ":BufferLineGoToBuffer 6<CR>", opts)
                map("n", "<leader>b7", ":BufferLineGoToBuffer 7<CR>", opts)
                map("n", "<leader>b8", ":BufferLineGoToBuffer 8<CR>", opts)
                map("n", "<leader>b9", ":BufferLineGoToBuffer 9<CR>", opts)

                require("bufferline").setup({
                    options = {
                        custom_filter = function(buf_number)
                            local buf_name = vim.fn.bufname(buf_number)

                            if string.find(buf_name, "^(Neogit.*)$") then
                                return false
                            end

                            if string.find(buf_name, "^(%.git/NEOGIT_COMMIT_EDITMSG)$") then
                                return false
                            end

                            if string.find(buf_name, "^(%[Command Line%])$") then
                                return false
                            end

                            return true
                        end,
                        show_buffer_close_icons = false,
                        show_close_icon = false,
                        always_show_bufferline = true,
                    },
                })
            end,
        })

        use({
            "famiu/bufdelete.nvim",
            config = function()
                local map = vim.api.nvim_set_keymap
                local opts = {
                    noremap = true,
                }

                map("n", "<leader>bq", ":Bdelete<CR>:NvimTreeRefresh<CR>", opts)
            end,
        })

        use({
            "akinsho/toggleterm.nvim",
            config = function()
                require("toggleterm").setup({
                    size = 12,
                    open_mapping = [[<leader>t]],
                    insert_mappings = false,
                    direction = "float",
                })
            end,
        })

        use({
            "nvim-lualine/lualine.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("lualine").setup({
                    theme = "tokyonight",
                })
            end,
        })

        use({
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup({})
            end,
        })

        use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

        use({
            "nvim-telescope/telescope.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                local map = vim.api.nvim_set_keymap
                local opts = {
                    noremap = true,
                }

                map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
                map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
                map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
                map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
                map("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts)
                map("n", "<leader>fc", "<cmd>Telescope commands<CR>", opts)

                require("telescope").setup({
                    extensions = {
                        fzf = {
                            fuzzy = true, -- false will only do exact matching
                            override_generic_sorter = true, -- override the generic sorter
                            override_file_sorter = true, -- override the file sorter
                            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                            -- the default case_mode is "smart_case"
                        },
                    },
                })

                require("telescope").load_extension("projects")
                require("telescope").load_extension("fzf")
            end,
        })

        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup({})
            end,
        })

        use({
            "lewis6991/gitsigns.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("gitsigns").setup({
                    signcolumn = false,
                    numhl = true,
                    current_line_blame = true,
                    current_line_blame_opts = {
                        delay = 0,
                    },
                })
            end,
        })

        use({
            "TimUntersberger/neogit",
            requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
            config = function()
                local map = vim.api.nvim_set_keymap
                local opts = {
                    noremap = true,
                }
                map("n", "<leader>g", "<cmd>Neogit kind=vsplit<CR>", opts)

                require("neogit").setup({
                    disable_commit_confirmation = true,
                    integrations = {
                        diffview = true,
                    },
                })
            end,
        })

        use({
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup({
                    use_treesitter = true,
                    show_trailing_blankline_indent = false,
                    filetype_exclude = { "help", "git", "markdown", "text", "terminal", "lspinfo", "packer" },
                    buftype_exclude = { "terminal", "nofile" },
                })
            end,
        })

        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup({})
            end,
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = "maintained",
                    highlight = {
                        enable = true,
                    },
                })
            end,
        })

        use({
            "neovim/nvim-lspconfig",
            config = function()
                local nvim_lsp = require("lspconfig")

                -- Setup lspconfig.
                local capabilities = require("cmp_nvim_lsp").update_capabilities(
                    vim.lsp.protocol.make_client_capabilities()
                )

                -- Use a loop to conveniently call 'setup' on multiple servers
                local servers = { "clangd", "cmake", "jdtls", "sumneko_lua", "rust_analyzer" }
                for _, lsp in ipairs(servers) do
                    nvim_lsp[lsp].setup({
                        capabilities = capabilities,
                        flags = {
                            debounce_text_changes = 500,
                        },
                    })
                end
            end,
        })

        use({
            "williamboman/nvim-lsp-installer",
            after = "nvim-lspconfig",
            config = function()
                local lsp_installer_servers = require("nvim-lsp-installer.servers")

                local servers = {
                    { "clangd", {} },
                    { "cmake", {} },
                    { "jdtls", {} },
                    { "sumneko_lua", {} },
                    {
                        "rust_analyzer",
                        {},
                    },
                }

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
            end,
        })

        use({
            "hrsh7th/nvim-cmp",
            requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/vim-vsnip" },
            config = function()
                -- Setup nvim-cmp.
                local cmp = require("cmp")

                cmp.setup({
                    snippet = {
                        -- REQUIRED - you must specify a snippet engine
                        expand = function(args)
                            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        end,
                    },
                    mapping = {
                        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                        ["<C-e>"] = cmp.mapping({
                            i = cmp.mapping.abort(),
                            c = cmp.mapping.close(),
                        }),
                        ["<CR>"] = cmp.mapping.confirm({
                            select = true,
                        }),
                    },
                    sources = cmp.config.sources({
                        {
                            name = "nvim_lsp",
                        },
                        {
                            name = "buffer",
                        },
                        {
                            name = "path",
                        },
                        {
                            name = "vsnip",
                        },
                    }),
                })
            end,
        })

        use({
            "mhartington/formatter.nvim",
            config = function()
                local map = vim.api.nvim_set_keymap
                local opts = {
                    noremap = true,
                }
                map("n", "<leader>F", ":Format<CR>", opts)

                require("formatter").setup({
                    filetype = {
                        cpp = {
                            function()
                                return {
                                    exe = "clang-format",
                                    args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
                                    stdin = true,
                                }
                            end,
                        },
                        java = {
                            function()
                                return {
                                    exe = "./gradlew",
                                    args = {
                                        "spotlessApply",
                                        "-PspotlessIdeHook=" .. vim.fn.expand("%:p"),
                                        "-PspotlessIdeHookUseStdIn",
                                        "-PspotlessIdeHookUseStdOut",
                                        "--quiet",
                                    },
                                    stdin = true,
                                }
                            end,
                        },
                        lua = {
                            function()
                                return {
                                    exe = "stylua",
                                    args = { "--indent-type", "Spaces", "-" },
                                    stdin = true,
                                }
                            end,
                        },
                        rust = {
                            function()
                                return {
                                    exe = "rustfmt",
                                    args = { "--emit=stdout" },
                                    stdin = true,
                                }
                            end,
                        },
                        sh = {
                            function()
                                return {
                                    exe = "shfmt",
                                    args = { "-i", 2 },
                                    stdin = true,
                                }
                            end,
                        },
                    },
                })
            end,
        })

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
    },
})
