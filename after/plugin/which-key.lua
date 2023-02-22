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
    ["<leader>p"] = { ":Telescope command_palette<CR>", "Command Palette" },
    ["<leader>o"] = { ":SymbolsOutline<CR>", "Symbols Outline" },
    ["<leader>r"] = { ":source $MYVIMRC<CR>", "Reload settings" },
    ["<leader>e"] = { ":NvimTreeToggle<CR>", "File Explorer" },
    ["<leader>ee"] = { ":NvimTreeFindFileToggle<CR>", "File Explorer (select)" },
    ["<leader>q"] = { ":nohl<CR>", "Clear search" },
    ["<leader>c"] = { ":bp | sp | bn | bd<CR>", "Delete buffer" },
    ["<leader>r"] = { ":RnvimrToggle<CR>", "Ranger" },
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
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Buffer symbols" },
        g = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, "Grep" },
        l = { "<cmd>Telescope live_grep<cr>", "Live grep" },
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
        s = { "<cmd>split<cr>", "Split below" },
        r = { "<cmd>vsplit<cr>", "Split right" },
    },
}, { prefix = "<leader>" })
