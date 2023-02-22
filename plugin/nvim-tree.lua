-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local gheight = vim.api.nvim_list_uis()[1].height
local gwidth = vim.api.nvim_list_uis()[1].width
local width = 70
local height = 40

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    diagnostics = {
        enable = true,
    },
    view = {
        width = 25,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "solid",
                width = width,
                height = height,
                row = (gheight - height) * 0.5,
                col = (gwidth - width) * 0.5,
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = true,
        },
        remove_file = {
            close_window = true,
        },
    },
})
