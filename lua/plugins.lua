return
{
    -- tokyonight theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts =
        {
            style = "night",
        },
        config = function()
            vim.cmd("colorscheme tokyonight-night")
        end,
    },

    -- zen mode
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = 120,
                options = {
                    number = true,
                    relativenumber = false,
                    cursorline = true,
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    laststatus = 0,
                },
            },
        },
   },

   -- tree-sitter for high lights
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        main = "nvim-treesitter.config",
        opts = {
            ensure_installed = { "lua", "c", "cpp", "vim", 
            "markdown", "vimdoc", "query", },
            auto_install = true,

            highlight = { enable = true },
            indent = { enable = true },
        },
    },

    -- LSP config
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("clangd", {})
            vim.lsp.enable("clangd")
        end,
    },

    -- neovim file explorer(telescope)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 
            "nvim-lua/plenary.nvim"
        },
        opts = {
            defaults = {
                layout_strategy = "horizontal",
            },
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
        },
    },

    -- bottom line (lualine.nvim)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "tokyonight",
		globalstatus = true,
                section_separators = "",
                component_separators = "", 
            },
        },
    },

    -- sidebar file explorer (nvim-tree)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
            },
        },
    },

    -- top buffer tabs(bufferline)
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                mode = "buffer",
                separator_style = "slant",
                diagnostics = "nvim_lsp",
                always_show_buffline = true,
                themable = true,
            },
        },
    },

} -- return end
