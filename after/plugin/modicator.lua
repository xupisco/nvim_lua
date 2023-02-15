local modicator = require('modicator')

-- NOTE: Modicator requires line_numbers and cursorline to be enabled
modicator.setup({
    -- Show warning if any required option is missing
    show_warnings = true,
    highlights = {

        -- Default options for bold/italic. You can override these individually
        -- for each mode if you'd like as seen below.
        defaults = {
            foreground = modicator.get_highlight_fg('CursorLineNr'),
            background = modicator.get_highlight_bg('CursorLineNr'),
            bold = true,
            italic = false
        },

        -- Color and bold/italic options for each mode. You can add a bold and/or
        -- italic key pair to override the default highlight for a specific mode if
        -- you would like.
        modes = {
            ['n'] = { foreground = '#a89984' },
            ['i']  = { foreground = '#a9b665' },
            ['v']  = { foreground = '#ea6962' },
        },
    },
})
