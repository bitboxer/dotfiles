local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

colors, metadata = wezterm.color.load_terminal_sexy_scheme(wezterm.home_dir .. "/code/dotfiles/theme/terminal.sexy.json") 
config.colors = colors

config.font = wezterm.font 'Hasklig'
config.font_size = 17

config.keys = {
  { key = ']', mods = 'CMD', action = act.ActivateTabRelative(1) },
  { key = '[', mods = 'CMD', action = act.ActivateTabRelative(-1) },
  { key = 'l', mods = 'CMD', action = act.ClearScrollback 'ScrollbackAndViewport'},
}

return config
