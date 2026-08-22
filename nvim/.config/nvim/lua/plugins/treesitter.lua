return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "markdown", "markdown_inline",
      "lua", "vim", "vimdoc",
      "python", "sql",
      "javascript", "typescript", "tsx",
      "rust", "yaml", "json", "bash",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "pi_terminal" then
          return
        end
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
