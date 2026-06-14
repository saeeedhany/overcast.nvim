--[[
  overcast.nvim — cool, desaturated Neovim colorscheme family.

  Variants:
    overcast       — dark, steel gray-green
    overcast-dawn  — light, pale morning fog, dark slate ink

  Quick start:
    require("overcast").setup({})
    vim.cmd("colorscheme overcast")

  All options:
    require("overcast").setup({
      terminal_colors = true,
      italic_comments = true,
      italic_strings  = false,
      bold_functions  = false,
      transparent_bg  = false,
      on_highlights   = nil,  -- function(hl, c) hl.Normal = { fg = c.fg0 } end
      styles          = {},
      load            = nil,  -- "overcast-dawn" to load immediately
    })
--]]

local M = {}

M.config = {
  terminal_colors = true,
  italic_comments = true,
  italic_strings  = false,
  bold_functions  = false,
  transparent_bg  = false,
  on_highlights   = nil,
  styles          = {},
  load            = nil,
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
  if M.config.load then M._load(M.config.load) end
end

function M.load(variant) M._load(variant) end

function M._load(variant)
  local palettes   = require("overcast.palettes")
  local highlights = require("overcast.highlights")
  local terminal   = require("overcast.terminal")

  local c = palettes[variant]
  if not c then
    vim.notify(
      ("[overcast.nvim] Unknown variant %q. Valid: overcast, overcast-dawn"):format(variant),
      vim.log.levels.ERROR
    )
    return
  end

  c = vim.deepcopy(c)

  if vim.fn.has("termguicolors") == 1 then vim.opt.termguicolors = true end

  vim.opt.background = (variant == "overcast-dawn") and "light" or "dark"
  vim.g.colors_name  = variant

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

  if M.config.transparent_bg then c.bg1 = "NONE" end

  highlights.apply(c, M.config)
  M._define_signs()

  if M.config.terminal_colors then terminal.apply(c) end

  if type(M.config.on_highlights) == "function" then
    local overrides = {}
    M.config.on_highlights(overrides, c)
    for group, style in pairs(overrides) do
      vim.api.nvim_set_hl(0, group, style)
    end
  end

  for group, style in pairs(M.config.styles) do
    vim.api.nvim_set_hl(0, group, style)
  end
end

function M.palette(variant)
  variant = variant or vim.g.colors_name or "overcast"
  return require("overcast.palettes")[variant]
end

return M

-- ─── diagnostic signs ────────────────────────────────────────────────────────
-- Called from _load() after highlights are applied.
-- Defines consistent gutter symbols that match the theme's aesthetic.
function M._define_signs()
  local signs = {
    { name = "DiagnosticSignError", text = "E" },
    { name = "DiagnosticSignWarn",  text = "W" },
    { name = "DiagnosticSignInfo",  text = "I" },
    { name = "DiagnosticSignHint",  text = "H" },
  }
  -- Neovim >= 0.10 uses vim.diagnostic.config signs table
  if vim.fn.has("nvim-0.10") == 1 then
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "E",
          [vim.diagnostic.severity.WARN]  = "W",
          [vim.diagnostic.severity.INFO]  = "I",
          [vim.diagnostic.severity.HINT]  = "H",
        },
      },
    })
  else
    for _, s in ipairs(signs) do
      vim.fn.sign_define(s.name, { text = s.text, texthl = s.name, numhl = "" })
    end
  end
end
