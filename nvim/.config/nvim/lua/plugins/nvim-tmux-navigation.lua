return {
    "alexghergh/nvim-tmux-navigation",
    cond = vim.env.HERDR_ENV ~= '1',
    config = function()
        local nvim_tmux_nav = require("nvim-tmux-navigation")
        nvim_tmux_nav.setup({ disable_when_zoomed = false })

        -- Normal mode: navigate between tmux panes / nvim windows
        vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
        vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
        vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

        -- Terminal mode: exit terminal mode first, then navigate
        local function term_map(key, direction)
            vim.keymap.set('t', "<C-" .. key .. ">",
                ("<C-\\><C-n><cmd>lua require(\"nvim-tmux-navigation\").NvimTmuxNavigate%s()<CR>"):format(direction))
        end
        term_map('h', 'Left')
        term_map('j', 'Down')
        term_map('k', 'Up')
        term_map('l', 'Right')
    end,
}