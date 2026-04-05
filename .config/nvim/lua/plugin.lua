-- LSP --
vim.pack.add{{src = "https://github.com/neovim/nvim-lspconfig"}}
vim.pack.add{{src = "https://github.com/hrsh7th/nvim-cmp"}}
vim.pack.add{{src = "https://github.com/hrsh7th/cmp-nvim-lsp"}}
vim.pack.add{{src = "https://github.com/L3MON4D3/LuaSnip"}}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
  },
})

vim.lsp.config('clangd', {
  cmd = { "clangd", "--fallback-style=webkit" },
  capabilities = capabilities,
})

vim.lsp.config('pyright', {
  capabilities = capabilities,
})

vim.lsp.config('gopls', {
  cmd = { "gopls" },
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
})

vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('gopls')

-- Typst --
vim.pack.add{{src = "https://github.com/chomosuke/typst-preview.nvim"}}

require('typst-preview').setup({
    lazy = false,
    version = '1.*',
    opts = {},
})


-- Wobble --
vim.pack.add{{
    src="https://github.com/Lukas-Fohl/wobble.nvim",
}}
require("wobble").setup({
    source_exts = { "c", "cpp", "cc", "cxx", "m", "mm", "c++" },
    header_exts = { "h", "hpp", "hh", "hxx", "h++" },
    search_paths = { ".", "./src", "./include", "./../src", "./../include" }
})
vim.keymap.set("n", "<leader>w", "<cmd>Wobble<CR>")

-- Outline --
-- vim.pack.add{{src="https://github.com/hedyhli/outline.nvim"}}
-- require("outline").setup({
--   outline_window = {
--     position='left'
--   }
-- })
-- vim.keymap.set("n", "<leader>s", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- Symbols
vim.pack.add{{src="https://github.com/oskarrrrrrr/symbols.nvim"}}

local r = require("symbols.recipes")

require("symbols").setup(
    r.DefaultFilters,
    r.AsciiSymbols,
    {
        sidebar = {
            hide_cursor = false
        }
    }
)

vim.keymap.set("n", "<leader>s", "<cmd>Symbols<CR>")
vim.keymap.set("n", "<leader>S", "<cmd>SymbolsClose<CR>")

vim.pack.add{{src="https://github.com/nvim-lua/plenary.nvim"}}
vim.pack.add{{src="https://github.com/nvim-telescope/telescope.nvim"}}

require("telescope").setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
    winblend = 0,
  },
})

vim.keymap.set("n", "<C-p>", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.getcwd(),
    hidden = true,
  })
end, { desc = "Find Plugin File" })

vim.keymap.set("n", "<C-l>", function()
  require("telescope.builtin").live_grep({
    cwd = vim.fn.getcwd(),
    additional_args = function() return { "--hidden" } end,
  })
end, { desc = "Find Plugin Grep" })

-- Treesitter --
vim.pack.add{{src = "https://github.com/nvim-treesitter/nvim-treesitter"}}

require("nvim-treesitter").setup({
  ensure_installed = {
    "bash", "go", "gomod", "gosum", "html", "javascript",
    "json", "lua", "markdown", "markdown_inline", "python",
    "query", "regex", "tsx", "typescript", "vim", "yaml",
  },
  highlight = { enable = true }, -- usually desired if moving from lazy
})


-- Harpoon --
vim.pack.add{{
    src = "https://github.com/ThePrimeagen/harpoon",
    version = 'harpoon2',
}}

local harpoon = require("harpoon")

harpoon:setup({
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
    -- key = function()
    --   return vim.loop.cwd()
    -- end,
  },
})

local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

map("n", "<leader>d", function()
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
end, "Remove current file from Harpoon")

map("n", "<leader>a", function() harpoon:list():add() end, "Harpoon Add File")
map("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Harpoon Menu")

map("n", "<leader>1", function() harpoon:list():select(1) end)
map("n", "<leader>2", function() harpoon:list():select(2) end)
map("n", "<leader>3", function() harpoon:list():select(3) end)
map("n", "<leader>4", function() harpoon:list():select(4) end)
map("n", "<leader>5", function() harpoon:list():select(5) end)

-- Gruvbox --
vim.pack.add{{src = "https://github.com/ellisonleao/gruvbox.nvim"}}
require("gruvbox").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
