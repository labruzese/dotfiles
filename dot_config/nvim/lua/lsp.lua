for _, path in ipairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
    local name = vim.fn.fnamemodify(path, ':t:r')
    vim.lsp.enable(name)
end

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
