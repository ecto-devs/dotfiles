return
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        require('nvim-autopairs').setup({})

        vim.keymap.set('i', '<C-CR>', function()
            local closers = { ')', ']', '}', '"', "'", '`' }
            local line = vim.api.nvim_get_current_line()
            local row, col = unpack(vim.api.nvim_win_get_cursor(0))
            local char = line:sub(col + 1, col + 1)
            if vim.tbl_contains(closers, char) then
                vim.api.nvim_win_set_cursor(0, { row, col + 1 })
            end
        end, { desc = "Escape pair" })
    end,
}
