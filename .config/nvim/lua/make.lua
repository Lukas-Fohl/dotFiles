vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.makeprg = "python3 %"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    callback = function()
        vim.opt_local.makeprg = "typst compile %"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt_local.makeprg = "go run %"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.makeprg = "gcc % -Wall -Wextra -pedantic ; ./a.out"
    end,
})
