-- Bootstrap lazy.nvim
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- set new leader
vim.g.mapleader = " "

-- lazy plugins setup
require("lazy").setup("plugins")

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true

-- set custom color 
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#13141c", underline = false })

-- show current mode
vim.opt.showmode = false

-- keymappings
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- keymappings for LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- keymappings to jump between errors quickly
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

-- telescope(file explorer) keymappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)

-- sidebar file explorer(nvim-tree) keymappings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- buffer switching keymappings
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")

-- buffer closing keymappings
vim.keymap.set("n", "<leader>q", vim.cmd.bd)

-- force start treesitter
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

-- CodeChef Boiler plate snippet
vim.keymap.set('i', 'chef', function()
    local lines = {
        "// Solved: No",
        "#include <bits/stdc++.h>",
        "    ",
        "using i64 = std::int64_t;",
        "using u64 = std::uint64_t;",
        "using usize = std::size_t;",
        "    ",
        "using vi = std::vector<int>;",
        "using vipii = std::vector<std::pair<int, int>>;",
        "using v64 = std::vector<i64>;",
        "    ",
        "using pii = std::pair<int, int>;",
        "using p64 = std::pair<i64, i64>;",
        "    ",
        "auto& out = std::cout;",
        "auto& in = std::cin;",
        "    ",
        'static constexpr std::string_view Y = "YES\\n";',
        'static constexpr std::string_view N = "NO\\n";',
        "    ",
        "inline void read_vec(int sz, vi& a)",
        "{",
        "    for (int i {}; i < sz; ++i) in >> a[i];",
        "}",
        "    ",
        "inline void sort_vec(vi& a)",
        "{",
        "    std::sort(a.begin(), a.end());",
        "}",
        "    ",
        "void solve()",
        "{",
        "}",
        "   ",
        "int main()",
        "{",
        "    std::ios_base::sync_with_stdio(false);",
        "    std::cin.tie(nullptr);",
        "    ",
        "    int t {1};",
        "    std::cin >> t;",
        "    ",
        "    while (t--)",
        "    {",
        "        solve();",
        "    }",
        "     ",
        "    return 0;",
        "}",
    } 
    vim.api.nvim_put(lines, 'c', true, true)
    vim.cmd("normal! 17k_")
    return ""
end, { desc = "CodeChef  Boilerplate" })
