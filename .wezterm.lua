-- ref: https://wezfurlong.org/wezterm/config/files.html
--    : https://wezfurlong.org/wezterm/config/lua/config/index.html
--    : https://vim-jp.slack.com/archives/CJ3BV8EMA/p1700862479310689

local wezterm = require('wezterm')

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- appearance {{{
config.macos_window_background_blur = 9
config.native_macos_fullscreen_mode = true
config.window_decorations = 'TITLE | RESIZE | MACOS_FORCE_ENABLE_SHADOW'
config.window_background_opacity = 0.9
-- }}}

-- bell {{{
config.audible_bell = 'SystemBeep'
-- }}}

-- clipboard {{{
config.canonicalize_pasted_newlines = 'None'
-- }}}

-- color {{{
-- ref: https://wezfurlong.org/wezterm/colorschemes/t/index.html#tokyo-night-moon
config.color_scheme = 'Tokyo Night Moon'
-- }}}

-- exit_behavior {{{
config.clean_exit_codes = { 0 }
-- }}}

-- font {{{
config.adjust_window_size_when_changing_font_size = false
config.allow_square_glyphs_to_overflow_width = 'Never'
config.anti_alias_custom_block_glyphs = true
config.bold_brightens_ansi_colors = true
config.custom_block_glyphs = true
config.font = wezterm.font('RictyDiminished Nerd Font')
config.font_size = 18.0
config.warn_about_missing_glyphs = true
-- }}}

-- keys {{{
config.use_ime = true
-- }}}

-- mouse {{{
config.alternate_buffer_wheel_scroll_speed = 3
config.bypass_mouse_reporting_modifiers = 'SHIFT'
config.disable_default_mouse_bindings = false
config.mouse_wheel_scrolls_tabs = false
config.pane_focus_follows_mouse = false
config.swallow_mouse_click_on_pane_focus = false
-- }}}

-- mouse_cursor {{{
config.hide_mouse_cursor_when_typing = true
-- }}}

-- quick_select {{{
config.disable_default_quick_select_patterns = false
-- }}}

-- reload {{{
config.automatically_reload_config = true
-- }}}

-- scroll_bar {{{
config.enable_scroll_bar = true
-- }}}

-- spawn {{{
config.initial_cols = 80
config.initial_rows = 24
-- }}}

-- tab_bar {{{
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = true
config.show_tab_index_in_tab_bar = true
config.show_tabs_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_and_split_indices_are_zero_based = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true
-- }}}

-- tuning {{{
config.animation_fps = 10
config.max_fps = 60
-- }}}

-- updates {{{
config.check_for_updates = true
config.check_for_updates_interval_seconds = 24 * 60 * 60
config.show_update_window = true
-- }}}

-- unicode {{{
config.treat_east_asian_ambiguous_width_as_wide = false
-- }}}

-- other {{{
config.quit_when_all_windows_are_closed = false
config.term = 'xterm-256color'
-- }}}

return config
