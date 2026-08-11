return
{
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        checkbox = {
            checked = {
                scope_highlight = 'RenderMarkdownCheckedStrike',
            },
        },
    },
    config = function(_, opts)
        vim.api.nvim_set_hl(0, 'RenderMarkdownCheckedStrike', { strikethrough = true, default = true })
        require('render-markdown').setup(opts)
    end,
}
