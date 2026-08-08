-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- i fat finger macro recording a lot, so disable that
vim.keymap.set({ "n", "x" }, "q:", "<nop>")
vim.keymap.set({ "n", "x" }, "q/", "<nop>")   -- search history window
vim.keymap.set({ "n", "x" }, "q?", "<nop>")

-- < and > change indenting in
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


