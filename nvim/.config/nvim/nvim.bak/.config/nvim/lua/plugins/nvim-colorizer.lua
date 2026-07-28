return {
    "catgoose/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
        require("colorizer").setup({
            filetypes = { "*" },
            exclude = { "pi_terminal" },
            user_default_options = {
                RGB = true,
                RRGGBB = true,
                names = true,
                css = true,
            },
        })
        -- Attach to all currently open buffers (FileType autocmd only fires for new buffers)
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
                local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
                if ft and #ft > 0 and ft ~= "pi_terminal" and not require("colorizer").is_buffer_attached(bufnr) then
                    require("colorizer").attach_to_buffer(bufnr)
                end
            end
        end
    end,
}