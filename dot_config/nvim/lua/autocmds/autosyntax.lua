local nt = require('nvim-treesitter')

local ignored = { qf = true, oil = true, oil_preview = true, harpoon = true, template = true, }

vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
        -- Skip hover floats, help, quickfix, terminals, etc.
        if vim.bo[ev.buf].buftype ~= '' then return end

        local lang = vim.treesitter.language.get_lang(ev.match)
        if not lang or ignored[lang] then return end

        if vim.tbl_contains(nt.get_installed(), lang) then
            vim.treesitter.start(ev.buf)
        else
            nt.install({ lang }):await(function()
                pcall(vim.treesitter.start, ev.buf)
            end)
        end

        -- Only touch window-local options if the current window shows this buffer
        if vim.api.nvim_win_get_buf(0) == ev.buf then
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end
        vim.bo[ev.buf].indentexpr = 'v:lua.vim.treesitter.indentexpr()'
    end,
})
