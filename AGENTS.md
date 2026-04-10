# AGENTS.md — Neovim Config (Neovim 0.12+)

Personal Neovim configuration using lazy.nvim as plugin manager, targeting
**Neovim 0.12.x**. Primary development languages: Go and Python.

## Repository Structure

```
init.lua                        # Entry point: globals → keymaps → lazy
lua/
  config/
    globals.lua                 # vim.opt settings, treesitter autocmd
    keymaps.lua                 # Minimal global keymaps (jk, Space)
    lazy.lua                    # lazy.nvim bootstrap and setup
  plugins/                      # One file per plugin (lazy.nvim specs)
    lsp/
      init.lua                  # Mason + mason-lspconfig specs
      handlers/
        init.lua                # Barrel module re-exporting all handlers
        utils.lua               # Shared on_attach, capabilities, diagnostics
        default.lua             # Fallback handler for unlisted LSP servers
        gopls.lua               # Go LSP config
        pyright.lua             # Python LSP config
        jsonls.lua              # JSON LSP config (with schema store)
        lua_ls.lua              # Lua LSP config (vim-aware)
```

## Build / Lint / Test Commands

This is a Neovim config — there is no build system, test suite, or CI pipeline.

```bash
# Validate config loads without errors
nvim --headless -c 'lua print("OK")' -c 'qa'

# Run checkhealth (inside Neovim)
:checkhealth

# Sync plugins (install/update/clean)
:Lazy sync

# Check for plugin updates (background checker is disabled)
:Lazy check

# Format Lua files (configured via none-ls)
# stylua is the Lua formatter; runs on save via none-ls
# Other formatters: gofmt, goimports (Go), black, isort (Python)

# Treesitter parser management
:TSUpdate              # Update all installed parsers
:TSInstall <lang>      # Install a specific parser
```

## Neovim 0.12 Constraints

This config includes workarounds for Neovim 0.12 treesitter bugs:

- **Bundled parsers** (c, lua, vim, vimdoc, markdown, markdown_inline, query)
  must NOT be installed via nvim-treesitter — they conflict with Neovim's
  bundled runtime queries. They are in `ignore_install` in `treesitter.lua`.
- **Neovim auto-enables treesitter highlighting** for bundled parsers via
  ftplugins. The `FileType` autocmd in `globals.lua` only activates
  highlighting for plugin-installed parsers (go, python, rust, etc.).
- **lazy.nvim's background checker** is disabled because `vim.wait()` triggers
  an async treesitter parsing race condition. Use `:Lazy check` manually.
- **Runtime patches** exist in `runtime/lua/vim/treesitter.lua` and
  `runtime/lua/vim/treesitter/languagetree.lua` to guard against nil/stale
  TSNode userdata. These will be overwritten on Neovim updates.

## Code Style Guidelines

### Indentation and Formatting

- **2 spaces**, tabs expanded (`expandtab`, `shiftwidth=2`, `tabstop=2`).
- No enforced line length limit; keep lines under ~120 chars when practical.
- No semicolons.
- Use trailing commas in multi-line tables.
- Format Lua with `stylua` (runs automatically via none-ls on save).

### Strings and Quoting

- Prefer **double quotes** for all strings: `"string"`.
- `require` calls use double quotes with parentheses: `require("module")`.
  - Exception: `init.lua` uses `require "config.globals"` (no parens).

### Naming Conventions

- **snake_case** for all variables, functions, and file names.
- Module tables: uppercase `M` (`local M = {}` / `return M`).
- Setup functions: `local setup_<plugin> = function() ... end`.
- No camelCase for user-defined identifiers.

### Module Patterns

Plugin spec files return a lazy.nvim spec table (or list of tables):

```lua
-- Simple plugin
return {
  "author/plugin.nvim",
  event = "VeryLazy",
}

-- Complex plugin with setup function defined above return
local setup_foo = function()
  require("foo").setup({ ... })
end

return {
  "author/foo.nvim",
  dependencies = { "dep/bar.nvim" },
  config = setup_foo,
}
```

LSP handler files return a **function** (called by mason-lspconfig):

```lua
local lspconfig = require("lspconfig")
local utils = require("plugins.lsp.handlers.utils")

return function()
  lspconfig.server_name.setup({
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
    settings = { ... },
  })
end
```

### Plugin Spec Conventions (lazy.nvim)

- Use `config = named_function` for complex setup logic.
- Use `opts = { ... }` for simple declarative config.
- Use `config = function() ... end` for short inline setup (< 5 lines).
- Specify `event`, `ft`, or `cmd` for lazy loading when appropriate.
- Set `priority` only for colorscheme (1000) and bufferline (9999).
- Set `lazy = false` only for the colorscheme (must load eagerly).
- Dependencies go in `dependencies = { ... }`.
- Build steps go in `build = "..."` (e.g., `:TSUpdate`, `make`).

### Keymaps

- Most keymaps are defined in `plugins/whichkey.lua` using which-key's
  declarative table format — not scattered across plugin files.
- Leader key is `<Space>`, set in `config/lazy.lua`.
- Groups: `<leader>a` (Alpha), `<leader>c` (close), `<leader>d` (debug),
  `<leader>l` (LSP), `<leader>s` (search/telescope), `<leader>m` (harpoon),
  `<leader>o` (OpenCode), `<leader>t` (tree).
- Use `vim.keymap.set()` for keymaps inside plugin `on_attach` or `config`.
- Always include `desc = "..."` for discoverability.

### Error Handling

- Use `pcall()` for calls that may fail (treesitter, optional plugins).
- Do not use `assert()` or `error()` — let errors propagate or swallow
  with pcall for non-critical functionality.

### Comments

- Single-line `--` comments only (no block comments `--[[ ]]`).
- Use `-- FIXME:` for known issues with workarounds.
- Use `-- TODO:` for planned improvements.
- Inline comments after settings to explain purpose (see `globals.lua`).
- Reference URLs on the line above relevant code.
- Commented-out code is acceptable for preserving alternative configs.

### Type Annotations

- Not widely used. Only add `---@module` and `---@type` annotations when
  they come from plugin documentation for `opts` typing.

### LSP Handler Pattern

When adding a new language server:

1. Add server name to `ensure_installed` in `lua/plugins/lsp/init.lua`.
2. Create `lua/plugins/lsp/handlers/<server>.lua` returning a function.
3. Use `utils.on_attach` and `utils.capabilities` from `handlers/utils.lua`.
4. Register in `handlers/init.lua` barrel module.
5. Add to the `handlers` table in `lsp/init.lua` setup.
6. Servers without custom config use the `default` handler automatically.
