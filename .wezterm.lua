-- ref: https://wezfurlong.org/wezterm/config/files.html
--    : https://wezfurlong.org/wezterm/config/lua/config/index.html
--    : https://vim-jp.slack.com/archives/CJ3BV8EMA/p1700862479310689

local wezterm = require('wezterm')

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- color {{{
-- ref: https://wezfurlong.org/wezterm/config/lua/config/window_frame.html
local color = {
  active_titlebar_bg = '#333333',
}
-- }}}

-- function {{{
-- ref: https://wezfurlong.org/wezterm/config/lua/window-events/format-window-title.html
--    : https://wezfurlong.org/wezterm/config/lua/PaneInformation.html
---@param s string|number
local function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

-- ref: https://wezterm.org/config/lua/pane/get_progress.html
local function pct_glyph(pct)
  local pct_glyphs = {
    wezterm.nerdfonts.md_circle_slice_1,
    wezterm.nerdfonts.md_circle_slice_2,
    wezterm.nerdfonts.md_circle_slice_3,
    wezterm.nerdfonts.md_circle_slice_4,
    wezterm.nerdfonts.md_circle_slice_5,
    wezterm.nerdfonts.md_circle_slice_6,
    wezterm.nerdfonts.md_circle_slice_7,
    wezterm.nerdfonts.md_circle_slice_8,
  }
  local slot = math.floor(pct / 12)
  return pct_glyphs[slot + 1]
end
-- }}}

-- basic {{{
-- appearance {{{
config.macos_window_background_blur = 9
config.native_macos_fullscreen_mode = true
config.window_decorations = 'TITLE | RESIZE | MACOS_FORCE_ENABLE_SHADOW'
config.window_background_opacity = 0.9
config.window_frame = {
  font = wezterm.font('RictyDiminished Nerd Font', { weight = 'Bold' }),
  font_size = 14.0,
  active_titlebar_bg = color.active_titlebar_bg,
}
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
config.macos_forward_to_ime_modifier_mask = 'SHIFT|CTRL'
config.send_composed_key_when_left_alt_is_pressed = true
config.use_ime = true
-- }}}

-- key tables {{{
-- ref: https://wezterm.org/config/key-tables.html
--    : https://wezterm.org/config/default-keys.html
--    : https://coralpink.github.io/commentary/wezterm/keybind.html
--    : Run `wezterm show-keys --lua`
local act = wezterm.action
config.keys = {
  {
    key = 'd',
    mods = 'SUPER',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'SUPER|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}
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
-- }}}

-- unicode {{{
config.treat_east_asian_ambiguous_width_as_wide = false
-- }}}

-- other {{{
config.quit_when_all_windows_are_closed = false
config.term = 'xterm-256color'
-- }}}
-- }}}

-- event {{{
-- ref: https://wezfurlong.org/wezterm/config/lua/wezterm/on.html

-- gui-startup {{{
-- ref: https://qiita.com/sonarAIT/items/0571c869e5f9ab3be817#フルスクリーン表示--背景透過
--    : https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
--    : https://wezfurlong.org/wezterm/config/lua/window/toggle_fullscreen.html
wezterm.on('gui-startup', function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)
-- }}}

-- format-tab-title {{{
-- ref: https://wezfurlong.org/wezterm/config/lua/window-events/format-window-title.html
--    : https://wezfurlong.org/wezterm/config/lua/window-events/format-tab-title.html
--    : https://wezterm.org/config/lua/PaneInformation.html
--    : https://wezterm.org/config/lua/pane/get_progress.html
wezterm.on('format-tab-title', function(tab, tabs, _, _, _, _)
  local pane = tab.active_pane
  local index = ''
  if #tabs > 1 then
    index = string.format('%d: ', tab.tab_index + 1)
  end
  local elements = {
    { Text = index },
  }

  local progress = pane.progress or 'None'
  if progress ~= 'None' then
    local progress_color = 'green'
    local status
    if progress.Percentage ~= nil then
      status = pct_glyph(progress.Percentage)
    elseif progress.Error ~= nil then
      status = pct_glyph(progress.Error)
      progress_color = 'red'
    elseif progress == 'Indeterminate' then
      status = '~'
    else
      status = wezterm.serde.json_encode(progress)
    end

    table.insert(elements, { Foreground = { Color = progress_color } })
    table.insert(elements, { Text = status .. ' ' })
    table.insert(elements, { Foreground = 'Default' })
  end

  local title = basename(pane.foreground_process_name)
  table.insert(elements, { Text = title .. ' ' })

  return elements
end)
-- }}}

-- format-window-title {{{
-- ref: https://coralpink.github.io/commentary/wezterm/window-title.html
--    : https://wezfurlong.org/wezterm/config/lua/window-events/format-window-title.html
wezterm.on('format-window-title', function(tab, _, tabs, _, _)
  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
  end

  return index .. basename(tab.active_pane.foreground_process_name)
end)
-- }}}

-- update-right-status {{{
-- ref: https://coralpink.github.io/commentary/wezterm/right-status.html
--    : https://wezfurlong.org/wezterm/config/lua/window/set_right_status.html
--    : https://wezfurlong.org/wezterm/config/lua/window/get_dimensions.html
--    : https://wezfurlong.org/wezterm/config/lua/wezterm/battery_info.html
wezterm.on('update-right-status', function(window, _)
  if not window:get_dimensions().is_full_screen then
    return
  end

  local battery = ''
  for _, b in ipairs(wezterm.battery_info()) do
    battery = string.format('%.0f%%', b.state_of_charge * 100)
  end

  local date = wezterm.strftime('%m/%d %H:%M')

  window:set_right_status(wezterm.format {
    { Background = { Color = color.active_titlebar_bg } },
    { Text = ' ' },
    { Text = ' ' .. battery }, -- nf-fa-battery
    { Text = ' ' },
    { Text = ' ' .. date },
    { Text = ' ' },
  })
end)
-- }}}
-- }}}

return config

-- vim: set foldmethod=marker:
