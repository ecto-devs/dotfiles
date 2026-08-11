return {
  "epwalsh/obsidian.nvim",
  version = "*",
  ft = "markdown",
  keys = {
    { "<leader>mx", "<cmd>ObsidianToggleCheckbox<CR>", desc = "Toggle checkbox" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Obsidian",
      },
    },
  },
}
