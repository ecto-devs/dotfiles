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

-- easier quit/write
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "Quit" })
vim.keymap.set('n', '<leader>Q', ':q!<CR>', { desc = "Quit Without Saving" })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "Save" })

-- folding (built-in commands, mapped to themselves just to label them for which-key)
vim.keymap.set('n', 'za', 'za', { desc = "Toggle Fold" })
vim.keymap.set('n', 'zo', 'zo', { desc = "Open Fold" })
vim.keymap.set('n', 'zc', 'zc', { desc = "Close Fold" })
vim.keymap.set('n', 'zR', 'zR', { desc = "Open All Folds" })
vim.keymap.set('n', 'zM', 'zM', { desc = "Close All Folds" })
vim.keymap.set('n', 'zj', 'zj', { desc = "Next Fold" })
vim.keymap.set('n', 'zk', 'zk', { desc = "Previous Fold" })


