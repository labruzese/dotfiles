vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.tmpl",
  callback = function(ev)
    local inner = vim.fn.fnamemodify(ev.file, ":r")
    local ft = vim.filetype.match({ filename = inner, buf = ev.buf })
    if not ft then return end
    vim.bo[ev.buf].filetype = ft

    local lang = vim.treesitter.language.get_lang(ft) or ft
    -- Ensure gotmpl parser is ready before patching
    require('nvim-treesitter').install({ 'gotmpl' }):await(function()
      require('autocmds.tmpl_inject').patch(lang)
    end)
  end,
})
