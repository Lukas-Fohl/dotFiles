return{
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<C-p>",
        function() require("telescope.builtin").find_files({ cwd = vim.fn.getcwd()}) end,
        desc = "Find Plugin File",
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
