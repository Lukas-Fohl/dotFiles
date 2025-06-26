return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      },
    })

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
    end

    local harpoon = require("harpoon")

    vim.keymap.set("n", "<leader>r", function()
        local harpoon = require("harpoon")
        local list = harpoon:list()

        local current_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")

        for i, item in ipairs(list.items) do
            if item.value == current_path then
                list:remove(item)
                vim.notify("Removed " .. tostring(i) .. " from Harpoon: " .. current_path)
                return
            end
        end

        vim.notify("Current file not in Harpoon list")
    end, { desc = "Remove current file from Harpoon (relative)" })



    map("n", "<leader>a", function() harpoon:list():add() end, "Harpoon Add File")
    map("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Harpoon Menu")

    map("n", "<C-h>", function() harpoon:list():next() end, "Harpoon next File")
    map("n", "<C-l>", function() harpoon:list():prev() end, "Harpoon prev File")
    --map("n", "<leader>c", function() harpoon:list():clear() end, "Harpoon clear list")
  end,
}

