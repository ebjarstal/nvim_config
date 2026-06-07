# nvim config

## Dependencies

| Dependency | Why | Install |
|---|---|---|
| **Neovim ≥ 0.11** | `nvim-treesitter` is on the `main` branch, which needs 0.11+ (0.12 works; the old `master` branch did **not** support 0.12). | `brew install neovim` |
| **git** | `lazy.nvim` clones plugins; treesitter downloads grammars. | preinstalled / `brew install git` |
| **C compiler** (`cc`/`clang`/`gcc`) | Compiles treesitter parsers. | Xcode CLT (`xcode-select --install`) |
| **`tree-sitter` CLI** | The treesitter `main` branch needs it to build some grammars (e.g. `markdown_inline`, used for `K` hover code blocks). Must be on `PATH`. Homebrew's `tree-sitter` formula ships only the library, not the CLI — use npm. | `npm install -g tree-sitter-cli` |
| **Node.js / npm** | Provides the `tree-sitter` CLI above; also runtime for some LSP servers (`pyright`, `ts_ls`). | `brew install node` |

LSP servers (`lua_ls`, `pyright`, `ts_ls`, `clangd`) are installed automatically by `mason` on first launch — no manual step.

## Setup

Clone into `~/.config/nvim` and start Neovim. `lazy.nvim` bootstraps the plugins; treesitter compiles parsers on first run.
