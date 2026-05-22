local M = {}
local patched = {}

local gotmpl_query = [[
((ERROR) @injection.content
  (#match? @injection.content "{{")
  (#set! injection.language "gotmpl")
  (#set! injection.combined))
]]

function M.patch(lang)
  if patched[lang] then return end
  patched[lang] = true

  -- Read all existing injection query files for this lang and combine
  local existing = {}
  for _, f in ipairs(vim.treesitter.query.get_files(lang, 'injections')) do
    existing[#existing + 1] = table.concat(vim.fn.readfile(f), '\n')
  end
  existing[#existing + 1] = gotmpl_query

  pcall(vim.treesitter.query.set, lang, 'injections', table.concat(existing, '\n'))
end

return M
