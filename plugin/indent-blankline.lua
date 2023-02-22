vim.opt.list = true

require("indent_blankline").setup {

    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "startify",
        "",
    },

    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = false,
}
