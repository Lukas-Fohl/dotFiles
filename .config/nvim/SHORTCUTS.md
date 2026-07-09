# Neovim Shortcuts

Leader key: `Space`

## General Editing

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<C-s>` | Insert, Normal, Visual | Save file |
| `"` | Insert | Insert paired quotes and place cursor inside |
| `<C-j>` | Normal, Visual | Insert `{` |
| `<C-k>` | Normal, Visual | Insert `}` |
| `<leader>f` | Normal | Insert `{` after cursor |
| `<leader>j` | Normal | Insert `}` after cursor |
| `<leader>g` | Normal | Insert `[` after cursor |
| `<leader>h` | Normal | Insert `]` after cursor |
| `<leader>b` | Normal | Insert `\` after cursor |

## LSP

| Shortcut | Mode | Action |
| --- | --- | --- |
| `gd` | Normal | Go to definition |
| `<leader><leader>` | Normal | Format current buffer |

## Search

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<C-p>` | Normal | Find files with Telescope |
| `<C-l>` | Normal | Live grep with Telescope |

## Files

| Shortcut | Mode | Action |
| --- | --- | --- |
| `-` | Normal | Open parent directory in Oil |

## Git

| Shortcut | Mode | Action |
| --- | --- | --- |
| `]h` | Normal | Next Git hunk |
| `[h` | Normal | Previous Git hunk |
| `<leader>np` | Normal | Preview Git hunk |
| `<leader>nb` | Normal | Toggle current line blame |
| `<leader>dv` | Normal | Open Diffview |
| `<leader>dh` | Normal | Show file history in Diffview |
| `<leader>dc` | Normal | Close Diffview |

## Project Tools

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<leader>c` | Normal | Run `:make` |
| `<leader>t` | Normal | Open floating terminal |
| `<Esc>` | Terminal | Leave terminal mode |
| `<M-j>` | Normal | Quickfix next |
| `<M-k>` | Normal | Quickfix previous |

## Symbols And Code Structure

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<leader>s` | Normal | Open Symbols sidebar |
| `<leader>S` | Normal | Close Symbols sidebar |
| `<leader>w` | Normal | Run Wobble |

## Hook

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<leader>a` | Normal | Add current buffer to Hook |
| `<leader>d` | Normal | Remove current buffer from Hook |
| `<leader>m` | Normal | Toggle Hook menu |
| `<leader>1` | Normal | Jump to Hook buffer 1 |
| `<leader>2` | Normal | Jump to Hook buffer 2 |
| `<leader>3` | Normal | Jump to Hook buffer 3 |
| `<leader>4` | Normal | Jump to Hook buffer 4 |
| `<leader>5` | Normal | Jump to Hook buffer 5 |
