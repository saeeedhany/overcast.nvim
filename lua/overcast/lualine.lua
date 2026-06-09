local M = {}

local function build(c)
  return {
    normal   = { a = { fg = c.bg1, bg = c.blue,   gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    insert   = { a = { fg = c.bg1, bg = c.green,  gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    visual   = { a = { fg = c.bg1, bg = c.purple, gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    replace  = { a = { fg = c.bg1, bg = c.red,    gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    command  = { a = { fg = c.bg1, bg = c.cyan,   gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    terminal = { a = { fg = c.bg1, bg = c.cyan,   gui = "bold" }, b = { fg = c.fg1, bg = c.bg2 }, c = { fg = c.fg2, bg = c.bg0 } },
    inactive = { a = { fg = c.muted, bg = c.bg0 }, b = { fg = c.muted, bg = c.bg0 }, c = { fg = c.muted, bg = c.bg0 } },
  }
end

function M.get(variant)
  local c = require("overcast").palette(variant)
  return build(c)
end

return setmetatable(M, {
  __index = function(_, key)
    local c = require("overcast").palette()
    return build(c)[key]
  end,
})
