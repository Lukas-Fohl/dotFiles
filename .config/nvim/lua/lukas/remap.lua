vim.keymap.set("n", "<C-k>", "{")
vim.keymap.set("n", "<C-j>", "}")
vim.keymap.set("v", "<C-k>", "{")
vim.keymap.set("v", "<C-j>", "}")

vim.keymap.set("i", "<C-s>", "<esc>:w<return>")
vim.keymap.set("n", "<C-s>", "<esc>:w<return>")
vim.keymap.set("v", "<C-s>", "<esc>:w<return>")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>j", "a}<esc>")
vim.keymap.set("n", "<leader>f", "a{<esc>")
vim.keymap.set("n", "<leader>g", "a[<esc>")
vim.keymap.set("n", "<leader>h", "a]<esc>")

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
