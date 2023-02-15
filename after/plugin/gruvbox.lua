require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = 'hard', -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})


function setTheme(theme, set_custom)
    theme = theme or 'gruvbox-material'
    set_custom = set_custom or false

    vim.opt.termguicolors = true
    vim.opt.background = 'dark'
    vim.cmd.colorscheme(theme)

    if set_custom == true then
        if theme == 'gruvbox' or 'gruvbox-material' then
            vim.g.gruvbox_material_background = 'medium'
            vim.g.gruvbox_material_colors_override = { bg0 = {'#222222', '235'} }
            vim.g.gruvbox_material_statusline_style = 'default'
            vim.g.gruvbox_material_foreground = 'original'
        end

        vim.api.nvim_set_hl(0, 'Normal', { bg = '#222222' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg = '#191919' })
        vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg = '#191919' })
        vim.api.nvim_set_hl(0, 'Float', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#191919' })

        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#ebdbb2', fg = '#191919' })

        vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { bg = '#191919', fg = '#cc5547' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { bg = '#191919', fg = '#83A598' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarning', { bg = '#1fd143', fg = '#FABD2F' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { bg = '#db27d5', })

        vim.api.nvim_set_hl(0, 'Floaterm', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'FloatermBorder', { bg = '#191919', })
    end

end

setTheme('gruvbox-material', true)
