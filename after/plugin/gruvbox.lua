
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

        vim.api.nvim_set_hl(0, 'NonText', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = '#202020' })
        vim.api.nvim_set_hl(0, 'Normal', { bg = '#262626' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#222222' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'Float', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#191919' })

        -- Nvim-Tree
        vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = '#222222' })
        vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = '#222222', fg = '#303030' })
        vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { bg = '#222222' })
        vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = '#222222', fg = '#222222' })
        vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#222222', bg = '#222222' })

        -- Telescope
        vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = '#191919', fg = '#191919' })
        vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = '#161616', fg = '#161616' })
        vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = '#161616', fg = '#ebdbb2' })
        vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = '#161616', fg = '#fbf1c7' })
        vim.api.nvim_set_hl(0, 'TelescopePeviewTitle', { bg = '#191919', fg = '#fbf1c7' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = '#191919', fg = '#fbf1c7' })

        vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#ebdbb2', fg = '#191919' })

        vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { fg = '#DC4E27', bg = '#191919' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { fg = '#579DA3', bg = '#191919' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { fg = '#C6933D', bg = '#191919' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarning', { fg = '#C6933D', bg = '#191919' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { fg = '#616161', bg = '#191919' })
        vim.api.nvim_set_hl(0, 'DiagnosticFloatingInformation', { fg = '#616161', bg = '#191919' })

        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = '#402C2B', fg = '#DC4E27' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = '#312E28', fg = '#C6933D' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarning', { bg = '#312E28', fg = '#C6933D' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = '#272F30', fg = '#579DA3' })
        vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = '#2B2B2B', fg = '#616161' })

        vim.api.nvim_set_hl(0, 'Floaterm', { bg = '#191919' })
        vim.api.nvim_set_hl(0, 'FloatermBorder', { bg = '#191919', })

        vim.api.nvim_set_hl(0, 'FocusedSymbol', { bg = '#a89984', fg='#282828' })

        -- Barbar
        vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = '#262626' })
        vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = '#262626' })
        vim.api.nvim_set_hl(0, 'BufferCurrentMod', { bg = '#262626' })
        vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = '#262626' })
        vim.api.nvim_set_hl(0, 'BufferCurrentIcon', { bg = '#262626' })
        vim.api.nvim_set_hl(0, 'BufferCurrentIndex', { bg = '#262626' })
        vim.api.nvim_set_hl(0, 'BufferTabpages', { bg = '#ff0000' })
        vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = '#ff0000', link = 'BufferDefaultCurrentIcon' })
    end

end

local signs = {
    DiagnosticSignError = ' ',
    DiagnosticSignWarn = ' ',
    DiagnosticSignHint = ' ',
    DiagnosticSignInfo = ' '
}

--for hl, icon in pairs(signs) do
--    vim.fn.sign_define(hl, { text = icon })
--end

setTheme('gruvbox-material', true)

vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = '#222222' })

vim.api.nvim_set_hl(0, 'BufferInactive', { bg = '#191919', fg = '#504945' })
vim.api.nvim_set_hl(0, 'BufferInactiveIndex', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'BufferInactiveMod', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'BufferInactiveSign', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'BufferInactiveIcon', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'BufferInactiveIndex', { bg = '#191919' })


vim.api.nvim_set_hl(0, 'BufferVisible', { bg = '#191919', fg = '#504945' })
vim.api.nvim_set_hl(0, 'BufferVisibleIndex', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'BufferVisibleMod', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'BufferVisibleSign', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'BufferVisibleIcon', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'BufferVisibleIndex', { bg = '#191919' })


--require("gruvbox").setup({
--    undercurl = true,
--    underline = true,
--    bold = true,
--    italic = true,
--    strikethrough = true,
--    invert_selection = false,
--    invert_signs = false,
--    invert_tabline = false,
--    invert_intend_guides = false,
--    inverse = true, -- invert background for search, diffs, statuslines and errors
--    contrast = 'hard', -- can be "hard", "soft" or empty string
--    palette_overrides = {},
--    overrides = {},
--    dim_inactive = true,
--    transparent_mode = false,
--})
