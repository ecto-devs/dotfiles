vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require("options")
require("keymaps")
require("lazy-bootstrap")

-- Make terminal background transparent (overrides colorscheme bg)
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })

-- clipboard works via ssh
if vim.fn.has("mac") == 1 then
    vim.g.clipboard = {
      name = "pbcopy",
      copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy",
      },
      paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste",
      },
      cache_enabled = true,
    }
  else
    vim.g.clipboard = {
      name = "wl-clipboard",
      copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy",
      },
      paste = {
        ["+"] = "wl-paste",
        ["*"] = "wl-paste",
      },
      cache_enabled = true,
    }
  end 
