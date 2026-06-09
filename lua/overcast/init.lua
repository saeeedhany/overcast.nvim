--[[
  overcast.nvim
  A cool, desaturated Neovim colorscheme family.
  Built on steel grays, muted teals, dusty purples, and slate blues.

  Variants:
    overcast       — dark, cool gray-green backgrounds
    overcast-dawn  — light, pale morning fog with dark slate ink

  Usage:
    vim.cmd("colorscheme overcast")
    vim.cmd("colorscheme overcast-dawn")

  Config:
    require("overcast").setup({
      terminal_colors = true,
      italic_comments = true,
      italic_strings  = false,
      bold_functions  = false,
      transparent_bg  = false,
      styles          = {},
    })
--]]

local M = {}

M.config = {
  terminal_colors = true,
  italic_comments = true,
  italic_strings  = false,
  bold_functions  = false,
  transparent_bg  = false,
  styles          = {},
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M._load(variant)
  local palettes   = require("overcast.palettes")
  local highlights = require("overcast.highlights")
  local terminal   = require("overcast.terminal")

  local c = palettes[variant]
  if not c then
    vim.notify(
      string.format("[overcast.nvim] Unknown variant '%s'", variant),
      vim.log.levels.ERROR
    )
    return
  end

  c = vim.deepcopy(c)

  if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
  end

  vim.opt.background = (variant == "overcast-dawn") and "light" or "dark"
  vim.g.colors_name  = variant

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  if M.config.transparent_bg then
    c.bg1 = "NONE"
  end

  highlights.apply(c)

  if M.config.terminal_colors then
    terminal.apply(c)
  end

  for group, style in pairs(M.config.styles) do
    vim.api.nvim_set_hl(0, group, style)
  end

  if not M.config.italic_comments then
    vim.api.nvim_set_hl(0, "Comment",  { fg = c.fg2 })
    vim.api.nvim_set_hl(0, "@comment", { fg = c.fg2 })
  end

  if M.config.italic_strings then
    vim.api.nvim_set_hl(0, "String",  { fg = c.green, italic = true })
    vim.api.nvim_set_hl(0, "@string", { fg = c.green, italic = true })
  end

  if M.config.bold_functions then
    vim.api.nvim_set_hl(0, "Function",  { fg = c.blue, bold = true })
    vim.api.nvim_set_hl(0, "@function", { fg = c.blue, bold = true })
  end
end

function M.palette(variant)
  variant = variant or vim.g.colors_name or "overcast"
  return require("overcast.palettes")[variant]
end

return M
