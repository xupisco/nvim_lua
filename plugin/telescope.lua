require('telescope').setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        --layout_strategy = 'vertical',
        --layout_config = { preview_height = 0.6 },
        --theme = 'ivy',
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }, 
        -- other layout configuration here
        -- other defaults configuration here
    },
    -- other configuration values here
    extensions = {
    },
})
