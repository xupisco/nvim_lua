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
    ["<leader>t"] = { ":TroubleToggle<CR>", "Trouble!" },
    ["<leader>o"] = { ":SymbolsOutline<CR>", "Symbols Outline" },
    ["<leader>rr"] = { ":source $MYVIMRC<CR>", "Reload settings" },
    ["<leader>e"] = { ":NvimTreeToggle<CR>", "File Explorer" },
    ["<leader>ee"] = { ":NvimTreeFindFileToggle<CR>", "File Explorer (select)" },
    ["<leader>q"] = { ":nohl<CR>", "Clear search" },
    ["<leader>c"] = { ":bp | sp | bn | bd<CR>", "Delete buffer" },
    ["<leader>r"] = { ":RnvimrToggle<CR>", "Ranger" },
    ["<leader>m"] = { ":MinimapToggle<CR>", "Minimap Toggle" },
["<leader>b"] = { ":lua require('barbecue.ui').toggle()<CR>", "Toggle Barbebue" },
    ["h"] = { name = "Git Gutter" },
})

-- Telescope
wk.register({
    f = {
        name = "Files", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Files" },
        a = { "<cmd>Telescope find_files hidden=true<cr>", "All files" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recents" },
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Buffer diagnostics" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
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
