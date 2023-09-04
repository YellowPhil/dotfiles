local opt = vim.opt

opt.backup = false

-- Clipboard settings, always use clipboard for all delete, yank, change, put
-- operation, see https://stackoverflow.com/q/30691466/6064933
opt.clipboard:append("unnamedplus")

opt.cmdheight = 2

-- Completion behaviour
-- set completeopt+=noinsert  " Auto select the first completion entry
--set completeopt+=menuone  " Show menu even if there is only one item
--set completeopt+=noselect
opt.completeopt:append({ "menu", "menuone", "noselect" })
opt.compatible = false

--set conceallevel=0

-- File and script encoding settings for vim
opt.fileencoding = "utf-8"
--set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

opt.mouse = "a"

opt.pumheight = 10 -- Maximum number of items to show in popup menu
opt.pumblend = 10 -- pseudo transparency for completion menu

-- Disable showing current mode on command line since statusline plugins can show it.
opt.showmode = false

-- Always show tabs
opt.showtabline = 2

-- Ignore case in general, but become case-sensitive when uppercase is present
opt.ignorecase = true
opt.smartcase = true

-- Split window below/right when creating horizontal/vertical windows
opt.splitbelow = true
opt.splitright = true

-- Make indent smart again
opt.smartindent = true

-- Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
opt.swapfile = false

-- Enable true color support. Do not set this option if your terminal does not
-- support true colors! For a comprehensive list of terminals supporting true
-- colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
opt.termguicolors = true

-- change fillchars for folding, vertical split, end of buffer, and message separator
-- set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

-- Time in milliseconds to wait for a mapped sequence to complete,
-- see https://unix.stackexchange.com/q/36882/221410 for more info
--set timeoutlen=600

-- Persistent undo even after you close a file and re-open it
opt.undofile = true

opt.updatetime = 300 -- For CursorHold events

opt.writebackup = false

-- General tab settings
opt.tabstop = 4 -- number of visual spaces per TAB
opt.softtabstop = 4 -- number of spaces in tab when editing
opt.shiftwidth = 4 -- number of spaces to use for autoindent
opt.expandtab = true -- expand tab to spaces so that tabs are spaces

if not vim.g.is_mac then
  opt.cursorline = true
end

-- Show line number and relative line number
opt.number = true
opt.relativenumber = true

opt.signcolumn = "yes"

-- Do not highlight last search result
opt.hlsearch = false

opt.wrap = false -- do no wrap

-- Minimum lines to keep above and below cursor when scrolling
opt.scrolloff = 7

opt.sidescrolloff = 7

opt.guifont = "monospace:h17"

-- Set matching pairs of characters and highlight matching brackets
--set matchpairs+=<:>,「:」,『:』,【:】,“:”,‘:’,《:》

-- Do not use visual and errorbells
opt.visualbell = true
opt.errorbells = false

opt.history = 500 -- The number of command and search history to keep

--" Do not show "match xx of xx" and other messages during auto-completion
--set shortmess+=c

--" Do not show search match count on bottom right (seriously, I would strain my
--" neck looking at it). Using plugins like vim-anzu or nvim-hlslens is a better
--" choice, IMHO.
--set shortmess+=S

--" Disable showing intro message (:intro)
--set shortmess+=I

--set whichwrap+=<,>,[,],h,l
--set iskeyword+=-

if vim.fn.executable("rg") == 1 then
	opt.grepprg = [[rg --vimgrep --no-heading --smart-case]]
	opt.grepformat = "%f:%l:%c:%m"
end

--" Set up cursor color and shape in various mode, ref:
--" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
--set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20

--" diff options
--set diffopt=
--set diffopt+=vertical  " show diff in vertical position
--set diffopt+=filler  " show filler for deleted lines
--set diffopt+=closeoff  " turn off diff when one file window is closed
--set diffopt+=context:3  " context for diff
--set diffopt+=internal,indent-heuristic,algorithm:histogram
