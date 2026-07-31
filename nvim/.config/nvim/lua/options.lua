-- lua/options.lua

--General Options
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'} --auto-complete options
vim.opt.mouse = 'a'-- Enable mouse use
vim.opt.updatetime = 500 -- Set update time to 300ms (lower = more CursorHold events, can cause lag)
vim.opt.signcolumn = "yes" -- Keep sign column always visible
vim.opt.colorcolumn = ""  -- Disable vertical line 

-- UI Config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.cmdheight = 0               -- set cmd line height to 0 (we are using noice's floating cmd line)

-- Disable cursorline & co in terminal buffers for performance
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
    vim.opt_local.signcolumn = "no"
  end,
})
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.scrolloff = 8               -- Leave a margin vertically when we scroll
vim.opt.lazyredraw = false

-- Tabs
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spaces in tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = true             -- highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered
                                                   
-- Indentings
vim.opt.autoindent = true
vim.opt.smartindent = true










