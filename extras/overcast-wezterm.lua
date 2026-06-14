-- overcast — wezterm color theme
-- https://github.com/saeeedhany/overcast.nvim
-- Usage in wezterm.lua:
--   local oc = require("path.to.overcast-wezterm")
--   config.colors = oc.overcast        -- dark
--   config.colors = oc["overcast-dawn"] -- light

local M = {}

M.overcast = {
  foreground      = "#eeeeee",
  background      = "#222424",
  cursor_bg       = "#bbbbbb",
  cursor_fg       = "#222424",
  cursor_border   = "#bbbbbb",
  selection_fg    = "#eeeeee",
  selection_bg    = "#3f4444",
  scrollbar_thumb = "#4a4e4e",
  split           = "#2e3131",
  ansi = {
    "#222424", "#cc5555", "#5a9e6f", "#a89a6a",
    "#5b8aad", "#9c7aaa", "#4d9a94", "#bbbbbb",
  },
  brights = {
    "#3a3d3d", "#dd6e6e", "#72b585", "#c4b47e",
    "#72a0c1", "#b38fc0", "#62b2ab", "#eeeeee",
  },
  tab_bar = {
    background = "#1a1c1c",
    active_tab = {
      bg_color  = "#222424",
      fg_color  = "#eeeeee",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1a1c1c",
      fg_color = "#4a4e4e",
    },
    inactive_tab_hover = {
      bg_color = "#2a2d2d",
      fg_color = "#bbbbbb",
    },
    new_tab = {
      bg_color = "#1a1c1c",
      fg_color = "#4a4e4e",
    },
  },
}

M["overcast-dawn"] = {
  foreground      = "#1e2222",
  background      = "#e2e5e5",
  cursor_bg       = "#1e2222",
  cursor_fg       = "#e2e5e5",
  cursor_border   = "#1e2222",
  selection_fg    = "#1e2222",
  selection_bg    = "#b0baba",
  scrollbar_thumb = "#9aa8a8",
  split           = "#c8cece",
  ansi = {
    "#e2e5e5", "#a83838", "#3a7850", "#7a6e40",
    "#3a6888", "#6e5080", "#2e7470", "#2e3535",
  },
  brights = {
    "#9aa8a8", "#c04848", "#4a8860", "#8a7e50",
    "#4a7898", "#7e6090", "#3e8480", "#1e2222",
  },
  tab_bar = {
    background = "#eaecec",
    active_tab = {
      bg_color  = "#e2e5e5",
      fg_color  = "#1e2222",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#eaecec",
      fg_color = "#9aa8a8",
    },
    inactive_tab_hover = {
      bg_color = "#d8dcdc",
      fg_color = "#2e3535",
    },
    new_tab = {
      bg_color = "#eaecec",
      fg_color = "#9aa8a8",
    },
  },
}

return M
