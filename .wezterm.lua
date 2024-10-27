local wezterm = require 'wezterm'
local config = {}

-- ---- Window and Background Settings ----
-- Enable tab bar at the top of the window
config.enable_tab_bar = true
-- Set window decorations (resize only, no title bar)
config.window_decorations = "NONE | RESIZE"
-- Set window opacity level
config.window_background_opacity = 0.65
-- Apply a background blur effect on macOS
config.macos_window_background_blur = 6

-- ---- Tab Bar Appearance ----
-- Configure background color for the tab bar
config.colors = {
  tab_bar = {
    background = "#1e1e1e", -- Dark background color for tab bar
  },
}

-- ---- Font Configuration ----
-- Set the font type and size
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 14.0

-- ---- Keybindings ----
config.keys = {
  -- Toggle zoom for the active pane
  {
    key = "Enter",
    mods = "CMD",
    action = wezterm.action.TogglePaneZoomState,
  },

  -- Split pane horizontally (right side)
  {
    key = "p",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },

  -- Split pane vertically (bottom)
  {
    key = "h",
    mods = "CMD",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },

  -- Open a new tab
  {
    key = "t",
    mods = "CMD",
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },

  -- Close the current pane; if it’s the last pane, close the tab
  {
    key = "x",
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },

  -- Navigate between panes
  {
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = "RightArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    key = "UpArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = "DownArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
}

-- ---- Tab Switching Shortcuts ----
-- CMD + [1-9] to switch directly to tabs 1-9
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "CMD",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- Return the configuration table
return config
