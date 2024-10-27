local wezterm = require 'wezterm'
local config = {}

config.enable_tab_bar = true
config.window_decorations = "NONE | RESIZE"
config.window_background_opacity = 0.65
config.macos_window_background_blur = 6

-- Tab bar appearance settings
config.colors = {
  tab_bar = {
    background = "#1e1e1e", -- Opaque background color for the tab bar
  },
}

-- Font settings
config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 14.0

-- Keybindings configuration
config.keys = {
  -- Toggle zoom for the active pane
  {
    key = "Enter",
    mods = "CMD",
    action = wezterm.action.TogglePaneZoomState,
  },
  
  -- Create a vertical split (to the right)
  {
    key = "p",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  
  -- Create a horizontal split (at the bottom)
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

-- Generate CMD+[1-9] shortcuts to switch to the corresponding tab
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "CMD",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
