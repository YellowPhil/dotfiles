# NeoVim
## keymaps

`<leader>` key is set to `,`
after every update use `:PackerSync` command

mode | keymap | command
:---: | :---: | :---:
`i` | `Ctrl + u` | make word under cursor uppercase
`n` | `<leader> + w` | save file
`n` | `<leader> + q` | save file and exit
`x` | `<` or `>` | add/delete indentation of selected block
`n` | `<leader> + y` | copy entire buffer
`n` | `Shift + h/l` | move to the left/right buffer
`n` | `<leader> + x` | close current buffer
`menu` | `Tab` or `Shift + Tab` | select next or previous
`n` | `Space + k` | autoformat code (works for python(black)/cpp(clangformat)/lua(stylua))
`n` | `Spase + s` | open explorer
`n` | `Shift + k` | show documentation (lsp)
`n` | `go` | show line diagnostics (lsp)
`n` | `gj` | go to the next diagnostics (lsp)
`n` | `gk` | go to the prev diagnostics (lsp)
`n` | `gr` | rename the variable (lsp)
`n` | `sd` | show definition (lsp)
`n` | `gd` | go to definition (lsp)
`n` | `<leader> + fg` | live grep search (ctrl + j to move down)
`n` | `<leader> + ff` | file search (ctrl + k to move up)
`n` | `Ctrl + \` | toggle terminal
`v` | `<space> + r` | rename in all file
`x` | `<space> + r` | rename in visual selection

## Competitive programming
Press `<leader> + r` to compile and run .cpp code
