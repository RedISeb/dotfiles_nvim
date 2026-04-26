# Neovim Keybindings Cheat Sheet

## Leader Key

| Key | Value |
|-----|-------|
| `<leader>` | `Space` |
| `<localleader>` | `\` |

---

## Installed Plugins

| Plugin | Description |
|--------|-------------|
| blink.cmp | Fast LSP completion with snippet support |
| conform.nvim | Code formatter supporting stylua, isort, ruff, rustfmt, gofmt |
| dressing.nvim | Improved UI for vim.ui.input and vim.ui.select |
| fzf-lua | Fuzzy finder for files, grep, git branches, and more |
| kanagawa.nvim | Warm colorscheme inspired by Japanese art |
| nvim-lspconfig | Language server configuration and integration |
| nvim-tree.lua | File explorer sidebar |
| nvim-treesitter | Syntax highlighting and parsing via tree-sitter |
| nvim-treesitter-textobjects | Syntax-aware text objects for functions, classes, etc. |
| oil.nvim | Directory-as-buffer file manager |
| project.nvim | Automatic project root detection |
| render-markdown.nvim | Renders markdown formatting in buffers |
| rustaceanvim | Enhanced Rust development with rust-analyzer |
| mini.statusline | Lightweight statusline |
| vim-sleuth | Auto-detects indentation style from file context |
| which-key.nvim | Popup showing available keybindings as you type |

---

## Native Vim — Navigation

| Key | Action |
|-----|--------|
| `h` `j` `k` `l` | Move left / down / up / right |
| `w` / `b` / `e` | Next word start / prev word start / word end |
| `W` / `B` / `E` | Same but WORD (whitespace-delimited) |
| `0` | Line start (column 0) |
| `^` | First non-blank character of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `{` / `}` | Jump to prev / next empty line (paragraph) |
| `Ctrl-d` / `Ctrl-u` | Scroll half page down / up |
| `Ctrl-f` / `Ctrl-b` | Scroll full page down / up |
| `%` | Jump to matching bracket / delimiter |
| `f{char}` | Jump to next occurrence of `{char}` on line |
| `F{char}` | Jump to prev occurrence of `{char}` on line |
| `t{char}` | Jump before next `{char}` on line |
| `T{char}` | Jump after prev `{char}` on line |
| `;` / `,` | Repeat last `f/F/t/T` forward / backward |

---

## Native Vim — Editing

| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `I` | Insert at line start |
| `A` | Insert at line end |
| `o` | New line below and insert |
| `O` | New line above and insert |
| `x` | Delete char under cursor |
| `X` | Delete char before cursor |
| `d{motion}` | Delete over motion |
| `dd` | Delete line |
| `D` | Delete to end of line |
| `c{motion}` | Change over motion (delete + insert) |
| `cc` | Change line |
| `C` | Change to end of line |
| `y{motion}` | Yank over motion |
| `yy` | Yank line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `r{char}` | Replace single char |
| `R` | Enter replace mode |
| `u` | Undo |
| `Ctrl-r` | Redo |
| `.` | Repeat last change |
| `>>` / `<<` | Indent / dedent line |
| `>` / `<` | Indent / dedent selection (visual) |
| `~` | Toggle case of char |
| `g~{motion}` | Toggle case over motion |
| `J` | Join line below to current |

---

## Native Vim — Search

| Key | Action |
|-----|--------|
| `/{pattern}` | Search forward |
| `?{pattern}` | Search backward |
| `n` | Next match |
| `N` | Prev match |
| `*` | Search word under cursor forward |
| `#` | Search word under cursor backward |

---

## Native Vim — Visual Mode

| Key | Action |
|-----|--------|
| `v` | Character-wise visual |
| `V` | Line-wise visual |
| `Ctrl-v` | Block visual |
| `gv` | Reselect last visual selection |
| `o` | Move cursor to other end of selection |

---

## Native Vim — Windows & Splits

| Key | Action |
|-----|--------|
| `Ctrl-w s` | Horizontal split |
| `Ctrl-w v` | Vertical split |
| `Ctrl-w h/j/k/l` | Move to left / down / up / right split |
| `Ctrl-w H/J/K/L` | Move split to far left / bottom / top / right |
| `Ctrl-w q` | Close split |
| `Ctrl-w o` | Close all other splits |
| `Ctrl-w =` | Equalize split sizes |
| `Ctrl-w +` / `Ctrl-w -` | Increase / decrease height |
| `Ctrl-w >` / `Ctrl-w <` | Increase / decrease width |
| `Ctrl-w _` | Maximize height |
| `Ctrl-w \|` | Maximize width |

---

## Native Vim — Buffers & Tabs

| Key | Action |
|-----|--------|
| `:bn` | Next buffer |
| `:bp` | Prev buffer |
| `:bd` | Delete (close) buffer |
| `:tabnew` | Open new tab |
| `:tabc` | Close current tab |
| `gt` | Next tab |
| `gT` | Prev tab |
| `{n}gt` | Go to tab `n` |

---

## Native Vim — Marks & Jumps

| Key | Action |
|-----|--------|
| `m{a-z}` | Set local mark |
| `m{A-Z}` | Set global mark |
| `` `{mark} `` | Jump to mark (exact position) |
| `'{mark}` | Jump to mark (line start) |
| `Ctrl-o` | Jump list backward |
| `Ctrl-i` | Jump list forward |
| `gi` | Return to last insert position |

---

## Native Vim — Macros

