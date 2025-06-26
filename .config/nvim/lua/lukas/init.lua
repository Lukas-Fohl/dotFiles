vim.g.mapleader = " "

require("lukas.lazy")

require("lukas.remap")

require("lukas.set")

vim.diagnostic.config({
  virtual_text = false, -- disable inline "E"
  signs = true,
  float = {
    border = "rounded",
    source = "always",
  },
  update_in_insert = false,
})

-- Show diagnostics in a floating window on cursor hold
vim.o.updatetime = 250
vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
