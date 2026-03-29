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

vim.keymap.set('n', '<leader>c', ':make<CR>', { silent = true, desc = 'Run makeprg' })

-- vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "\"", "\"\"<left>")

vim.keymap.set("n", "<leader>t", ":!")

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
