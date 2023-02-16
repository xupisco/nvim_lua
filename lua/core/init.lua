require('core.packer')
require('core.remap')

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

g.mapleader  =  ','

opt.hidden = true              -- Required to keep multiple buffers open multiple buffers
opt.encoding = 'utf-8'         -- The encoding displayed
opt.scrolloff = 5              -- Start scroll X lines before end
opt.wrap = false               -- No line wraps
opt.pumheight = 30             -- Makes popup menu smaller
opt.fileencoding = 'utf-8'     -- The encoding written to file
opt.cmdheight = 1              -- More space for displaying messages
opt.mouse = 'a'                -- Enable your mouse
opt.splitbelow = true          -- Horizontal splits will automatically be below
opt.splitright = true          -- Vertical splits will automatically be to the right
opt.tabstop = 4                -- Insert 4 spaces for a tab
opt.shiftwidth = 4             -- Change the number of space characters inserted for indentation
opt.expandtab = true           -- Converts tabs to spaces
opt.smartindent = true         -- Makes indenting smart
opt.number = true              -- Line numbers
opt.cursorline = true          -- Enable highlighting of the current line
opt.background = 'dark'        -- tell vim what the background color looks like
opt.showtabline = 2            -- Always show tabs
opt.showmatch = false          -- Highlight macthing stuff
opt.backup = false             -- This is recommended by coc
opt.writebackup = false        -- This is recommended by coc
opt.swapfile = false           -- Stop writing swap files
opt.updatetime = 300           -- Faster completion
opt.timeoutlen = 500           -- By default timeoutlen is 1000 ms
opt.clipboard = 'unnamedplus'  -- Copy paste between vim and everything else
opt.inccommand = 'split'       -- Show command results in real-time
opt.autochdir = false          -- Your working directory will always be the same as your working directory
opt.autoread = true
