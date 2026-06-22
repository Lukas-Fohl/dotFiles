vim.keymap.set("n", "<M-j>", "<CMD>:cnext<CR>")
vim.keymap.set("n", "<M-k>", "<CMD>:cprev<CR>")

vim.keymap.set({"n","v"}, "<C-k>", "{")
vim.keymap.set({"n","v"}, "<C-j>", "}")

vim.keymap.set({"i","n","v"}, "<C-s>", "<esc>:w<return>")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>j", "a}<esc>")
vim.keymap.set("n", "<leader>f", "a{<esc>")
vim.keymap.set("n", "<leader>g", "a[<esc>")
vim.keymap.set("n", "<leader>h", "a]<esc>")

vim.keymap.set("n", "<leader>b", "a\\<esc>")

vim.keymap.set('n', '<leader>c', ':make<CR>', { silent = true, desc = 'Run makeprg' })

-- vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "\"", "\"\"<left>")

local function cmdWindow() 
    local width = vim.o.columns
    local height = vim.o.lines
    local win_height = math.ceil(height * 0.8 - 4)
    local win_width = math.ceil(width * 0.6)
    local row = math.ceil((height - win_height) / 2 - 2)
    local col = math.ceil((width - win_width) / 2)
    local buf = vim.api.nvim_create_buf(false, true)

    local win_opts = {
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }
    local win = vim.api.nvim_open_win(buf, true, win_opts)

    vim.cmd("terminal")
    vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", cmdWindow)

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
