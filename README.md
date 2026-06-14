My Neo-Vim Configuration
========================

To Install
----------
- Install Neovim.
    Since a lot of plugins required newer version of neovim. It is best to just download the binary and put it on your path.
    You can find the prebuilt binary from github release page for neovim: https://github.com/neovim/neovim/releases
    Download the binary extract it somewhere and put a soft link somewhere in your path to install.
- Install configuration. 
    Neovim config in linux is in ~/.config/nvim directory. you can just download the configuration there.

```
❯ git clone git@github.com:huseyinyilmaz/neovim-config.git ~/.config/nvim
```

Requirements
------------
- **tree-sitter CLI (>= 0.26.1)** — required by nvim-treesitter (`main` branch).
  Download the prebuilt binary from
  https://github.com/tree-sitter/tree-sitter/releases
  (asset: `tree-sitter-cli-linux-x64.zip`), unzip it, and place the
  `tree-sitter` binary somewhere on your `$PATH` (e.g., `~/.local/bin/`).
  Do **not** install via npm — the npm package is out of date.

Other Resources:
---------------

https://github.com/sadiksaifi/nvim
