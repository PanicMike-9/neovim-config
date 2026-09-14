-- MY VERY FIRST NEOVIM PLUGIN!!!
local M = {}

local comment_strings = {
    cpp = "//",
    c = "//",
    typescript = "//",
    sh = "#", 
    bash = "#",
    lua = "--",
}

local default_comment = "//"

local function get_comment_string()
    return comment_strings[vim.bo.filetype] or default_comment
end

function M.toggle_comment(start_line, end_line)
    local symbol = get_comment_string()
    local symbol_escaped = symbol:gsub("([^%w])", "%%%1")

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

local updated_lines = {}

-- comment, un-commented lines
local already_commented = true;
for _, line in ipairs(lines) do
    if line:match("%S") and not line:match("^%s*" .. symbol_escaped) then
        already_commented = false
        break
    end
end

-- un-comment, commented lines
for _, line in ipairs(lines) do
    if already_commented then
        local new_line = line:gsub("^(%s*)" .. symbol_escaped .. "%s?", "%1")
        table.insert(updated_lines, new_line)
    else
        local indent, content = line:match("^(%s*)(.*)$")
        if content ~= "" then
            table.insert(updated_lines, indent .. symbol .. " " .. content)
        else
            table.insert(updated_lines, line)
        end
    end
end

    vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, updated_lines)
end

-- set keymaps to toggle comment
function M.setup()
    vim.keymap.set("n", "<C-_>", function()
        local current_line = vim.api.nvim_win_get_cursor(0)[1]
        M.toggle_comment(current_line, current_line)
    end, { desc = "Toggle line comment" })

    vim.keymap.set("v", "<C-_>", function()
        local start_line = vim.fn.line("v")
        local end_line = vim.fn.line(".")
        M.toggle_comment(start_line, end_line)
        if start_line > end_line then
            start_line, end_line = end_line, start_line
        end

        M.toggle_comment(start_line, end_line)

        vim.api.nvim_feedback(
            vim.api.nvim_replace_termcodes("<Esc>", true, false, true), 
            "n", 
            true
        )
    end, { desc = "Toggle selection comment" })
end

return M
