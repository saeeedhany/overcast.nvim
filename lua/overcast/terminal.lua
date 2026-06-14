-- lua/overcast/terminal.lua
-- Terminal color mappings for all overcast variants.
-- Called with the already-selected palette so colors match the active variant.
local M = {}

function M.apply(c)
  vim.g.terminal_color_0  = c.bg1           -- black
  vim.g.terminal_color_1  = c.red           -- red
  vim.g.terminal_color_2  = c.green         -- green
  vim.g.terminal_color_3  = c.yellow        -- yellow
  vim.g.terminal_color_4  = c.blue          -- blue
  vim.g.terminal_color_5  = c.purple        -- magenta
  vim.g.terminal_color_6  = c.cyan          -- cyan
  vim.g.terminal_color_7  = c.fg1           -- white
  vim.g.terminal_color_8  = c.muted         -- bright black
  vim.g.terminal_color_9  = c.red_bright    -- bright red
  vim.g.terminal_color_10 = c.green_bright  -- bright green
  vim.g.terminal_color_11 = c.yellow_bright -- bright yellow
  vim.g.terminal_color_12 = c.blue_bright   -- bright blue
  vim.g.terminal_color_13 = c.purple_bright -- bright magenta
  vim.g.terminal_color_14 = c.cyan_bright   -- bright cyan
  vim.g.terminal_color_15 = c.fg0           -- bright white
end

return M
