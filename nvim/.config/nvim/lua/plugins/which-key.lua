return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 300,
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
            { "<leader>f", icon = "󰮗", group = "Find" },
            { "<leader>g", icon = "", group = "Git" },
            { "<leader>s", icon = "", group = "Search" },
            { "<leader>o", icon = "", group = "Options" },
            { "<leader>b", icon = "", group = "Buffers" },
            { "z", icon = "", group = "Fold" },

        })
    end,
}
