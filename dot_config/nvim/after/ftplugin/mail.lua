vim.opt_local.textwidth = 72
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_us" }
--vim.opt_local.formatoptions:append("tcqan")
vim.opt_local.colorcolumn = "73"
vim.opt_local.conceallevel = 1

-- treat > quoted blocks better
vim.opt_local.comments = "n:>"

-- stop treesitter/LSP from being weird on email
vim.b.minipairs_disable = true
