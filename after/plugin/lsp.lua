vim.opt.signcolumn = 'yes'

local cmp = require('cmp')
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

require('lspconfig.ui.windows').default_options.border = 'solid'

lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = {
        border = 'none',
        side_padding = 0,
        completeopt = 'menuone,noinsert'
    },
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.confirm()
            else
                fallback()
            end
        end,
    },
    documentation = {
        col_offset = 0,
        border = 'solid',
        side_padding = 4,
        winhighlight = 'Normal:TelescopeNormal,FloatBorder:TelescopeBorder',
        zindex = 1001
    }
})

lsp.configure('pyright', {
    settings = {
        reportUnusedVariable = false
    }
})

lsp.configure('emmet_ls', {
    filetypes = { 'html', 'htmldjango', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'solid',
            source = 'always',
            side_padding = 4,
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

require("symbols-outline").setup()
