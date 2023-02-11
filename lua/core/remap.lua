function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ','
-- Move to the next buffer with TAB
map('n', '<TAB>', ':bnext<CR>')
map('n', '<S-TAB>', ':bprevious<CR>') -- Previous buffer

-- Make PgUp and PgDown behave like everywhere else
map('n', '<PageUp>', '<C-u>')
map('n', '<PageDown>', '<C-d>')

-- Move lines like VSCODE
map('n', '<A-Down>', ':m .+1<CR>==')
map('n', '<A-Up>', ':m .-2<CR>==')
map('v', '<A-Down>', ':m \'>+1<CR>gv=gv')
map('v', '<A-Up>', ':m \'<-2<CR>gv=gv')

-- Shift+arrow for selection
map('n', '<S-Up>', 'v<Up>')
map('n', '<S-Down>', 'v<Down>')
map('n', '<S-Left>', 'v<Left>')
map('n', '<S-Right>', 'v<Right>')
map('n', '<S-Home>', '<Esc>v<Home>')
map('n', '<S-End>', '<Esc>v<End>')
map('v', '<S-Up>', '<Up>')
map('v', '<S-Down>', '<Down>')
map('v', '<S-Left>', '<Left>')
map('v', '<S-Right>', '<Right>')
map('i', '<S-Up>', '<Esc>v<Up>')
map('i', '<S-Down>', '<Esc>v<Down>')
map('i', '<S-Left>', '<Esc>v<Left>')
map('i', '<S-Right>', '<Esc>v<Right>')
map('i', '<S-Home>', '<Esc>v<Home>')
map('i', '<S-End>', '<Esc>v<End>')

-- Shift to indent
map('v', '<Tab>', '>gv')
map('v', '<S-Tab>', '<gv')

