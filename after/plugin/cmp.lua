local cmp = require("cmp")

cmp.setup({
    formatting = {
        format = function(_, vim_item)
            vim_item.menu = nil
            return vim_item
        end,
    },

    window = {
        documentation = cmp.config.window.bordered(),
    },

    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item(select_opts),
        ["<Down>"] = cmp.mapping.select_next_item(select_opts),

        ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
        ["<C-n>"] = cmp.mapping.select_next_item(select_opts),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },

    sources = cmp.config.sources({
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "buffer", keyword_length = 3 },
        { name = "vsnip", keyword_length = 2 },
    }, {
        { name = "nvim_lua" },
        { name = "nvim_lsp_signature_help" },
    }),
})
