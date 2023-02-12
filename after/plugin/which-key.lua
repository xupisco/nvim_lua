local wk = require("which-key")
local builtin = require('telescope.builtin')

-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
    ["<C-t>"] = { ":TroubleToggle<CR>", "Trouble!" },
    ["<leader>r"] = { ":source $MYVIMRC<CR>", "Reload settings" },
    ["<leader>e"] = { ":NvimTreeToggle<CR>", "File Explorer" },
    ["<leader>ee"] = { ":NvimTreeFindFileToggle<CR>", "File Explorer (select)" },
    ["<leader>q"] = { ":nohl<CR>", "Clear search" },
    ["<leader>c"] = { ":bp | sp | bn | bd<CR>", "Delete buffer" },
    ["h"] = { name = "Git Gutter" },
})

-- Telescope
wk.register({
    f = {
        name = "Files", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        p = { "<cmd>Telescope git_files<cr>", "Git" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recents" },
        o = { "<cmd>Telescope buffers<cr>", "Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        s = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, "Grep" },
        ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    },
}, { prefix = "<leader>" })


-- Git
wk.register({
    G = {
        name = "Git",
        g = { "<cmd>G<cr>", "Show changes" },
        d = { "<cmd>G diff<cr>", "Diff" },
        l = { "<cmd>G log<cr>", "Log" },
    },
}, { prefix = "<leader>" })


-- Window Management
wk.register({
    w = {
        name = "Window",
        x = { "<cmd>q<cr>", "Close pane" },
        X = { "<cmd>bd<cr>", "Close buffer" },
        s = { "<C-W>s<cr>", "Split below" },
        r = { "<C-W>sv<cr>", "Split right" },
    },
}, { prefix = "<leader>" })
