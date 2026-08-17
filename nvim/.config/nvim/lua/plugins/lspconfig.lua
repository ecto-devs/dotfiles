return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "pyright", "yamlls" },
    })

    -- :LspLog isn't built-in on Neovim 0.12 but nvim-lspconfig skips
    -- defining it when ':lsp' exists (which it does in 0.12).
    vim.schedule(function()
      if vim.fn.exists(":LspLog") ~= 2 then
        vim.api.nvim_create_user_command("LspLog", function()
          vim.cmd("tabnew " .. vim.lsp.log.get_filename())
        end, {})
      end
    end)

    -- Prefer LSP folding ranges over treesitter when the server supports them
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method('textDocument/foldingRange') then
          local win = vim.api.nvim_get_current_win()
          vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
      end,
    })
  end,
}
