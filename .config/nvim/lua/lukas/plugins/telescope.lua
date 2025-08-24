return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<C-p>",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.getcwd(),
          hidden = true, -- Include hidden files (dotfiles)
        })
      end,
      desc = "Find Plugin File",
    },
    {
      "<C-l>",
      function()
        require("telescope.builtin").live_grep({
          cwd = vim.fn.getcwd(),
          additional_args = function() return { "--hidden" } end, -- Include hidden files in live_grep
        })
      end,
      desc = "Find Plugin Grep",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
}
