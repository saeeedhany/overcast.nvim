-- lua/overcast/palettes.lua
-- All overcast variant palettes.

local M = {}

-- ─── overcast (dark) ─────────────────────────────────────────────────────────
-- Cool, desaturated dark. Steel grays with muted color accents.
-- Based on the dwm terminal palette.
M.overcast = {
  -- Backgrounds
  bg0 = "#1a1c1c",   -- deepest bg (statusline, inactive)
  bg1 = "#222424",   -- main editor bg — exact dwm bg
  bg2 = "#2a2d2d",   -- float/popup bg
  bg3 = "#303434",   -- cursorline — subtle lift
  bg4 = "#3a3d3d",   -- visual selection — bright black from palette

  visual = "#3f4444", -- visual selection: distinct from cursorline

  -- Foregrounds
  fg0 = "#eeeeee",   -- primary text — col_gray4
  fg1 = "#bbbbbb",   -- secondary text — col_gray3
  fg2 = "#8a8a8a",   -- comments, subtle
  fg3 = "#5a5e5e",   -- very muted (line numbers, whitespace)

  -- Syntax colors (normal palette)
  red    = "#cc5555",  -- muted red
  green  = "#5a9e6f",  -- desaturated cool green
  yellow = "#a89a6a",  -- warm but subdued
  blue   = "#5b8aad",  -- steel blue
  purple = "#9c7aaa",  -- dusty purple (magenta slot)
  cyan   = "#4d9a94",  -- teal

  -- Bright variants (for emphasis / special uses)
  red_bright    = "#dd6e6e",
  green_bright  = "#72b585",
  yellow_bright = "#c4b47e",
  blue_bright   = "#72a0c1",
  purple_bright = "#b38fc0",
  cyan_bright   = "#62b2ab",

  -- UI
  muted  = "#4a4e4e",  -- borders, inactive elements
  border = "#2e3131",  -- window separators

  -- Dim tones for diff backgrounds
  red_dim    = "#4a2020",
  green_dim  = "#1e3828",
  yellow_dim = "#3a3218",
  blue_dim   = "#1a2e40",
  purple_dim = "#2e2038",
  cyan_dim   = "#1a3230",

  -- Diff
  diff_add    = "#1e3228",
  diff_change = "#2a2a1e",
  diff_delete = "#3a2020",
  diff_text   = "#303020",

  -- Git
  git_add    = "#5a9e6f",
  git_change = "#a89a6a",
  git_delete = "#cc5555",

  none = "NONE",
}

-- ─── overcast-dawn (light) ───────────────────────────────────────────────────
-- Cool morning light. Pale gray-blue backgrounds, dark slate ink.
-- Like looking out a window at an overcast sky just after sunrise.
M["overcast-dawn"] = {
  -- Backgrounds (cool pale gray-blue, like morning fog)
  bg0 = "#eaecec",   -- lightest (statusline, inactive)
  bg1 = "#e2e5e5",   -- main editor bg
  bg2 = "#d8dcdc",   -- float/popup
  bg3 = "#cdd2d2",   -- cursorline
  bg4 = "#c0c6c6",   -- stronger highlights

  visual = "#b0baba", -- visual selection — clearly distinct

  -- Foregrounds (dark cool slate ink)
  fg0 = "#1e2222",   -- primary text
  fg1 = "#2e3535",   -- secondary
  fg2 = "#4a5555",   -- comments
  fg3 = "#6a7878",   -- muted

  -- Syntax (darkened, cooler versions for light bg)
  red    = "#a83838",
  green  = "#3a7850",
  yellow = "#7a6e40",
  blue   = "#3a6888",
  purple = "#6e5080",
  cyan   = "#2e7470",

  -- Bright (slightly richer for emphasis)
  red_bright    = "#c04848",
  green_bright  = "#4a8860",
  yellow_bright = "#8a7e50",
  blue_bright   = "#4a7898",
  purple_bright = "#7e6090",
  cyan_bright   = "#3e8480",

  -- UI
  muted  = "#9aa8a8",
  border = "#c8cece",

  -- Dim tones
  red_dim    = "#cc5555",
  green_dim  = "#5a9e6f",
  yellow_dim = "#a89a6a",
  blue_dim   = "#5b8aad",
  purple_dim = "#9c7aaa",
  cyan_dim   = "#4d9a94",

  -- Diff
  diff_add    = "#cce8d4",
  diff_change = "#e8e4cc",
  diff_delete = "#e8cccc",
  diff_text   = "#ddd8b8",

  -- Git
  git_add    = "#3a7850",
  git_change = "#7a6e40",
  git_delete = "#a83838",

  none = "NONE",
}

return M
