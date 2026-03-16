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
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd("colorscheme tokyonight-night")
        end,
    },

   -- tree-sitter for high lights
    {
        "nvim-treesitter/nvim-treesitter",
        --lazy = false,
        build = ":TSUpdate",

        opts = {
            ensure_installed = { 
                "lua", 
                "c", 
                "cpp", 
                "vim", 
                "markdown", 
                "vimdoc", 
                "query", 
            },

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

    -- rainbow delimiters
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            local rainbow_delimiters = require("rainbow-delimiters")

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy.global,
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-delimiters',
                cpp = 'rainbow-delimiters',
                c = 'rainbow-delimiters',

            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
      end
    },

} -- return end
