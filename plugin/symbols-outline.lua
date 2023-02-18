vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = 'Outline', command = "setlocal signcolumn=no"
    })

--require('symbols-outline').setup({
--    highlight_hovered_item = true,
--    show_guides = falses,
--    auto_preview = false,
--    position = 'right',
--    relative_width = true,
--    width = 30,
--    auto_close = false,
--    show_numbers = true,
--    show_relative_numbers = false,
--    show_symbol_details = true,
--    preview_bg_highlight = '#181818',
--    autofold_depth = nil,
--})
