return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local rose_pine_colors = {
            base    = "#232136",
            surface = "#2a283e",
            overlay = "#393552",
            muted   = "#6e6a86",
            subtle  = "#908caa",
            text    = "#e0def4",
            love    = "#eb6f92",
            gold    = "#f6c177",
            rose    = "#ebbcba",
            pine    = "#31748f",
            foam    = "#9ccfd8",
            iris    = "#c4a7e7",
            hl_high = "#56526e",
        }

        local theme = {
            normal = {
                a = { fg = rose_pine_colors.base,    bg = rose_pine_colors.foam,    gui = "bold" },
                b = { fg = rose_pine_colors.text,    bg = rose_pine_colors.surface },
                c = { fg = rose_pine_colors.subtle,  bg = rose_pine_colors.base },
            },
            insert = {
                a = { fg = rose_pine_colors.base, bg = rose_pine_colors.iris, gui = "bold" },
                b = { fg = rose_pine_colors.text, bg = rose_pine_colors.surface },
            },
            visual = {
                a = { fg = rose_pine_colors.base, bg = rose_pine_colors.rose, gui = "bold" },
                b = { fg = rose_pine_colors.text, bg = rose_pine_colors.surface },
            },
            replace = {
                a = { fg = rose_pine_colors.base, bg = rose_pine_colors.love, gui = "bold" },
                b = { fg = rose_pine_colors.text, bg = rose_pine_colors.surface },
            },
            command = {
                a = { fg = rose_pine_colors.base, bg = rose_pine_colors.gold, gui = "bold" },
                b = { fg = rose_pine_colors.text, bg = rose_pine_colors.surface },
            },
            inactive = {
                a = { fg = rose_pine_colors.muted,  bg = rose_pine_colors.base },
                b = { fg = rose_pine_colors.muted,  bg = rose_pine_colors.base },
                c = { fg = rose_pine_colors.muted,  bg = rose_pine_colors.base },
            },
        }

        require("lualine").setup({
            options = {
                theme = theme,
                component_separators = { left = "", right = "" },
                section_separators   = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    { "branch", icon = "" },
                    {
                        "diff",
                        symbols = { added = " ", modified = " ", removed = " " },
                        diff_color = {
                            added    = { fg = rose_pine_colors.foam },
                            modified = { fg = rose_pine_colors.gold },
                            removed  = { fg = rose_pine_colors.love },
                        },
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        symbols = { modified = "●", readonly = "", unnamed = "[No Name]" },
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        symbols = { error = " ", warn = " ", info = " ", hint = "󰌶 " },
                        diagnostics_color = {
                            error = { fg = rose_pine_colors.love },
                            warn  = { fg = rose_pine_colors.gold },
                            info  = { fg = rose_pine_colors.foam },
                            hint  = { fg = rose_pine_colors.iris },
                        },
                    },
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
