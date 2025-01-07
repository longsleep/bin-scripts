local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Color scheme:
config.color_scheme = 'Monokai (terminal.sexy)'

-- config.enable_wayland = false -- https://github.com/wez/wezterm/issues/5419
config.font = wezterm.font('Fira Mono for Powerline', { weight = 'Medium' })
config.font_size = 11.0
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_scroll_bar = true
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "TITLE|RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.default_cursor_style = 'SteadyBlock'
config.freetype_load_target = 'HorizontalLcd'
config.command_palette_font_size = 12.0
config.command_palette_rows = 5

-- ssh
config.ssh_backend = "LibSsh"


-- keyboard
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  -- Send "CTRL-B" to the terminal when pressing CTRL-B, CTRL-B
  {
    key = 'b',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'b', mods = 'CTRL' },
  },
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '/',
	mods = 'LEADER',
	action = wezterm.action.Search { CaseSensitiveString = "" },
  },
}

-- mouse
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.CompleteSelection("PrimarySelection"),
  },
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  {
    event = { Up = { streak = 2, button = "Left" } },
    action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
    mods = "ALT",
  },
}
return config
