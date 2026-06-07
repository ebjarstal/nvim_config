# nvim config

A portable Neovim configuration built around [`lazy.nvim`](https://github.com/folke/lazy.nvim).
Clone it into `~/.config/nvim` on any machine and Neovim bootstraps everything on first launch — plugins, LSP servers, and treesitter parsers install themselves.

## Quick start

```sh
# back up any existing config first
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

git clone <this-repo-url> ~/.config/nvim
nvim
```

On the first launch `lazy.nvim` clones itself, installs the plugins, `mason` downloads the LSP servers, and treesitter compiles its parsers. Let it finish, then quit and reopen. The pinned plugin versions in `lazy-lock.json` are restored automatically, so every device runs the exact same set.

## Dependencies

These are the only things that must already be on the machine. Everything else is handled by the config.

| Dependency | Why | Install |
|---|---|---|
| **Neovim ≥ 0.11** | `nvim-treesitter` is on the `main` branch, which needs 0.11+. The config also uses the 0.11 `vim.lsp.config` API. | macOS: `brew install neovim` · Debian/Ubuntu: `sudo apt install neovim` (or the [unofficial PPA](https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable) / [AppImage](https://github.com/neovim/neovim/releases) for a recent enough build) · Arch: `sudo pacman -S neovim` · Windows: `winget install Neovim.Neovim` |
| **git** | `lazy.nvim` clones plugins; treesitter downloads grammars. | macOS: preinstalled / `brew install git` · Linux: your package manager · Windows: `winget install Git.Git` |
| **C compiler** (`cc` / `clang` / `gcc`) | Compiles treesitter parsers. | macOS: `xcode-select --install` · Debian/Ubuntu: `sudo apt install build-essential` · Arch: `sudo pacman -S base-devel` · Windows: `winget install LLVM.LLVM` (or MSVC / mingw) |
| **`tree-sitter` CLI** | The treesitter `main` branch needs it to build some grammars (e.g. `markdown_inline`, used for `K` hover code blocks). Must be on `PATH`. Homebrew's `tree-sitter` formula ships only the library, not the CLI — use npm. | `npm install -g tree-sitter-cli` |
| **Node.js / npm** | Provides the `tree-sitter` CLI above; also the runtime for some LSP servers (`pyright`, `ts_ls`). | macOS: `brew install node` · Linux: your package manager or [nvm](https://github.com/nvm-sh/nvm) · Windows: `winget install OpenJS.NodeJS` |

LSP servers (`lua_ls`, `pyright`, `ts_ls`, `clangd`) are installed automatically by `mason` on first launch — no manual step. A working internet connection is required the first time so plugins, parsers, and servers can download.

## Layout

```
.
├── init.lua                  -- core options, leader keys, transparent bg
├── lazy-lock.json            -- pinned plugin versions (keeps devices in sync)
└── lua/
    ├── config/
    │   └── lazy.lua          -- lazy.nvim bootstrap + setup
    └── plugins/              -- one file per plugin, auto-imported
        ├── telescope.lua     -- fuzzy finder
        ├── lsp.lua           -- mason + lspconfig
        ├── treesitter.lua    -- syntax highlighting
        ├── completion.lua    -- nvim-cmp autocompletion
        └── which-key.lua     -- keymap hints
```

Everything in `lua/plugins/` is imported automatically by `lazy.nvim`, so adding a plugin is just a matter of dropping a new file in that directory.

## What's configured

**Editor** (`init.lua`)
- Relative + absolute line numbers
- 4-space indentation (`expandtab`)
- Leader key is `<Space>`, local leader is `\`
- Transparent background (terminal background shows through)
- `<Esc>` leaves terminal-mode

**Plugins**
- **telescope** — fuzzy finder (its treesitter previewer is disabled, see note below)
- **mason + lspconfig** — auto-installs and wires up LSP servers
- **nvim-treesitter** (`main` branch) — syntax highlighting; parsers installed imperatively
- **nvim-cmp** — completion from LSP, buffer, and path sources
- **which-key** — pops up keymap hints after the leader key

## Keymaps

Leader is `<Space>`.

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Search help |
| `<leader>fd` | Show diagnostics |
| `<leader>?` | Buffer-local keymaps (which-key) |

LSP (active in buffers with an attached server):

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Hover docs |
| `<leader>r` | Rename symbol |
| `<leader>a` | Code action |
| `<leader>e` | Show line diagnostic (float) |

Completion (insert mode):

| Key | Action |
|---|---|
| `<C-Space>` | Trigger completion |
| `<Tab>` / `<S-Tab>` | Next / previous item |
| `<CR>` | Confirm selection |
| `<C-e>` | Abort |

## Notes

- **Treesitter is on the `main` branch.** That branch installs parsers imperatively (`require('nvim-treesitter').install({...})`) instead of via `ensure_installed`, and highlighting is started per-buffer via a `FileType` autocmd rather than a `highlight` option.
- **Telescope's treesitter previewer is disabled.** Telescope's `0.1.x` previewer calls the old (`master`) treesitter API that the `main` branch no longer exposes, which crashes it. Previews fall back to Neovim's built-in `:syntax` highlighting.
- To add languages, extend the `install({...})` list in `lua/plugins/treesitter.lua` and the `ensure_installed` list in `lua/plugins/lsp.lua`.
