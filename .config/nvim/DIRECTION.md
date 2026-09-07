# Neovim Configuration Guide (dnhfan)

## Quick Reference

- **Root**: `~/.config/nvim/`
- **Namespace**: `dnhfan` (all Lua modules under `lua/dnhfan/`)
- **Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Leader key**: `Space`

---

## Directory Structure

```
nvim/
├── init.lua                          # Entry point
├── lazy-lock.json                    # Plugin lockfile (auto-managed by lazy.nvim)
├── lua/
│   └── dnhfan/
│       ├── lazy.lua                  # Bootstrap lazy.nvim + import plugin groups
│       ├── local.lua                 # Per-machine overrides (gitignored pattern)
│       ├── core/
│       │   ├── init.lua              # Loads options, keymaps, system-theme; exports setup()
│       │   ├── options.lua           # Neovim options (tabs, search, clipboard, etc.)
│       │   ├── keymaps.lua           # Global keymaps (non-plugin)
│       │   ├── system-theme.lua      # Detects light/dark via gsettings, monitors changes
│       │   ├── utils.lua             # Shared data: palettes, icon sets, LSP/TS lists, borders
│       │   ├── icons.lua             # File icon definitions (nvim-web-devicons style)
│       │   └── gitbutler.lua         # GitButler TUI launcher
│       ├── lsp/
│       │   ├── init.lua              # Loads custom.lua + keymap-lsp.lua
│       │   ├── custom.lua            # Per-server LSP config overrides (vtsls, eslint, etc.)
│       │   ├── keymap-lsp.lua        # LSP-specific keymaps
│       │   ├── vtsls.lua             # vtsls server config
│       │   └── eslint.lua            # eslint server config
│       ├── plugins/
│       │   ├── ai/                   # AI assistants (copilot, opencode)
│       │   ├── colorschemes/         # One file per colorscheme (conditionally loaded)
│       │   ├── completion/           # Completion engine (blink.cmp)
│       │   ├── language/             # Language layer (treesitter, formatting, linting)
│       │   ├── editor/               # Editing operators (autopairs, surround, substitute)
│       │   ├── navigation/           # File/buffer/window/session navigation
│       │   ├── git/                  # Git workflow (gitsigns, codediff)
│       │   ├── ui/                   # Visual components (statusline, tabs, icons, etc.)
│       │   ├── lsp/                  # LSP plugin specs (lsp.lua, mason.lua)
│       │   ├── tools/                # Utilities (plantuml, markdown-preview, pyworks)
│       │   └── configs/              # Split config modules (complex plugins)
│       │       ├── snacks/           # snacks.nvim config split into opt/key/init/indent
│       │       ├── bufferline/       # bufferline config split into config/offsets/filter/...
│       │       ├── mini-files/       # mini-files config split into init/keymap/border
│       │       ├── lsp/              # LSP UI configs (mason-ui, nvim-lspconfig-ui)
│       │       ├── noice/            # noice config split into routes/cmdline/lsp/view/presets
│       │       ├── codediff/         # codediff config split into diff/keymap/highlights/...
│       │       ├── opencode/         # opencode config (server, keymap, status_extmark, snack_ui)
│       │       ├── figet/            # figet config split into notification/progress/logger
│       │       ├── blink/            # blink.cmp completion config
│       │       └── pyworks/          # pyworks config split into setup/keymap/molten
│       └── scripts/
│           └── hover.lua             # Custom hover script
```

---

## Boot Sequence

1. `init.lua` loads default settings, optionally merges `dnhfan.local` overrides
2. Calls `dnhfan.core.setup(defaults)` which applies buffer-local options
3. `require("dnhfan.lazy")` bootstraps lazy.nvim and imports plugin groups
4. `require("dnhfan.lsp")` sets up LSP servers and keymaps

---

## How Plugins Are Loaded

### Plugin Groups (lazy.nvim imports)

Each directory under `lua/dnhfan/plugins/` is imported via `{ import = "dnhfan.plugins.<group>" }` in `lazy.lua`. Lazy.nvim auto-discovers every `.lua` file in that directory and treats each as a plugin spec.

Import order in `lazy.lua`:
1. `colorschemes` - Load colorscheme first
2. `ai` - AI assistants
3. `lsp` - LSP core (mason, lspconfig)
4. `completion` - Completion engine
5. `language` - Treesitter, formatting, linting
6. `editor` - Editing operators
7. `navigation` - Files, buffers, windows, sessions
8. `git` - Git workflow
9. `ui` - Visual components
10. `tools` - Remaining utilities

### Plugin Spec Format

Every file must `return` a lazy.nvim spec table. Three patterns are used:

#### Pattern 1: Inline config (simple plugins)

```lua
-- lua/dnhfan/plugins/editor/autopairs.lua
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
  end,
}
```

#### Pattern 2: opts-only (simple setup, no keymaps)

```lua
-- lua/dnhfan/plugins/git/gitsigns.lua
return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  opts = {
    -- passed directly to require("gitsigns").setup(opts)
  end,
}
```

#### Pattern 3: Split config (complex plugins)

For plugins with large configs, split into files under `lua/dnhfan/plugins/configs/<plugin>/`:

```lua
-- lua/dnhfan/plugins/navigation/snacks.lua
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts   = require("dnhfan.plugins.configs.snacks.opt"),
  keys   = require("dnhfan.plugins.configs.snacks.key"),
  init   = require("dnhfan.plugins.configs.snacks.init"),
}
```

The referenced files return tables/functions that lazy.nvim consumes directly.

### Lazy-loading triggers

- `event` - Load on Vim event (e.g., `"BufReadPost"`, `"VeryLazy"`, `"InsertEnter"`)
- `ft` - Load on filetype
- `cmd` - Load on command
- `keys` - Load on keymap
- `lazy = false` - Load immediately at startup
- `dependencies` - Load before the parent plugin

