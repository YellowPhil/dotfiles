local keymap = vim.keymap.set

-- Turn the word under cursor to upper case
keymap("i", "<c-u>", "<Esc>viwUea")

-- Turn the current word into title case
-- keymap("i", "<c-t>", "<Esc>b~lea")

-- Shortcut for faster save and quit
keymap("n", "<leader>w", ":<C-U>update<CR>", { silent = true })

-- Saves the file if modified and quit
keymap("n", "<leader>q", ":<C-U>x<CR>", { silent = true })

-- Quit all opened buffers
-- keymap("n", "<leader>Q", ":<C-U>qa!<CR>", {silent = true})

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136133/6064933
-- nnoremap <expr> <Space>o printf('m`%so<ESC>``', v:count1)
-- nnoremap <expr> <Space>O printf('m`%sO<ESC>``', v:count1)

-- Move the cursor based on physical lines, not the actual lines.
-- nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
-- nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
-- nnoremap ^ g^
-- nnoremap 0 g0

-- Do not include white space characters when using $ in visual mode,
-- see https://vi.stackexchange.com/q/12607/15292
keymap("x", "$", "g_")

-- Jump to matching pairs easily in normal mode
keymap("n", "<Tab>", "%")

-- Go to start or end of line easier
-- nnoremap H ^
-- xnoremap H ^
-- nnoremap L g_
-- xnoremap L g_

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
keymap("x", "<", "<gv")
keymap("x", ">", ">gv")

-- When completion menu is shown, use <cr> to select an item and do not add an
-- annoying newline. Otherwise, <enter> is what it is. For more info , see
-- https://superuser.com/a/941082/736190 and
-- https://unix.stackexchange.com/q/162528/221410
-- inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
-- Use <esc> to close auto-completion menu
-- inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

-- Tab-complete, see https://vi.stackexchange.com/q/19675/15292.
-- inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
-- inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

-- Edit and reload init.vim quickly
-- nnoremap <silent> <leader>ev :<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>
-- nnoremap <silent> <leader>sv :<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar>
--       \ call v:lua.vim.notify("Nvim config successfully reloaded!", 'info', {'title': 'nvim-config'})<cr>

-- Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
-- nnoremap <expr> <leader>v printf('`[%s`]', getregtype()[0])

-- Always use very magic mode for searching
keymap("n", "/", "/\\v")

-- Search in selected region
-- xnoremap / :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>

-- Find and replace (like Sublime Text 3)
-- nnoremap <Space>r :%s/
-- xnoremap <Space>r :s/
keymap("n", "<space>r", ":%s/")
keymap("x", "<space>r", ":s/")

-- Use Esc to quit builtin terminal
-- tnoremap <ESC>   <C-\><C-n>

-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
keymap("n", "c", [["_c]])
keymap("n", "C", [["_C]])
keymap("n", "cc", [["_cc]])
keymap("x", "c", [["_c]])

-- Remove trailing whitespace characters
-- nnoremap <silent> <leader><Space> :<C-U>StripTrailingWhitespace<CR>

-- check the syntax group of current cursor position
-- nnoremap <silent> <leader>st :<C-U>call utils#SynGroup()<CR>

-- Clear highlighting
-- if maparg('<C-L>', 'n') ==# ''
--   nnoremap <silent> <C-L> :<C-U>nohlsearch<CR>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
-- endif

-- Copy entire buffer.
keymap("n", "<leader>y", ":<C-U>%y<CR>", { silent = true })

-- Toggle cursor column
-- nnoremap <silent> <leader>cl :<C-U>call utils#ToggleCursorCol()<CR>

-- Move current line up and down
-- nnoremap <silent> <A-k> <Cmd>call utils#SwitchLine(line('.'), 'up')<CR>
-- nnoremap <silent> <A-j> <Cmd>call utils#SwitchLine(line('.'), 'down')<CR>

-- Move current visual-line selection up and down
-- xnoremap <silent> <A-k> :<C-U>call utils#MoveSelection('up')<CR>
-- xnoremap <silent> <A-j> :<C-U>call utils#MoveSelection('down')<CR>

-- Replace visual selection with text in register, but not contaminate the
-- register, see also https://stackoverflow.com/q/10723700/6064933.
keymap("x", "p", [["_c<ESC>p]])

-- nnoremap <silent> gb :<C-U>call buf_utils#GoToBuffer(v:count, 'forward')<CR>
 --nnoremap <silent> gB :<C-U>call buf_utils#GoToBuffer(v:count, 'backward')<CR>

keymap("n", "<C-h>", "<C-W>h")
keymap("n", "<C-l>", "<C-W>l")
keymap("n", "<c-k>", "<C-W>k")
keymap("n", "<c-j>", "<C-W>j")

-- Do not move my cursor when joining lines.
keymap("n", "J", "mzJ`z")

-- Keep cursor position after yanking
-- noremap y myy
-- noremap y myy

--augroup restore_after_yank
--  autocmd!
--  autocmd TextYankPost *  call s:restore_cursor()
--augroup END

--function! s:restore_cursor() abort
--  silent! normal `y
--  silent! delmarks y
--endfunction

-- for mappings defined in lua
--lua require('custom-map')
--

