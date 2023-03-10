local cmp = require('cmp')

cmp.setup({
    completion = {
        preselect = 'none',
        --completeopt = 'menu,menuone,noinsert,noselect',
        completeopt = 'menuone,noinsert,preview',
    },

    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<PageUp>"] = cmp.mapping.select_prev_item({count = 7}),
        ["<PageDown>"] = cmp.mapping.select_next_item({count = 7}),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.confirm()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<ESC>'] = function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end
    },

    sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        },
    }
})

