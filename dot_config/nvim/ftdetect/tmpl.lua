vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.tmpl",
  callback = function(ev)
    local inner = vim.fn.fnamemodify(ev.file, ":r")
    local ft = vim.filetype.match({ filename = inner, buf = ev.buf })
    if not ft then return end
    vim.bo[ev.buf].filetype = ft

    local lang = vim.treesitter.language.get_lang(ft) or ft
    local nt   = require('nvim-treesitter')

    local function patch_and_refresh()
      local newly = require('autocmds.tmpl_inject').patch(lang)
      if newly and vim.api.nvim_buf_is_valid(ev.buf) then
        pcall(vim.treesitter.stop,  ev.buf)
        pcall(vim.treesitter.start, ev.buf, lang)
      end
    end

    if vim.tbl_contains(nt.get_installed(), 'gotmpl') then
      patch_and_refresh()
    else
      nt.install({ 'gotmpl' }):await(vim.schedule_wrap(patch_and_refresh))
    end
  end,
})
