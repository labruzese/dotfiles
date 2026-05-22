vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'v', 's' }, ' ', '<Nop>')

vim.o.title = true
vim.o.undofile = true
vim.o.number = true
vim.o.cindent = true
vim.o.shiftwidth = 4
vim.o.winborder = 'rounded'

vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_command = "rustup run nightly rustfmt"

if os.getenv("SSH_TTY") then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end

require('lsp')
require('plugins')
require('statusline')
