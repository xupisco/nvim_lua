function setTheme(theme)
    theme = theme or 'gruvbox-material'
    vim.opt.termguicolors = true

    vim.g.gruvbox_material_background = 'medium'
    vim.g.gruvbox_material_colors_override = { bg0 = {'#222222', '235'} }
    vim.g.gruvbox_material_statusline_style = 'default'
    vim.g.gruvbox_material_foreground = 'original'

    vim.cmd.colorscheme(theme)
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#222222' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#191919' })
    vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg = '#191919' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg = '#191919' })
    vim.api.nvim_set_hl(0, 'Float', { bg = '#191919' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#191919' })

    vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { bg = '#191919', fg = '#cc5547' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { bg = '#191919', fg = '#83A598' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarning', { bg = '#1fd143', fg = '#FABD2F' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { bg = '#db27d5', })

    vim.api.nvim_set_hl(0, 'Floaterm', { bg = '#191919' })
    vim.api.nvim_set_hl(0, 'FloatermBorder', { bg = '#191919', })
end

setTheme()
