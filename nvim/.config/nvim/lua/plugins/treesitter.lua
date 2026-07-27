return {
  "nvim-treesitter/nvim-treesitter",
  enabled = function()
    return vim.bo.filetype ~= "pi_terminal"
  end,
  opts = {
    ensure_installed = { "markdown", "markdown_inline" },
    highlight = {
      enable = true,
    },
  },
}
