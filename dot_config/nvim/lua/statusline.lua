function HARPOON_STATUS()
	local harpoon = require('harpoon')
	local list = harpoon:list()
	local current = vim.fn.expand('%:p:.')

	for i, item in ipairs(list.items) do
		if item.value == current then
			return '󰛢' .. i .. ' '
		end
	end
	return ''
end


vim.o.statusline = table.concat({
	'%<',
	'%f ',
	'%{%v:lua.HARPOON_STATUS()%}',
	'%h%w%m%r ',
	"%{% v:lua.require('vim._core.util').term_exitcode() %}",
	'%=',
	"%{% luaeval('(package.loaded[''vim.ui''] and vim.api.nvim_get_current_win() == tonumber(vim.g.actual_curwin or -1) and vim.ui.progress_status()) or '''' ')%}",
	"%{% &showcmdloc == 'statusline' ? '%-10.S ' : '' %}",
	"%{% exists('b:keymap_name') ? '<'..b:keymap_name..'> ' : '' %}",
	"%{% &busy > 0 ? '◐ ' : '' %}",
	"%{% luaeval('(package.loaded[''vim.diagnostic''] and next(vim.diagnostic.count()) and vim.diagnostic.status() .. '' '') or '''' ') %}",
	"%{% &ruler ? ( &rulerformat == '' ? '%-14.(%l,%c%V%) %P' : &rulerformat ) : '' %}",
})
