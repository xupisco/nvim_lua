vim.opt.signcolumn = 'yes'

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.setup_nvim_cmp({
    documentation = {
        col_offset = 0,
        border = 'solid',
        side_padding = 4,
        winhighlight = 'Normal:TelescopeNormal,FloatBorder:TelescopeBorder',
        zindex = 1001
    }
})

lsp.setup()

vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})
