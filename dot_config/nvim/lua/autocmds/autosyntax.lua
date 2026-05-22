local nt = require('nvim-treesitter')

local ignored = { qf = true, oil = true, oil_preview = true, harpoon = true}

vim.api.nvim_create_autocmd('FileType', {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)

		if not lang or ignored[lang] then
			return
		end

		if vim.tbl_contains(nt.get_installed(), lang) then
			vim.treesitter.start(ev.buf)
		else
			nt.install({ lang }):await(function()
				pcall(vim.treesitter.start, ev.buf)
			end)
		end

		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.bo[ev.buf].indentexpr = 'v:lua.vim.treesitter.indentexpr()'
	end,
})
