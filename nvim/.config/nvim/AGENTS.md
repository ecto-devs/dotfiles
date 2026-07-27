# Neovim Configuration AGENTS.md

This directory contains a Neovim configuration using lazy.nvim for plugin management.

## Project Overview

- **Type**: Neovim dotfiles configuration
- **Language**: Lua
- **Plugin Manager**: lazy.nvim
- **Structure**: Modular plugin specs in `lua/plugins/`

## Directory Structure

```
nvim/.config/nvim/
├── init.lua              -- Entry point, loads options, keymaps, plugins
├── lua/
│   ├── plugins.lua       -- lazy.nvim bootstrap, auto-imports lua/plugins/
│   ├── plugins/          -- Each file is auto-loaded as a plugin spec
│   │   ├── blink-cmp.lua
│   │   ├── lazygit.lua
│   │   ├── mason.lua
│   │   ├── nvim-tmux-navigation.lua
│   │   ├── rose-pine.lua
│   │   ├── snacks.lua
│   │   ├── telescope.lua
│   │   ├── which-key.lua
│   │   └── yazi.lua
│   ├── keymaps.lua       -- Keyboard mappings
│   └── options.lua       -- Neovim settings
└── lazy-lock.json        -- Locked plugin versions
```

## Commands

### Validate Lua Syntax

```bash
# Check syntax of all Lua files
luac -p lua/*.lua lua/**/*.lua lua/**/**/*.lua

# Or use nvim -l to check on load
nvim --headless -c "lua dofile('lua/options.lua')" -c "q" 2>&1
```

### Test Configuration

```bash
# Start Neovim with verbose output
nvim --version

# Check plugin loading
nvim --headless -c "lua require('lazy').sync({ wait = true })" -c "lua vim.print(vim.fn.stdpath('data'))" -c "q"

# List loaded plugins
nvim --headless -c "lua for k,_ in pairs(require('lazy').plugins()) do print(k) end" -c "q"
```

### Lazy.nvim Management

```bash
# Lazy commands (inside nvim)
:Lazy          -- Open lazy.nvim UI
:Lazy sync     -- Sync plugins
:Lazy update   -- Update plugins
:Lazy clean    -- Remove unused plugins
:Lazy check    -- Check for broken plugins
:Lazy profile  -- Show performance profile
```

## Code Style Guidelines

### General Conventions

- **Line Length**: Keep lines under 100 characters when practical
- **Indentation**: 4 spaces (Lua standard for Neovim configs)
- **No trailing whitespace**
- **One blank line at end of file**

### Imports and Requires

```lua
-- Local variables for requires (preferred)
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Plugin specs return a table
return {
  "owner/repo",
  opts = {},
}
```

### Naming Conventions

- **Files**: snake_case.lua (e.g., `blink-cmp.lua`, `rose-pine.lua`)
- **Variables**: camelCase or snake_case consistently within a file
- **Plugin specs**: Use the plugin's GitHub repo name as the spec key

### Plugin Spec Format

Each plugin should be in its own file under `lua/plugins/`:

```lua
-- lua/plugins/<plugin-name>.lua
return {
  "owner/plugin-name",
  -- Optional: custom name if repo name is unwieldy
  name = "short-name",
  -- Optional: dependencies
  dependencies = { "owner/dep1" },
  -- Optional: version/tag (for release versions)
  version = "*",
  -- Optional: lazy loading config
  event = "VeryLazy",
  -- opts table (merged with plugin's default opts)
  opts = {},
  -- or opts function for dynamic config
  config = function()
    -- setup code
  end,
}
```

### Keymaps

```lua
-- Use vim.keymap.set with opts table
local opts = {
  noremap = true,
  silent = true,
}

vim.keymap.set('n', '<leader>ff', function() print('hello') end, opts)
```

### Error Handling

```lua
-- Use pcall for optional plugin loading
local ok, mod = pcall(require, "optional-plugin")
if ok then
  mod.setup({})
end

-- Use vim.notify for user feedback (not print)
vim.notify("Plugin loaded", vim.log.levels.INFO)
```

### Options/Settings

```lua
-- Use vim.opt (not vim.o for new configs)
vim.opt.number = true
vim.opt.expandtab = true

-- Group related settings with comments
-- UI Config
vim.opt.splitbelow = true
vim.opt.splitright = true
```

## Adding New Plugins

1. Create `lua/plugins/<plugin-name>.lua` with the spec (a `return { ... }` table)
2. Run `:Lazy sync` in Neovim to install
3. Test the plugin works

No other files need to be modified -- lazy.nvim auto-imports all files in `lua/plugins/`.

## Common Lazy.nvim Patterns

```lua
-- Lazy loading by event
event = "BufReadPre",

-- Lazy loading by keymap
keys = {
  { "<leader>ff", ":Telescope find_files<cr>", desc = "Find files" }
},

-- Conditional loading with ft
ft = "python",  -- only for Python files
```

## Testing Changes

1. Start Neovim fresh: `nvim --clean`
2. Check for errors: `:checkhealth` or `:lua vim.lsp.start()`
3. Verify plugins load: `:Lazy`
4. Test keymaps work in clean session
