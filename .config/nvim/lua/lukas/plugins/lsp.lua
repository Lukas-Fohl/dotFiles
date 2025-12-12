return {
  -- LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Enable clangd
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { 
            "clangd",
            "--fallback-style=webkit"
        },
      })

      -- Enable pyright
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      -- Enable gopls
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })
    end,
  },

  -- Autocompletion engine
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
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
    end,
  },
}
