
vim.keymap.set("n", "<C-k>", "{")
vim.keymap.set("n", "<C-j>", "}")

vim.keymap.set("v", "<C-k>", "{")
vim.keymap.set("v", "<C-j>", "}")

vim.keymap.set("i", "<C-s>", "<esc><return>")
vim.keymap.set("n", "<C-s>", "<esc><return>")
vim.keymap.set("v", "<C-s>", "<esc><return>")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
