local gh = function(x) return 'git@github.com:' .. x end

vim.pack.add({
	gh('ellisonleao/gruvbox.nvim'),
	gh('kylechui/nvim-surround'),
	gh('nvim-treesitter/nvim-treesitter'),
	gh('windwp/nvim-autopairs'),
	gh('stevearc/oil.nvim'),
	gh('mbbill/undotree'),
	gh('kdheepak/lazygit.nvim'),
	gh('folke/which-key.nvim'),
	gh('nvim-lua/plenary.nvim'),
	{ src = gh('ThePrimeagen/harpoon'), version = 'harpoon2' },
	gh('nvim-telescope/telescope.nvim'),
	gh('nvim-telescope/telescope-fzf-native.nvim'),
}, { load = true })

vim.cmd('colorscheme gruvbox')

require('nvim-autopairs').setup()
require('oil').setup()

-- harpoon
local hpn = require('harpoon')
hpn.setup();
vim.keymap.set('n', '<leader>a', function() hpn:list():add() end)
vim.keymap.set('n', '<C-e>', function() hpn.ui:toggle_quick_menu(hpn:list()) end)
vim.keymap.set('n', '<A-q>', function() hpn:list():select(1) end)
vim.keymap.set('n', '<A-w>', function() hpn:list():select(2) end)
vim.keymap.set('n', '<A-e>', function() hpn:list():select(3) end)
vim.keymap.set('n', '<A-r>', function() hpn:list():select(4) end)
vim.keymap.set('n', '<C-S-P>', function() hpn:list():prev() end)
vim.keymap.set('n', '<C-S-N>', function() hpn:list():next() end)

-- telescope fzf compile if not present
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    end
  end,
})
-- telescope
require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
})
require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>fs', builtin.git_status)

-- lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>')

-- oil
vim.keymap.set('n', '-', '<cmd>Oil<CR>')

-- treesitter
require('autocmds.autosyntax')
require('nvim-treesitter').install({ 'gotmpl' })


