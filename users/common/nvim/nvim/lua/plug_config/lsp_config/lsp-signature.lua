local config = {
    doc_lines = 0,
    hint_enable = false,
    shadow_guibg = 'Black',
    floating_window_above_cur_line = false,
    floating_window_off_y = -2,
}

require "lsp_signature".setup(config)