| Key | Action |
|-----|--------|
| `q{a-z}` | Start recording macro into register |
| `q` | Stop recording |
| `@{a-z}` | Play macro from register |
| `@@` | Repeat last played macro |
| `{n}@{a-z}` | Play macro `n` times |

---

## Insert Mode

| Key | Action |
|-----|--------|
| `jj` | Exit insert mode (`<Esc>`) |

---

## File Explorer — Oil

> Open with `-` from normal mode. Oil renders the directory as an editable buffer.

| Key | Action |
|-----|--------|
| `-` | Open parent directory in floating Oil window |

**Inside Oil buffer:**

| Key | Action |
|-----|--------|
| `<CR>` | Open file / enter directory |
| `<C-s>` | Open in vertical split |
| `<C-h>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `-` | Go to parent directory |
| `_` | Open cwd |
| `` ` `` | Change directory (cd) |
| `g~` | Change directory scoped to tab |
| `<C-p>` | Preview file |
| `<C-l>` | Refresh view |
| `g.` | Toggle hidden files |
| `gs` | Change sort order |
| `g\` | Toggle trash view |
| `gx` | Open with external program |
| `g?` | Show help |
| `<C-c>` | Close Oil buffer |

---

## File Explorer — Nvim-Tree

| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle Nvim-Tree |

**Inside the tree:**

**Navigation:**

| Key | Action |
|-----|--------|
| `<CR>` or `o` | Open file / expand directory |
| `<Tab>` | Preview file |
| `P` | Jump to parent node |
| `-` | Go up to parent directory |
| `K` | First sibling |
| `J` | Last sibling |
| `<` | Prev sibling |
| `>` | Next sibling |
| `<BS>` | Close directory |
| `<C-]>` | CD into directory (change root) |

**File Operations:**

| Key | Action |
|-----|--------|
| `a` | Create file or directory (`/` suffix = dir) |
| `d` or `<Del>` | Delete |
| `D` | Trash |
| `r` | Rename |
| `e` | Rename (basename only) |
| `u` | Rename (full path) |
| `<C-r>` | Rename (omit filename) |
| `c` | Copy node |
| `x` | Cut node |
| `p` | Paste node |
| `.` | Run command on node |
| `s` | Open with system program |

**Open in Split / Tab:**

| Key | Action |
|-----|--------|
| `<C-v>` | Open in vertical split |
| `<C-x>` | Open in horizontal split |
| `<C-t>` | Open in new tab |
| `<C-e>` | Open in place (current window) |
| `O` | Open without window picker |

**Display & Filtering:**

| Key | Action |
|-----|--------|
| `R` | Refresh tree |
| `E` | Expand all |
| `W` | Collapse all |
| `H` | Toggle hidden files |
| `I` | Toggle git ignored files |
| `C` | Toggle git clean files |
| `B` | Toggle no-buffer filter |
| `M` | Toggle no-bookmark filter |
| `U` | Toggle custom filter |
| `L` | Toggle group empty |
| `f` | Start live filter |
| `F` | Clear live filter |
| `S` | Search node |

**Copy Path:**

| Key | Action |
|-----|--------|
| `y` | Copy filename |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `ge` | Copy basename |

**Bookmarks:**

| Key | Action |
|-----|--------|
| `m` | Toggle bookmark |
| `bd` | Bulk delete bookmarked |
| `bt` | Bulk trash bookmarked |
| `bmv` | Bulk move bookmarked |

**Git Navigation:**

| Key | Action |
|-----|--------|
| `[c` | Prev git item |
| `]c` | Next git item |
| `[e` | Prev diagnostic item |
| `]e` | Next diagnostic item |

**Other:**

| Key | Action |
|-----|--------|
| `<C-k>` | Node info popup |
| `g?` | Help menu |
| `q` | Close tree |

---

## Fuzzy Find — fzf-lua

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files in project |
| `<leader>fg` | Live grep project |
| `<leader>fb` | Git branches |
| `<leader>fa` | All fzf builtins |
| `<leader>fw` | Grep word under cursor |
| `<leader>fW` | Grep WORD under cursor |
| `<leader>/` | Live grep current buffer |

---

## LSP

> These bindings activate only when an LSP server is attached to the buffer.

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gD` | Go to declaration |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code action (normal + visual) |
| `<leader>th` | Toggle inlay hints |
| `gl` | Open diagnostics float |
| `<leader>cf` | Format file (conform + LSP fallback) |

---

## Treesitter — Text Objects

> Use in visual or operator-pending mode (e.g. `daf` deletes outer function).

| Key | Object |
|-----|--------|
| `af` | Outer function |
| `if` | Inner function |
| `ac` | Outer class |
| `ic` | Inner class |
| `ak` | Outer comment |
| `as` | Language scope |

---

## Treesitter — Incremental Selection

| Key | Action |
|-----|--------|
| `<Enter>` | Initialize / expand selection |
| `<Backspace>` | Shrink selection |

---

## Treesitter — Swap Parameters

| Key | Action |
|-----|--------|
| `<leader>a` | Swap with next parameter |
| `<leader>A` | Swap with prev parameter |

---

## Completion — blink.cmp

| Key | Action |
|-----|--------|
| `Ctrl-Space` | Open menu / open docs |
| `Ctrl-n` / `↓` | Next item |
| `Ctrl-p` / `↑` | Prev item |
| `Ctrl-e` | Hide menu |
| `Ctrl-k` | Toggle signature help |
| `<Enter>` | Confirm selection |

---

## Which-Key

| Key | Action |
|-----|--------|
| `<leader>?` | Show buffer-local keymaps |
