vim.lsp.config['lua_ls'] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	}
}

vim.lsp.config['rust-analyzer'] = {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	root_markers = { '.rust-analyzer-root', 'Cargo.toml', '.git' }
}

vim.lsp.config['clangd'] = {
	cmd = { 'clangd' },
	filetypes = { 'c', 'cpp' },
	root_markers = { { 'compile_commands.json', 'compile_flags.txt', '.clangd' }, '.git' },
}

vim.lsp.config['ocamllsp'] = {
	cmd = { 'ocamllsp' },
	filetypes = { 'ocaml' },
	root_markers = { { 'dune-project', '*.opam' }, '.git' },
}

vim.lsp.config['hls'] = {
	cmd = { 'haskell-language-server-wrapper', '--lsp' },
	filetypes = { 'haskell', 'lhaskell' },
	root_markers = { { 'hie.yaml', 'stack.yaml', 'cabal.project', '*.cabal', 'package.yaml' }, '.git' },
}

vim.lsp.config['kotlin-lsp'] = {
	cmd = { 'kotlin-lsp', '--stdio' },
	filetypes = { 'kotlin' },
	root_markers = { { 'build.gradle', 'pom.xml', 'build.gradle.kts' }, '.git' },
}

vim.lsp.config['zls'] = {
	cmd = { 'zls' },
	filetypes = { 'zig' },
	root_markers = { { 'build.zig', 'build.zig.zon' }, '.git' },
}

vim.lsp.config['pyright'] = {
	cmd = { 'pyright-langserver', '--stdio' },
	filetypes = { 'python' },
	root_markers = { '.git' }
}


vim.lsp.enable('lua_ls')
vim.lsp.enable('rust-analyzer')
vim.lsp.enable('clangd')
vim.lsp.enable('ocamllsp')
vim.lsp.enable('hls')
vim.lsp.enable('kotlin-lsp')
vim.lsp.enable('zls')
vim.lsp.enable('pyright')

vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.keymap.set('i', '<c-space>', function()
	vim.lsp.completion.get()
end)

vim.keymap.set('n', '<leader>e', vim.diagnostic.setqflist)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
