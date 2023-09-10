-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

local powershell = {'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe'}

local act = wezterm.action


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'OneDark (base16)'
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = powershell
    config.font_size = 9
end
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.exit_behavior = 'Hold'



config.keys = {
  {
    key = 'w',
    mods = 'ALT',
    action = act.CloseCurrentPane { confirm = false },
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = act.SplitHorizontal { },
  },
  {
    key = 'o',
    mods = 'LEADER',
    action = act.SplitVertical { },
  },
{
    key = 'LeftArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Down',
  },
 {
    key = 'LeftArrow',
    mods = 'SHIFT|ALT',
    action = act.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT|ALT',
    action = act.AdjustPaneSize { 'Down', 5 },
  },
  { key = 'UpArrow', mods = 'SHIFT|ALT', action = act.AdjustPaneSize { 'Up', 5 } },
  {
    key = 'RightArrow',
    mods = 'SHIFT|ALT',
    action = act.AdjustPaneSize { 'Right', 5 }, },
}

-- and finally, return the configuration to wezterm
return config
