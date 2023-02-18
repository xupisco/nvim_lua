require('symbols-outline').setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    relative_width = true,
    width = 30,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'PMenu',
    autofold_depth = nil,
})

vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = 'Outline', command = "setlocal signcolumn=no"
    })
