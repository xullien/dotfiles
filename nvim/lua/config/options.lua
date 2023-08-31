local opt = vim.opt

vim.g.mapleader = " "
opt.cursorline = true

-- Change tab to spaces
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.laststatus = 2 -- global statusline
opt.showmode = false

opt.timeoutlen = 200
opt.updatetime = 250

-- Tab dots
opt.list = true -- enable the below listchars
opt.listchars = { tab = '▸ ', trail = '·' }
opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
opt.smartindent = true

opt.wrap = false

opt.number = true
opt.relativenumber = true

-- Complete the longest common match, and allow tabbing the results to fully complete them
opt.wildmode = 'longest:full,full'
opt.completeopt = 'menuone,longest,preview'

-- Terminal title
opt.title = true

-- Enable mouse for all modes
opt.mouse = 'a'

-- Terminal colors
opt.termguicolors = true

-- Spelling errors under line
opt.spell = false

-- Smart searching
opt.ignorecase = true
opt.smartcase = true

-- Split new buffer to the bottom, and to the right depending on where you splitting, horizontally or vertically
opt.splitbelow = true
opt.splitright = true

-- Keep scroll 8 lines away from where you are, so you can see what's up
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Use system clipboard and not nvim
opt.clipboard = 'unnamedplus'

-- Ask for confirmation instead of error
opt.confirm = true

-- Stop the jumping around when git signing
opt.signcolumn = 'yes:1'

-- Make undo persistent after closing file
opt.undofile = true

-- Backups of files
opt.backup = true -- automatically save a backup file
opt.backupdir:remove('.') -- keep backups out of the current directory

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- Vim Folding
opt.foldcolumn = '1' -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
