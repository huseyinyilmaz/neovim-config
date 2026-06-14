# AGENTS.md — Neovim Config (Neovim 0.12+)

Personal config using lazy.nvim, targeting **Neovim 0.12.x**. Go and Python dev.

## Repository Structure

```
init.lua                           # Entry point: globals → keymaps → lazy
lua/
  config/
    globals.lua                    # vim.opt, treesitter autocmd, PUM keymaps
    keymaps.lua                    # Minimal global keymaps (jk, Space)
    lazy.lua                       # lazy.nvim bootstrap
  plugins/                         # One file per plugin (lazy.nvim spec)
    lsp/
      init.lua                     # Mason + mason-lspconfig + calls handlers directly
      handlers/
        init.lua                   # Barrel module
        utils.lua                  # on_attach, capabilities, set_lsp_completion
        default.lua                # Unused; kept for reference
        gopls.lua                  # vim.lsp.config("gopls", ...)
        pyright.lua                # vim.lsp.config("pyright", ...)
        jsonls.lua                 # vim.lsp.config("jsonls", ...)
        lua_ls.lua                 # vim.lsp.config("lua_ls", ...)
```

## Important Architecture Notes

- **LSP setup** uses Neovim 0.11+ `vim.lsp.config()` API, NOT the old `lspconfig.server.setup()`.
  mason-lspconfig's `automatic_enable` (default on) calls `vim.lsp.enable()` for installed servers.
  Handlers in `lsp/init.lua` register configs synchronously *before* the scheduled `enable_all()`.
  See `lua/plugins/lsp/init.lua:10-15` and each handler file for the pattern.

- **Keymaps live in which-key** (`lua/plugins/whichkey.lua`) using which-key's declarative table format.
  Leader is `<Space>`, set in `config/lazy.lua`. Groups: `<leader>a` (Alpha), `<leader>c` (close),
  `<leader>d` (debug), `<leader>g` (git), `<leader>l` (LSP), `<leader>s` (search),
  `<leader>o` (Opencode), `<leader>t` (tree).

## Commands

```bash
# Validate config loads
nvim --headless -c 'lua print("OK")' -c 'qa'

# Plugin management
:Lazy sync        # install/update/clean
:Lazy check       # list available updates

# Formatting (conform.nvim, runs on save)
# Lua: stylua  |  Python: isort, black --fast  |  Go: goimports, gofmt

# Treesitter (main branch, requires tree-sitter CLI >= 0.26.1)
:TSInstall <lang>   # Add a parser (see manifest in treesitter.lua)
:TSUpdate           # Update all installed parsers
:checkhealth nvim-treesitter

# LSP
:LspRestart <server>
```

## Requirements

- **tree-sitter-cli >= 0.26.1** on PATH (install prebuilt binary from GitHub releases, NOT npm).
- LSP servers installed via Mason (`:Mason`): gopls, pyright, jsonls, lua_ls, rust_analyzer, yamlls, golangci_lint_ls.

## Treesitter

Auto-enables highlighting for bundled parsers (c, lua, vim, vimdoc, markdown, etc.) via ftplugins.
For other languages, a generic `FileType` autocmd in `globals.lua` calls `vim.treesitter.start`.
Parser manifest is in `lua/plugins/treesitter.lua`.

## Code Style (Lua)

- 2-space indent, double quotes, snake_case, trailing commas in multi-line tables.
- No semicolons. No `assert()`/`error()` — use `pcall()` for optional features.
- `local M = {}` / `return M` module pattern. `local setup_<name> = function()` for plugin config.
- `-- FIXME:` for known workarounds. `-- TODO:` for planned changes.
- Format with stylua (automatic via conform.nvim on save).

## Adding a Language Server

1. Add server name to `ensure_installed` in `lua/plugins/lsp/init.lua`.
2. Create `lua/plugins/lsp/handlers/<server>.lua` returning a function that calls `vim.lsp.config()`.
3. Use `utils.on_attach` and `utils.capabilities` from `handlers/utils.lua`.
4. Register in `handlers/init.lua` barrel module.
5. Call the handler from `lua/plugins/lsp/init.lua` (after `mason_lspconfig.setup()`).
