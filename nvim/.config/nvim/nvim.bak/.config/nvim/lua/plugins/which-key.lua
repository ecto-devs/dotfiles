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
            { "<leader>f", group = "Find" },
            { "<leader>g", group = "Git" },
            { "<leader>y", group = "Yazi" },
            { "<leader>c", group = "CD" },
        })
    end,
}
