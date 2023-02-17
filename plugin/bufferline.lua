require("bufferline").setup {
    highlights = {
        fill = {
            bg = '#181818',
        },
        background = {
            bg = '#181818'
        },
        pick_visible = {
            bg = '#181818',
        },
        buffer = {
            bg = '#00ff00'
        },
        buffer_visible = {
            bg = '#282828'
        },
        buffer_selected = {
            bg = '#222222',
            bold = true,
            italic = false,
        },
        tab_close = {
            bg = '#181818'
        },
        close_button_visible = {
            bg = '#181818'
        },
        close_button_selected = {
            bg = '#222222'
        },
        diagnostic = {
            bg = '#181818'
        },
        diagnostic_visible = {
            bg = '#181818',
        },
        diagnostic_selected = {
            bg = '#222222',
        },
        hint_visible = {
            bg = '#181818'
        },
        hint_selected = {
            bg = '#222222',
        },
        hint_diagnostic_visible = {
            bg = '#181818'
        },
        hint_diagnostic_selected = {
            bg = '#222222',
        },
        info_visible = {
            bg = '#181818'
        },
        info_selected = {
            bg = '#222222',
        },
        info_diagnostic = {
            bg = '#181818'
        },
        info_diagnostic_visible = {
            bg = '#181818'
        },
        info_diagnostic_selected = {
            bg = '#222222',
        },
        warning = {
            bg = '#181818',
        },
        warning_visible = {
            bg = '#181818'
        },
        warning_selected = {
            bg = '#222222',
        },
        warning_diagnostic = {
            bg = '#181818'
        },
        warning_diagnostic_visible = {
            bg = '#181818'
        },
        warning_diagnostic_selected = {
            bg = '#222222',
        },
        error_visible = {
            bg = '#181818'
        },
        error_selected = {
            bg = '#222222',
        },
        error_diagnostic_visible = {
            bg = '#181818'
        },
        error_diagnostic_selected = {
            bg = '#222222',
        },
        modified = {
            fg = '#c2b8ab',
            bg = '#181818',
        },
        modified_selected = {
            bg = '#222222'
        },
        indicator_selected = {
            bg = '#222222'
        },
        numbers = {
            fg = '#ff0000',
        },
        numbers_visible = {
            fg = '#00ff00',
        },
        numbers_selected = {
            fg = '#0000ff',
        },
        separator_selected = {
            fg = '#0000ff',
        },
        separator_visible = {
            fg = '#00ff00',
        },
        separator = {
            bg = '#181818',
        },
    },
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "none",
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can :be a string | function, see "Mouse actions"
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf)  -- buf contains:
            return buf.name
            -- name                | str        | the basename of the active file
            -- path                | str        | the full path of the active file
            -- bufnr (buffer only) | int        | the number of the active buffer
            -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
            -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        end,
        max_name_length = 25,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 0,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        -- diagnostics_indicator = nil,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
            -- filter out by it's index number in list (don't show first buffer)
            if buf_numbers[1] ~= buf_number then
                return true
            end
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = false,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = 'thin',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_after_current'
    }
}
