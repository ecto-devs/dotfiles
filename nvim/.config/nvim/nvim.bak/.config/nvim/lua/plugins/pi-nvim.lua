return {
  "kurochenko/pi.nvim",
  dependencies = {
    { "folke/snacks.nvim", optional = true },
  },
  config = function()
    require("pi").setup({
      -- your overrides here (see Configuration)
    })
  end,
}
