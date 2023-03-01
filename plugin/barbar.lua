vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferCurrentIcon', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = '#262626' })


vim.api.nvim_set_hl(0, 'BufferVisible', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferVisibleIndex', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferVisibleMod', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferVisibleSign', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferVisibleIcon', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferVisibleIndex', { bg = '#262626' })


vim.api.nvim_set_hl(0, 'BufferCurrentError', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferCurrentWarn', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferCurrentInfo', { bg = '#262626' })
vim.api.nvim_set_hl(0, 'BufferCurrentHint', { bg = '#262626' })

vim.api.nvim_set_hl(0, 'BufferVisibleError', { bg = '#1b1b1b' })
vim.api.nvim_set_hl(0, 'BufferVisibleWarn', { bg = '#1b1b1b' })
vim.api.nvim_set_hl(0, 'BufferVisibleInfo', { bg = '#1b1b1b' })
vim.api.nvim_set_hl(0, 'BufferVisibleHint', { bg = '#1b1b1b' })

vim.api.nvim_set_hl(0, 'BufferTabpages', { bg = '#ff0000' })
vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = '#1b1b1b' })


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)


require'bufferline'.setup {
    highlight_alternate = false,
    tabpages = true,

    diagnostics = {
        -- you can use a list
        {enabled = false}, -- ERROR
        {enabled = false}, -- WARN
        {enabled = false}, -- INFO
        {enabled = false},  -- HINT
    },

    icons = true,
    icon_separator_active = '▎',
    icon_separator_inactive = '',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size() + 1)
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size() + 1)
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
