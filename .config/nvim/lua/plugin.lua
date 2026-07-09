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

vim.lsp.config('ts_ls', {
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

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      check = {
        command = 'clippy',
      },
    },
  },
})

vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('rust_analyzer')

-- Typst --
vim.pack.add{{src = "https://github.com/chomosuke/typst-preview.nvim"}}

require('typst-preview').setup({
    lazy = false,
    version = '1.*',
    debug = true,
    invert_colors = 'never',
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

vim.pack.add{{src="https://github.com/nvim-tree/nvim-web-devicons"}}
vim.pack.add{{src="https://github.com/nvim-lua/plenary.nvim"}}
vim.pack.add{{src="https://github.com/lewis6991/gitsigns.nvim"}}
vim.pack.add{{src="https://github.com/stevearc/oil.nvim"}}
vim.pack.add{{src="https://github.com/nvim-telescope/telescope.nvim"}}
vim.pack.add{{src="https://github.com/sindrets/diffview.nvim"}}

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

require("gitsigns").setup({
  current_line_blame = true,
})

require("oil").setup({
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "]h", function()
  require("gitsigns").nav_hunk("next")
end, { desc = "Next hunk" })
vim.keymap.set("n", "[h", function()
  require("gitsigns").nav_hunk("prev")
end, { desc = "Previous hunk" })
vim.keymap.set("n", "<leader>np", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>nb", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle line blame" })
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

require("diffview").setup({})

vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", { desc = "Open diff view" })
vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory %<CR>", { desc = "File history" })
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Close diff view" })

-- Treesitter --
vim.pack.add{{src = "https://github.com/nvim-treesitter/nvim-treesitter"}}

require("nvim-treesitter").setup({
  ensure_installed = {
    "bash", "go", "gomod", "gosum", "html", "javascript",
    "json", "lua", "markdown", "markdown_inline", "python",
    "query", "regex", "rust", "tsx", "typescript", "vim", "yaml",
  },
  highlight = { enable = true }, -- usually desired if moving from lazy
})


-- Hook --
vim.pack.add{{
    src = "https://github.com/zakissimo/hook.nvim",
}}

local hook = require("hook")
local hook_config = {
    width = 50,
    height = 12,
}
hook.setup({
    width = hook_config.width,
    height = hook_config.height,
})

hook._open = function()
    hook._switch = true
    local bufnr = vim.api.nvim_get_current_buf()
    local winid = vim.fn.win_getid(vim.fn.bufwinnr(bufnr))
    local wintype = vim.fn.win_gettype(winid)

    if wintype == "popup" then
        print("Please close the current popup window before opening Hook.")
        return
    end

    local affix = require("hook.affix")
    local max_len, win_names = affix.add(hook.bnames, hook.default.prefix, hook.bmap, hook.default.suffix)

    if max_len > 0 then
        local width = math.max(hook_config.width, max_len)
        vim.api.nvim_buf_set_lines(hook.bufnr, 0, -1, false, win_names)
        hook.winid = vim.api.nvim_open_win(hook.bufnr, true, {
            title = { { hook.default.name, "HookHl" } },
            title_pos = "center",
            relative = "editor",
            width = width,
            height = hook_config.height,
            row = math.floor(((vim.o.lines - hook_config.height) / 2) - 1),
            col = math.floor((vim.o.columns - width) / 2),
            style = "minimal",
            border = {
                { "╭", "HookHl" },
                { "─", "HookHl" },
                { "╮", "HookHl" },
                { "│", "HookHl" },
                { "╯", "HookHl" },
                { "─", "HookHl" },
                { "╰", "HookHl" },
                { "│", "HookHl" },
            },
        })
        vim.api.nvim_win_set_cursor(hook.winid, { 1, 1 })
    end
end

local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

map("n", "<leader>r", function()
    local current_buf = vim.api.nvim_get_current_buf()

    for name, bufnr in pairs(hook.bmap) do
        if bufnr == current_buf then
            hook.bmap[name] = nil
            for i, hook_name in ipairs(hook.bnames) do
                if hook_name == name then
                    table.remove(hook.bnames, i)
                    break
                end
            end
            vim.notify("Removed from Hook: " .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(current_buf), ":."))
            return
        end
    end
    vim.notify("Current buffer not in Hook list")
end, "Remove current buffer from Hook")

map("n", "<leader>a", function() hook.add_buf() end, "Hook Add Buffer")
map("n", "<leader>m", function() hook.toggle() end, "Hook Menu")

map("n", "<leader>1", function() hook.pull(1) end, "Hook buffer 1")
map("n", "<leader>2", function() hook.pull(2) end, "Hook buffer 2")
map("n", "<leader>3", function() hook.pull(3) end, "Hook buffer 3")
map("n", "<leader>4", function() hook.pull(4) end, "Hook buffer 4")
map("n", "<leader>5", function() hook.pull(5) end, "Hook buffer 5")

-- Gruvbox --
vim.pack.add{{src = "https://github.com/ellisonleao/gruvbox.nvim"}}
-- Default options:
require("gruvbox").setup({
  terminal_colors = false, -- add neovim terminal colors
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
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
-- vim.o.background = "light"
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