---

## Adding a New Plugin

### Step 1: Choose the right category directory

| Directory | Purpose |
|-----------|---------|
| `plugins/ai/` | AI assistants (copilot, opencode) |
| `plugins/completion/` | Completion engine (blink.cmp, sources, snippets) |
| `plugins/language/` | Language layer (treesitter, formatting, linting, textobjects) |
| `plugins/editor/` | Editing operators (autopairs, surround, substitute, tabout) |
| `plugins/navigation/` | File/buffer/window/session navigation (snacks, mini-files, etc.) |
| `plugins/git/` | Git workflow (gitsigns, codediff) |
| `plugins/ui/` | Visual components (statusline, tabs, icons, notifications, etc.) |
| `plugins/lsp/` | LSP-related plugin specs |
| `plugins/tools/` | Utilities (plantuml, markdown-preview, pyworks) |
| `plugins/colorschemes/` | Colorscheme definitions |

### Step 2: Create the plugin spec file

**File path**: `lua/dnhfan/plugins/<category>/<plugin-name>.lua`

**Naming convention**: `<plugin-name>.lua` matching the plugin repo name (e.g., `bufferline.lua`, `nvim-treesitter.lua`).

### Step 3: Write the spec

#### Simple plugin (inline config)

```lua
-- lua/dnhfan/plugins/editor/my-plugin.lua
return {
  "author/my-plugin.nvim",
  event = "BufReadPost",  -- or ft, cmd, keys, lazy=false
  dependencies = {},       -- optional
  opts = {
    -- options passed to setup()
  },
  config = function(_, opts)
    require("my-plugin").setup(opts)
  end,
}
```

#### Complex plugin (split config)

1. Create config directory: `lua/dnhfan/plugins/configs/my-plugin/`
2. Create files for each concern:
   - `opt.lua` - returns opts table
   - `key.lua` - returns keymaps table
   - `init.lua` - returns init function (autocmds, global setup)
   - `custom.lua` - any custom logic
3. Reference them in the plugin spec:

```lua
-- lua/dnhfan/plugins/language/my-plugin.lua
return {
  "author/my-plugin.nvim",
  event = "VeryLazy",
  opts   = require("dnhfan.plugins.configs.my-plugin.opt"),
  keys   = require("dnhfan.plugins.configs.my-plugin.key"),
  init   = require("dnhfan.plugins.configs.my-plugin.init"),
}
```

### Step 4: Add keymaps

Add keymaps either:
- **In the plugin spec** via `keys = { ... }` (lazy-loaded with the plugin)
- **In `plugins/configs/<plugin>/key.lua`** for split configs
- **In `core/keymaps.lua`** only for global, non-plugin keymaps

### Step 5: Add dependencies

Use the `dependencies` field in the spec. For Mason-managed tools, add to the lists in `core/utils.lua`:

```lua
-- core/utils.lua
U.lsp_servers = { "lua_ls", "pyright", ... }      -- auto-installed by mason-lspconfig
U.lsp_formatters = { "prettier", "stylua", ... }   -- auto-installed by mason-tool-installer
U.treesitter_parsers = { "lua", "javascript", ... } -- auto-installed by treesitter
```

---

## Shared Utilities

### `core/utils.lua` - Central data

| Export | Purpose |
|--------|---------|
| `dark_palette` / `light_palette` | Catppuccin color palettes (used for dynamic theming) |
| `sign_icons` | Diagnostic/git signs icons |
| `lsp_servers` | List of LSP servers for mason auto-install |
| `lsp_formatters` | List of formatters/linters for mason auto-install |
| `treesitter_parsers` | List of parsers for treesitter auto-install |
| `border` | Float window border style |
| `spinner_frames` | LSP loading spinner |

### `core/system-theme.lua` - Theme detection

Automatically sets `vim.o.background` based on system (GNOME) light/dark preference and monitors changes in real-time. Colorscheme plugins use this to adapt.

### `core/local.lua` - Per-machine overrides

Override any default setting from `init.lua` without touching tracked files. This file is meant to be machine-specific (keep out of git or use gitignore).

---

## LSP Setup

### Adding a new LSP server

1. Add server name to `U.lsp_servers` in `core/utils.lua` (auto-installed by Mason)
2. If custom config needed, create `lsp/<server-name>.lua` and add to `custom_configs` in `lsp/custom.lua`
3. Add server-specific keymaps in `lsp/keymap-lsp.lua`

### LSP config override example

```lua
-- lsp/vtsls.lua (existing example)
return {
  settings = {
    typescript = {
      inlayHints = { ... },
    },
  },
}
```

---

## Colorscheme Convention

Each colorscheme file conditionally loads based on `vim.b.colorscheme`:

```lua
-- plugins/colorschemes/catppuccin.lua
return vim.b.colorscheme ~= "catppuccin" and {}
    or {
      "catppuccin/nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("catppuccin").setup({ ... })
        vim.cmd.colorscheme "catppuccin"
      end,
    }
```

Only the active colorscheme (set in `init.lua` defaults or `local.lua`) actually loads.

---

## Important Conventions

1. **File naming**: `<plugin-name>.lua` for specs, snake_case for config modules
2. **Module path**: Always `dnhfan.<module>` (not relative paths)
3. **No comments in specs**: Keep plugin specs clean, use config file comments instead
4. **Buffer-local options**: Use `vim.b.*` in `core/init.lua` for theme settings that affect rendering
5. **Lazy-loading**: Default to event-based loading unless plugin requires immediate load
6. **Config split**: Only split configs that are >50 lines or have multiple concerns (opts/keys/init)
7. **Icon usage**: Pull from `core/utils.lua` icon sets, not hardcoded
