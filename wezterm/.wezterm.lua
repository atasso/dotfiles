-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

local powershell = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }

local act = wezterm.action

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme_dirs = { "../tokyonight/wezterm" }
config.color_scheme = "tokyonight_moon"
config.prefer_to_spawn_tabs = true
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = powershell
	config.font_size = 9
end
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.exit_behavior = "Hold"
config.window_frame = {
	active_titlebar_bg = "#2f334d",

	inactive_titlebar_bg = "#2f334d",
}

config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		inactive_tab_edge = "#2f334d",

		-- The active tab is the one that has focus in the window
		active_tab = {
			fg_color = "#c8d3f5",
			bg_color = "#222436",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Normal",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			fg_color = "#545c7e",
			bg_color = "#2f334d",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#2f334d",
			fg_color = "#c8d3f5",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		new_tab = {
			fg_color = "#545c7e",
			bg_color = "#2f334d",
		},
		new_tab_hover = {
			bg_color = "#2f334d",
			fg_color = "#c8d3f5",
		},
	},
}
config.keys = {
	{
		key = "w",
		mods = "ALT",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = act.SplitHorizontal({}),
	},
	{
		key = "o",
		mods = "LEADER",
		action = act.SplitVertical({}),
	},
	{
		key = "LeftArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "LeftArrow",
		mods = "SHIFT|ALT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "DownArrow",
		mods = "SHIFT|ALT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "UpArrow", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "RightArrow",
		mods = "SHIFT|ALT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

-- and finally, return the configuration to wezterm
return config
