return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators   = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    { "branch", icon = "" },
                    {"diff", symbols = { added = " ", modified = " ", removed = " " }},
                },
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        symbols = { modified = "●", readonly = "", unnamed = "[No Name]" },
                    },
                },
                lualine_x = {
                    {"diagnostics", sources = {"nvim_lsp"}, symbols = { error = " ", warn = " ", info = " ", hint = "󰌶 " }},
                    { "filetype", icon_only = false },
                    { "encoding" },
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
