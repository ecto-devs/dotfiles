return {
    "abecodes/tabout.nvim",
    event = "InsertCharPre",
    priority = 1000,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        tabkey = "<Tab>",
        backwards_tabkey = "<S-Tab>",
        act_as_tab = true,
        act_as_shift_tab = false,
        enable_backwards = true,
        completion = false,
        ignore_beginning = true,
    },
}
