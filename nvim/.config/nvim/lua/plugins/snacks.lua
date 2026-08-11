return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Smart Find File", action = ":lua Snacks.picker.smart()" },
          { icon = "", key = "y", desc = "Explore Files (Yazi)", action = ":Yazi" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = "", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()"},
          { icon = "", key = "d", desc = "Dotfiles", action = ":lua Snacks.picker.files({ cwd = '~/Dotfiles', depth = 5, hidden = true })" },
          { icon = " ", key = "c", desc = "Neovim Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
     ██████████   █████████  ███████████    ███████   
    ░░███░░░░░█  ███░░░░░███░█░░░███░░░█  ███░░░░░███ 
     ░███  █ ░  ███     ░░░ ░   ░███  ░  ███     ░░███
     ░██████   ░███             ░███    ░███      ░███
     ░███░░█   ░███             ░███    ░███      ░███
     ░███ ░   █░░███     ███    ░███    ░░███     ███ 
     ██████████ ░░█████████     █████    ░░░███████░  
    ░░░░░░░░░░   ░░░░░░░░░     ░░░░░       ░░░░░░░     
        ]],
      },
      sections = {
        { section = "header" },
            {   
                icon = "",
                title = "",
                section = "keys",
                indent = 2, 
                padding = 1,
                gap = 1
            },
        { section = "startup" },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      sources = {
        projects = {
          dev = { "~/dev", "~/projects", "~/Projects" },
          patterns = { ".git", "package.json", "Makefile", "*" },
        },
        files = { hidden = true },
        smart = { hidden = true },
        explorer = { hidden = true },
      },
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },
  keys = {
    --Find files
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Find w/ Grep" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Neovim Config File" },
    { "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

    --Search
    { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },

    -- Other
    { "<leader>e", function() Snacks.explorer() end, icon = 󱏒, desc =  "Snacks Explorer"},
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>bs", function() Snacks.scratch() end, desc = "Scratch Buffer" },
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>R", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>os")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>ow")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>oL")
        Snacks.toggle.diagnostics():map("<leader>od")
        Snacks.toggle.line_number():map("<leader>ol")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>oc")
        Snacks.toggle.treesitter():map("<leader>oT")
        Snacks.toggle.inlay_hints():map("<leader>oh")
        Snacks.toggle.indent():map("<leader>og")
        Snacks.toggle.dim():map("<leader>oD")
      end,
    })
  end,
}
