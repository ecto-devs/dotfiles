return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = true,
        },
        views = {
          cmdline_popup = {
              position = {
                  row = "50%",  -- vertical: "50%" centers it, 5 puts it near top
                  col = "50%",
              },
              size = {
                  width = 60,
                  height = "auto",
              },
          },
      },
    },
}
