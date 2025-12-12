return {
    "Lukas-Fohl/wobble.nvim",
    config = function()
        require("wobble").setup({
            source_exts = { "c", "cpp", "cc", "cxx", "m", "mm", "c++" },
            header_exts = { "h", "hpp", "hh", "hxx", "h++" },
            search_paths = { ".", "./src", "./include", "./../src", "./../include" }
        })
        vim.keymap.set("n", "<leader>w", "<cmd>Wobble<CR>")
    end
}
