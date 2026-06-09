-- lua/overcast/highlights.lua
local M = {}

local function load_highlights(c)
  local hl = {}

  -- ─── Editor UI ───────────────────────────────────────────────────────────
  hl.Normal          = { fg = c.fg0, bg = c.bg1 }
  hl.NormalFloat     = { fg = c.fg0, bg = c.bg2 }
  hl.NormalNC        = { fg = c.fg1, bg = c.bg0 }
  hl.FloatBorder     = { fg = c.muted, bg = c.bg2 }
  hl.FloatTitle      = { fg = c.blue, bg = c.bg2 }

  hl.Cursor          = { fg = c.bg1, bg = c.fg0 }
  hl.CursorIM        = { fg = c.bg1, bg = c.fg0 }
  hl.CursorColumn    = { bg = c.bg3 }
  hl.CursorLine      = { bg = c.bg3 }
  hl.CursorLineNr    = { fg = c.blue, bold = true }
  hl.LineNr          = { fg = c.fg3 }
  hl.LineNrAbove     = { fg = c.fg3 }
  hl.LineNrBelow     = { fg = c.fg3 }

  hl.ColorColumn     = { bg = c.bg2 }
  hl.Conceal         = { fg = c.muted }
  hl.SignColumn      = { fg = c.muted, bg = c.bg1 }
  hl.FoldColumn      = { fg = c.muted, bg = c.bg1 }
  hl.Folded          = { fg = c.fg2, bg = c.bg2, italic = true }

  hl.VertSplit       = { fg = c.border }
  hl.WinSeparator    = { fg = c.border }
  hl.EndOfBuffer     = { fg = c.bg2 }
  hl.NonText         = { fg = c.fg3 }
  hl.Whitespace      = { fg = c.bg3 }
  hl.SpecialKey      = { fg = c.muted }

  -- ─── Status / Tab Line ───────────────────────────────────────────────────
  hl.StatusLine      = { fg = c.fg1, bg = c.bg0 }
  hl.StatusLineNC    = { fg = c.muted, bg = c.bg0 }
  hl.TabLine         = { fg = c.muted, bg = c.bg0 }
  hl.TabLineFill     = { bg = c.bg0 }
  hl.TabLineSel      = { fg = c.fg0, bg = c.bg1, bold = true }
  hl.WinBar          = { fg = c.fg2, bg = c.bg1 }
  hl.WinBarNC        = { fg = c.muted, bg = c.bg0 }

  -- ─── Popup / Menu ────────────────────────────────────────────────────────
  hl.Pmenu           = { fg = c.fg1, bg = c.bg2 }
  hl.PmenuSel        = { fg = c.fg0, bg = c.bg4, bold = true }
  hl.PmenuSbar       = { bg = c.bg2 }
  hl.PmenuThumb      = { bg = c.muted }
  hl.PmenuKind       = { fg = c.cyan, bg = c.bg2 }
  hl.PmenuKindSel    = { fg = c.cyan, bg = c.bg4 }
  hl.PmenuExtra      = { fg = c.fg3, bg = c.bg2 }
  hl.PmenuExtraSel   = { fg = c.fg2, bg = c.bg4 }
  hl.WildMenu        = { fg = c.fg0, bg = c.bg4, bold = true }

  -- ─── Search & Selection ──────────────────────────────────────────────────
  hl.Visual          = { bg = c.visual }
  hl.VisualNOS       = { bg = c.visual }
  hl.Search          = { fg = c.bg1, bg = c.yellow }
  hl.CurSearch       = { fg = c.bg1, bg = c.blue, bold = true }
  hl.IncSearch       = { fg = c.bg1, bg = c.blue }
  hl.Substitute      = { fg = c.bg1, bg = c.red }
  hl.MatchParen      = { fg = c.cyan, bold = true, underline = true }

  -- ─── Diagnostics ─────────────────────────────────────────────────────────
  hl.DiagnosticError            = { fg = c.red }
  hl.DiagnosticWarn             = { fg = c.yellow }
  hl.DiagnosticInfo             = { fg = c.blue }
  hl.DiagnosticHint             = { fg = c.cyan }
  hl.DiagnosticOk               = { fg = c.green }

  hl.DiagnosticVirtualTextError = { fg = c.red,    bg = c.diff_delete, italic = true }
  hl.DiagnosticVirtualTextWarn  = { fg = c.yellow, bg = c.diff_change, italic = true }
  hl.DiagnosticVirtualTextInfo  = { fg = c.blue,   bg = c.bg2,         italic = true }
  hl.DiagnosticVirtualTextHint  = { fg = c.cyan,   bg = c.bg2,         italic = true }

  hl.DiagnosticUnderlineError   = { sp = c.red,    undercurl = true }
  hl.DiagnosticUnderlineWarn    = { sp = c.yellow, undercurl = true }
  hl.DiagnosticUnderlineInfo    = { sp = c.blue,   underline = true }
  hl.DiagnosticUnderlineHint    = { sp = c.cyan,   underline = true }

  hl.DiagnosticSignError        = { fg = c.red }
  hl.DiagnosticSignWarn         = { fg = c.yellow }
  hl.DiagnosticSignInfo         = { fg = c.blue }
  hl.DiagnosticSignHint         = { fg = c.cyan }
  hl.DiagnosticDeprecated       = { sp = c.muted, strikethrough = true }

  -- ─── LSP Semantic Tokens ─────────────────────────────────────────────────
  hl["@lsp.type.class"]         = { fg = c.yellow }
  hl["@lsp.type.decorator"]     = { fg = c.purple }
  hl["@lsp.type.enum"]          = { fg = c.yellow }
  hl["@lsp.type.enumMember"]    = { fg = c.fg0 }
  hl["@lsp.type.function"]      = { fg = c.blue }
  hl["@lsp.type.interface"]     = { fg = c.cyan }
  hl["@lsp.type.keyword"]       = { fg = c.purple }
  hl["@lsp.type.macro"]         = { fg = c.purple }
  hl["@lsp.type.method"]        = { fg = c.blue }
  hl["@lsp.type.namespace"]     = { fg = c.yellow }
  hl["@lsp.type.parameter"]     = { fg = c.fg0, italic = true }
  hl["@lsp.type.property"]      = { fg = c.fg1 }
  hl["@lsp.type.struct"]        = { fg = c.yellow }
  hl["@lsp.type.type"]          = { fg = c.yellow }
  hl["@lsp.type.typeParameter"] = { fg = c.yellow, italic = true }
  hl["@lsp.type.variable"]      = { fg = c.fg0 }
  hl["@lsp.mod.deprecated"]     = { sp = c.muted, strikethrough = true }
  hl["@lsp.mod.readonly"]       = { italic = true }

  -- ─── Treesitter ──────────────────────────────────────────────────────────
  hl["@variable"]               = { fg = c.fg0 }
  hl["@variable.builtin"]       = { fg = c.cyan }
  hl["@variable.parameter"]     = { fg = c.fg0, italic = true }
  hl["@variable.member"]        = { fg = c.fg1 }

  hl["@constant"]               = { fg = c.fg0, bold = true }
  hl["@constant.builtin"]       = { fg = c.purple }
  hl["@constant.macro"]         = { fg = c.purple }

  hl["@function"]               = { fg = c.blue }
  hl["@function.builtin"]       = { fg = c.cyan }
  hl["@function.call"]          = { fg = c.blue }
  hl["@function.macro"]         = { fg = c.purple }
  hl["@function.method"]        = { fg = c.blue }
  hl["@function.method.call"]   = { fg = c.blue }

  hl["@constructor"]            = { fg = c.yellow }
  hl["@operator"]               = { fg = c.fg2 }

  hl["@keyword"]                = { fg = c.purple }
  hl["@keyword.conditional"]    = { fg = c.purple }
  hl["@keyword.conditional.ternary"] = { fg = c.purple }
  hl["@keyword.coroutine"]      = { fg = c.purple }
  hl["@keyword.debug"]          = { fg = c.red }
  hl["@keyword.directive"]      = { fg = c.purple }
  hl["@keyword.exception"]      = { fg = c.red }
  hl["@keyword.function"]       = { fg = c.purple }
  hl["@keyword.import"]         = { fg = c.cyan }
  hl["@keyword.modifier"]       = { fg = c.purple }
  hl["@keyword.operator"]       = { fg = c.purple }
  hl["@keyword.repeat"]         = { fg = c.purple }
  hl["@keyword.return"]         = { fg = c.red }
  hl["@keyword.storage"]        = { fg = c.purple }
  hl["@keyword.type"]           = { fg = c.purple }

  hl["@string"]                 = { fg = c.green }
  hl["@string.documentation"]   = { fg = c.green, italic = true }
  hl["@string.escape"]          = { fg = c.purple }
  hl["@string.regexp"]          = { fg = c.yellow }
  hl["@string.special"]         = { fg = c.cyan }
  hl["@string.special.path"]    = { fg = c.cyan }
  hl["@string.special.symbol"]  = { fg = c.cyan }
  hl["@string.special.url"]     = { fg = c.cyan, underline = true }

  hl["@character"]              = { fg = c.green }
  hl["@character.special"]      = { fg = c.purple }

  hl["@number"]                 = { fg = c.fg0, bold = true }
  hl["@number.float"]           = { fg = c.fg0, bold = true }
  hl["@boolean"]                = { fg = c.purple }

  hl["@type"]                   = { fg = c.yellow }
  hl["@type.builtin"]           = { fg = c.yellow, italic = true }
  hl["@type.definition"]        = { fg = c.yellow }
  hl["@type.qualifier"]         = { fg = c.purple }

  hl["@attribute"]              = { fg = c.cyan }
  hl["@attribute.builtin"]      = { fg = c.cyan }
  hl["@property"]               = { fg = c.fg1 }

  hl["@punctuation.bracket"]    = { fg = c.fg2 }
  hl["@punctuation.delimiter"]  = { fg = c.fg2 }
  hl["@punctuation.special"]    = { fg = c.purple }

  hl["@comment"]                = { fg = c.fg2, italic = true }
  hl["@comment.documentation"]  = { fg = c.fg2, italic = true }
  hl["@comment.error"]          = { fg = c.red, bold = true }
  hl["@comment.warning"]        = { fg = c.yellow, bold = true }
  hl["@comment.todo"]           = { fg = c.blue, bold = true }
  hl["@comment.note"]           = { fg = c.cyan, bold = true }

  hl["@markup.heading"]         = { fg = c.blue, bold = true }
  hl["@markup.heading.1"]       = { fg = c.blue, bold = true }
  hl["@markup.heading.2"]       = { fg = c.cyan, bold = true }
  hl["@markup.heading.3"]       = { fg = c.green, bold = true }
  hl["@markup.heading.4"]       = { fg = c.yellow, bold = true }
  hl["@markup.heading.5"]       = { fg = c.purple, bold = true }
  hl["@markup.heading.6"]       = { fg = c.fg1, bold = true }
  hl["@markup.quote"]           = { fg = c.fg2, italic = true }
  hl["@markup.math"]            = { fg = c.yellow }
  hl["@markup.link"]            = { fg = c.cyan, underline = true }
  hl["@markup.link.label"]      = { fg = c.blue }
  hl["@markup.link.url"]        = { fg = c.cyan, underline = true }
  hl["@markup.raw"]             = { fg = c.green }
  hl["@markup.raw.block"]       = { fg = c.green }
  hl["@markup.list"]            = { fg = c.purple }
  hl["@markup.list.checked"]    = { fg = c.green }
  hl["@markup.list.unchecked"]  = { fg = c.muted }
  hl["@markup.strong"]          = { bold = true }
  hl["@markup.italic"]          = { italic = true }
  hl["@markup.strikethrough"]   = { strikethrough = true }

  hl["@module"]                 = { fg = c.yellow }
  hl["@module.builtin"]         = { fg = c.yellow }
  hl["@label"]                  = { fg = c.cyan }
  hl["@tag"]                    = { fg = c.purple }
  hl["@tag.attribute"]          = { fg = c.yellow }
  hl["@tag.delimiter"]          = { fg = c.fg2 }
  hl["@none"]                   = {}
  hl["@conceal"]                = { fg = c.muted }

  -- ─── Legacy syntax groups ────────────────────────────────────────────────
  hl.Comment        = { fg = c.fg2, italic = true }
  hl.Constant       = { fg = c.fg0, bold = true }
  hl.String         = { fg = c.green }
  hl.Character      = { fg = c.green }
  hl.Number         = { fg = c.fg0, bold = true }
  hl.Boolean        = { fg = c.purple }
  hl.Float          = { fg = c.fg0, bold = true }
  hl.Identifier     = { fg = c.fg0 }
  hl.Function       = { fg = c.blue }
  hl.Statement      = { fg = c.purple }
  hl.Conditional    = { fg = c.purple }
  hl.Repeat         = { fg = c.purple }
  hl.Label          = { fg = c.cyan }
  hl.Operator       = { fg = c.fg2 }
  hl.Keyword        = { fg = c.purple }
  hl.Exception      = { fg = c.red }
  hl.PreProc        = { fg = c.cyan }
  hl.Include        = { fg = c.cyan }
  hl.Define         = { fg = c.purple }
  hl.Macro          = { fg = c.purple }
  hl.PreCondit      = { fg = c.purple }
  hl.Type           = { fg = c.yellow }
  hl.StorageClass   = { fg = c.purple }
  hl.Structure      = { fg = c.yellow }
  hl.Typedef        = { fg = c.yellow }
  hl.Special        = { fg = c.purple }
  hl.SpecialChar    = { fg = c.purple }
  hl.Tag            = { fg = c.purple }
  hl.Delimiter      = { fg = c.fg2 }
  hl.SpecialComment = { fg = c.fg2, bold = true }
  hl.Debug          = { fg = c.red }
  hl.Underlined     = { underline = true }
  hl.Ignore         = { fg = c.muted }
  hl.Error          = { fg = c.red, bold = true }
  hl.Todo           = { fg = c.blue, bold = true }

  -- ─── Messages ────────────────────────────────────────────────────────────
  hl.ErrorMsg       = { fg = c.red, bold = true }
  hl.WarningMsg     = { fg = c.yellow, bold = true }
  hl.ModeMsg        = { fg = c.fg0, bold = true }
  hl.MsgArea        = { fg = c.fg1 }
  hl.MsgSeparator   = { fg = c.muted }
  hl.MoreMsg        = { fg = c.green, bold = true }
  hl.Question       = { fg = c.yellow, bold = true }

  -- ─── Diff ────────────────────────────────────────────────────────────────
  hl.DiffAdd        = { bg = c.diff_add }
  hl.DiffChange     = { bg = c.diff_change }
  hl.DiffDelete     = { fg = c.red_dim, bg = c.diff_delete }
  hl.DiffText       = { bg = c.diff_text, bold = true }
  hl.Added          = { fg = c.green }
  hl.Changed        = { fg = c.yellow }
  hl.Removed        = { fg = c.red }

  -- ─── Spell ───────────────────────────────────────────────────────────────
  hl.SpellBad       = { sp = c.red,    undercurl = true }
  hl.SpellCap       = { sp = c.yellow, undercurl = true }
  hl.SpellLocal     = { sp = c.cyan,   undercurl = true }
  hl.SpellRare      = { sp = c.muted,  undercurl = true }

  -- ─── LSP ─────────────────────────────────────────────────────────────────
  hl.LspReferenceText   = { bg = c.bg3 }
  hl.LspReferenceRead   = { bg = c.bg3 }
  hl.LspReferenceWrite  = { bg = c.bg4, bold = true }
  hl.LspCodeLens        = { fg = c.muted, italic = true }
  hl.LspCodeLensSeparator = { fg = c.border }
  hl.LspSignatureActiveParameter = { fg = c.blue, bold = true, underline = true }
  hl.LspInlayHint       = { fg = c.muted, italic = true }

  -- ─── Indent ──────────────────────────────────────────────────────────────
  hl.IblIndent         = { fg = c.border }
  hl.IblScope          = { fg = c.muted }
  hl.IndentBlanklineChar = { fg = c.border }
  hl.IndentBlanklineContextChar = { fg = c.muted }

  -- ─── Telescope ───────────────────────────────────────────────────────────
  hl.TelescopeBorder          = { fg = c.muted, bg = c.bg2 }
  hl.TelescopeNormal          = { fg = c.fg1, bg = c.bg2 }
  hl.TelescopePromptBorder    = { fg = c.blue, bg = c.bg2 }
  hl.TelescopePromptNormal    = { fg = c.fg0, bg = c.bg2 }
  hl.TelescopePromptPrefix    = { fg = c.blue, bg = c.bg2 }
  hl.TelescopePromptTitle     = { fg = c.bg1, bg = c.blue, bold = true }
  hl.TelescopePreviewTitle    = { fg = c.bg1, bg = c.green, bold = true }
  hl.TelescopeResultsTitle    = { fg = c.muted, bg = c.bg2 }
  hl.TelescopeSelection       = { bg = c.bg3 }
  hl.TelescopeSelectionCaret  = { fg = c.blue, bg = c.bg3 }
  hl.TelescopeMatching        = { fg = c.yellow, bold = true }
  hl.TelescopeMultiSelection  = { fg = c.green }
  hl.TelescopeMultiIcon       = { fg = c.green }

  -- ─── nvim-cmp ────────────────────────────────────────────────────────────
  hl.CmpItemAbbr            = { fg = c.fg1 }
  hl.CmpItemAbbrDeprecated  = { fg = c.muted, strikethrough = true }
  hl.CmpItemAbbrMatch       = { fg = c.blue, bold = true }
  hl.CmpItemAbbrMatchFuzzy  = { fg = c.blue }
  hl.CmpItemMenu            = { fg = c.fg3, italic = true }
  hl.CmpItemKind            = { fg = c.cyan }
  hl.CmpItemKindClass       = { fg = c.yellow }
  hl.CmpItemKindColor       = { fg = c.fg0 }
  hl.CmpItemKindConstant    = { fg = c.purple }
  hl.CmpItemKindConstructor = { fg = c.yellow }
  hl.CmpItemKindEnum        = { fg = c.yellow }
  hl.CmpItemKindEnumMember  = { fg = c.fg0 }
  hl.CmpItemKindEvent       = { fg = c.red }
  hl.CmpItemKindField       = { fg = c.fg1 }
  hl.CmpItemKindFile        = { fg = c.fg1 }
  hl.CmpItemKindFolder      = { fg = c.yellow }
  hl.CmpItemKindFunction    = { fg = c.blue }
  hl.CmpItemKindInterface   = { fg = c.cyan }
  hl.CmpItemKindKeyword     = { fg = c.purple }
  hl.CmpItemKindMethod      = { fg = c.blue }
  hl.CmpItemKindModule      = { fg = c.yellow }
  hl.CmpItemKindOperator    = { fg = c.fg2 }
  hl.CmpItemKindProperty    = { fg = c.fg1 }
  hl.CmpItemKindReference   = { fg = c.fg1 }
  hl.CmpItemKindSnippet     = { fg = c.green }
  hl.CmpItemKindStruct      = { fg = c.yellow }
  hl.CmpItemKindText        = { fg = c.fg1 }
  hl.CmpItemKindTypeParameter = { fg = c.yellow }
  hl.CmpItemKindUnit        = { fg = c.fg2 }
  hl.CmpItemKindValue       = { fg = c.fg0 }
  hl.CmpItemKindVariable    = { fg = c.fg0 }

  -- ─── GitSigns ────────────────────────────────────────────────────────────
  hl.GitSignsAdd              = { fg = c.git_add }
  hl.GitSignsAddLn            = { fg = c.git_add }
  hl.GitSignsAddNr            = { fg = c.git_add }
  hl.GitSignsChange           = { fg = c.git_change }
  hl.GitSignsChangeLn         = { fg = c.git_change }
  hl.GitSignsChangeNr         = { fg = c.git_change }
  hl.GitSignsDelete           = { fg = c.git_delete }
  hl.GitSignsDeleteLn         = { fg = c.git_delete }
  hl.GitSignsDeleteNr         = { fg = c.git_delete }
  hl.GitSignsCurrentLineBlame = { fg = c.muted, italic = true }

  -- ─── Neo-tree / Nvim-tree ────────────────────────────────────────────────
  hl.NeoTreeNormal              = { fg = c.fg1, bg = c.bg0 }
  hl.NeoTreeNormalNC            = { fg = c.muted, bg = c.bg0 }
  hl.NeoTreeWinSeparator        = { fg = c.border, bg = c.bg0 }
  hl.NeoTreeDirectoryName       = { fg = c.blue }
  hl.NeoTreeDirectoryIcon       = { fg = c.yellow }
  hl.NeoTreeFileName            = { fg = c.fg1 }
  hl.NeoTreeFileNameOpened      = { fg = c.fg0, bold = true }
  hl.NeoTreeRootName            = { fg = c.cyan, bold = true }
  hl.NeoTreeSymbolicLinkTarget  = { fg = c.cyan }
  hl.NeoTreeGitAdded            = { fg = c.git_add }
  hl.NeoTreeGitConflict         = { fg = c.red, bold = true }
  hl.NeoTreeGitDeleted          = { fg = c.git_delete }
  hl.NeoTreeGitIgnored          = { fg = c.muted }
  hl.NeoTreeGitModified         = { fg = c.git_change }
  hl.NeoTreeGitUnstaged         = { fg = c.yellow }
  hl.NeoTreeGitUntracked        = { fg = c.green }
  hl.NeoTreeGitStaged           = { fg = c.git_add }
  hl.NeoTreeFloatBorder         = { fg = c.muted, bg = c.bg2 }
  hl.NeoTreeFloatTitle          = { fg = c.blue, bg = c.bg2 }
  hl.NeoTreeTitleBar            = { fg = c.bg1, bg = c.blue }

  hl.NvimTreeNormal             = { fg = c.fg1, bg = c.bg0 }
  hl.NvimTreeNormalNC           = { fg = c.muted, bg = c.bg0 }
  hl.NvimTreeFolderName         = { fg = c.blue }
  hl.NvimTreeOpenedFolderName   = { fg = c.blue, bold = true }
  hl.NvimTreeRootFolder         = { fg = c.cyan, bold = true }
  hl.NvimTreeSymlink            = { fg = c.cyan }
  hl.NvimTreeExecFile           = { fg = c.green, bold = true }
  hl.NvimTreeSpecialFile        = { fg = c.yellow }
  hl.NvimTreeGitDirty           = { fg = c.git_change }
  hl.NvimTreeGitNew             = { fg = c.git_add }
  hl.NvimTreeGitDeleted         = { fg = c.git_delete }
  hl.NvimTreeIndentMarker       = { fg = c.border }
  hl.NvimTreeWinSeparator       = { fg = c.border }

  -- ─── Which-key ───────────────────────────────────────────────────────────
  hl.WhichKey           = { fg = c.blue }
  hl.WhichKeyBorder     = { fg = c.muted, bg = c.bg2 }
  hl.WhichKeyDesc       = { fg = c.fg1 }
  hl.WhichKeyFloat      = { bg = c.bg2 }
  hl.WhichKeyGroup      = { fg = c.cyan, bold = true }
  hl.WhichKeySeparator  = { fg = c.muted }
  hl.WhichKeyValue      = { fg = c.fg2 }

  -- ─── Lualine mode colors ─────────────────────────────────────────────────
  hl.LualineNormal      = { fg = c.bg1, bg = c.blue }
  hl.LualineInsert      = { fg = c.bg1, bg = c.green }
  hl.LualineVisual      = { fg = c.bg1, bg = c.purple }
  hl.LualineReplace     = { fg = c.bg1, bg = c.red }
  hl.LualineCommand     = { fg = c.bg1, bg = c.yellow }

  -- ─── Notify ──────────────────────────────────────────────────────────────
  hl.NotifyERRORBorder  = { fg = c.red }
  hl.NotifyWARNBorder   = { fg = c.yellow }
  hl.NotifyINFOBorder   = { fg = c.blue }
  hl.NotifyDEBUGBorder  = { fg = c.muted }
  hl.NotifyTRACEBorder  = { fg = c.muted }
  hl.NotifyERRORIcon    = { fg = c.red }
  hl.NotifyWARNIcon     = { fg = c.yellow }
  hl.NotifyINFOIcon     = { fg = c.blue }
  hl.NotifyDEBUGIcon    = { fg = c.muted }
  hl.NotifyTRACEIcon    = { fg = c.muted }
  hl.NotifyERRORTitle   = { fg = c.red, bold = true }
  hl.NotifyWARNTitle    = { fg = c.yellow, bold = true }
  hl.NotifyINFOTitle    = { fg = c.blue, bold = true }
  hl.NotifyDEBUGTitle   = { fg = c.muted }
  hl.NotifyTRACETitle   = { fg = c.muted }
  hl.NotifyERRORBody    = { fg = c.fg1 }
  hl.NotifyWARNBody     = { fg = c.fg1 }
  hl.NotifyINFOBody     = { fg = c.fg1 }
  hl.NotifyDEBUGBody    = { fg = c.fg2 }
  hl.NotifyTRACEBody    = { fg = c.fg2 }

  -- ─── Trouble ─────────────────────────────────────────────────────────────
  hl.TroubleText        = { fg = c.fg1 }
  hl.TroubleCount       = { fg = c.blue, bg = c.bg2, bold = true }
  hl.TroubleNormal      = { fg = c.fg1, bg = c.bg0 }
  hl.TroubleFile        = { fg = c.cyan }
  hl.TroubleIndent      = { fg = c.muted }
  hl.TroubleFoldIcon    = { fg = c.muted }
  hl.TroubleLocation    = { fg = c.muted }
  hl.TroubleSignError   = { fg = c.red }
  hl.TroubleSignWarn    = { fg = c.yellow }
  hl.TroubleSignInfo    = { fg = c.blue }
  hl.TroubleSignHint    = { fg = c.cyan }

  -- ─── Navic ───────────────────────────────────────────────────────────────
  hl.NavicIconsFile         = { fg = c.fg1 }
  hl.NavicIconsModule       = { fg = c.yellow }
  hl.NavicIconsNamespace    = { fg = c.yellow }
  hl.NavicIconsPackage      = { fg = c.yellow }
  hl.NavicIconsClass        = { fg = c.yellow }
  hl.NavicIconsMethod       = { fg = c.blue }
  hl.NavicIconsProperty     = { fg = c.fg1 }
  hl.NavicIconsField        = { fg = c.fg1 }
  hl.NavicIconsConstructor  = { fg = c.yellow }
  hl.NavicIconsEnum         = { fg = c.yellow }
  hl.NavicIconsInterface    = { fg = c.cyan }
  hl.NavicIconsFunction     = { fg = c.blue }
  hl.NavicIconsVariable     = { fg = c.fg0 }
  hl.NavicIconsConstant     = { fg = c.purple }
  hl.NavicIconsString       = { fg = c.green }
  hl.NavicIconsNumber       = { fg = c.fg0 }
  hl.NavicIconsBoolean      = { fg = c.purple }
  hl.NavicIconsArray        = { fg = c.fg0 }
  hl.NavicIconsObject       = { fg = c.fg0 }
  hl.NavicIconsKey          = { fg = c.purple }
  hl.NavicIconsNull         = { fg = c.muted }
  hl.NavicIconsEnumMember   = { fg = c.fg0 }
  hl.NavicIconsStruct       = { fg = c.yellow }
  hl.NavicIconsEvent        = { fg = c.red }
  hl.NavicIconsOperator     = { fg = c.fg2 }
  hl.NavicIconsTypeParameter = { fg = c.yellow }
  hl.NavicText              = { fg = c.fg2 }
  hl.NavicSeparator         = { fg = c.muted }

  -- ─── Flash / Hop / Leap ──────────────────────────────────────────────────
  hl.FlashBackdrop  = { fg = c.muted }
  hl.FlashLabel     = { fg = c.bg1, bg = c.blue, bold = true }
  hl.FlashMatch     = { fg = c.yellow }
  hl.FlashCurrent   = { fg = c.bg1, bg = c.cyan, bold = true }
  hl.HopNextKey     = { fg = c.blue, bold = true }
  hl.HopNextKey1    = { fg = c.blue, bold = true }
  hl.HopNextKey2    = { fg = c.cyan }
  hl.HopUnmatched   = { fg = c.muted }
  hl.LeapMatch      = { fg = c.blue, bold = true, underline = true }
  hl.LeapLabelPrimary   = { fg = c.bg1, bg = c.blue, bold = true }
  hl.LeapLabelSecondary = { fg = c.bg1, bg = c.cyan }
  hl.LeapBackdrop   = { fg = c.muted }

  -- ─── Lazy.nvim ───────────────────────────────────────────────────────────
  hl.LazyButton         = { bg = c.bg2 }
  hl.LazyButtonActive   = { bg = c.bg3, bold = true }
  hl.LazyComment        = { fg = c.muted }
  hl.LazyCommit         = { fg = c.green }
  hl.LazyCommitIssue    = { fg = c.red }
  hl.LazyCommitScope    = { fg = c.yellow }
  hl.LazyCommitType     = { fg = c.blue }
  hl.LazyDimmed         = { fg = c.muted }
  hl.LazyDir            = { fg = c.blue }
  hl.LazyH1             = { fg = c.bg1, bg = c.blue, bold = true }
  hl.LazyH2             = { fg = c.blue, bold = true }
  hl.LazyNoCond         = { fg = c.red }
  hl.LazyNormal         = { bg = c.bg2 }
  hl.LazyProgressDone   = { fg = c.green, bold = true }
  hl.LazyProgressTodo   = { fg = c.muted }
  hl.LazySpecial        = { fg = c.cyan }
  hl.LazyTaskDone       = { fg = c.green }
  hl.LazyTaskError      = { fg = c.red }
  hl.LazyUrl            = { fg = c.cyan, underline = true }

  -- ─── Mason ───────────────────────────────────────────────────────────────
  hl.MasonHeader            = { fg = c.bg1, bg = c.blue, bold = true }
  hl.MasonHighlight         = { fg = c.blue }
  hl.MasonHighlightBlock    = { fg = c.bg1, bg = c.blue }
  hl.MasonHighlightBlockBold = { fg = c.bg1, bg = c.blue, bold = true }
  hl.MasonMuted             = { fg = c.muted }
  hl.MasonMutedBlock        = { fg = c.bg1, bg = c.muted }
  hl.MasonError             = { fg = c.red }

  -- ─── Render-markdown ─────────────────────────────────────────────────────
  hl.RenderMarkdownH1         = { fg = c.blue,   bold = true }
  hl.RenderMarkdownH2         = { fg = c.cyan,   bold = true }
  hl.RenderMarkdownH3         = { fg = c.green,  bold = true }
  hl.RenderMarkdownH4         = { fg = c.yellow, bold = true }
  hl.RenderMarkdownH5         = { fg = c.purple, bold = true }
  hl.RenderMarkdownH6         = { fg = c.fg1,    bold = true }
  hl.RenderMarkdownH1Bg       = { bg = c.blue_dim }
  hl.RenderMarkdownH2Bg       = { bg = c.cyan_dim }
  hl.RenderMarkdownH3Bg       = { bg = c.green_dim }
  hl.RenderMarkdownH4Bg       = { bg = c.yellow_dim }
  hl.RenderMarkdownH5Bg       = { bg = c.purple_dim }
  hl.RenderMarkdownH6Bg       = { bg = c.bg2 }
  hl.RenderMarkdownCode       = { bg = c.bg2 }
  hl.RenderMarkdownCodeInline = { fg = c.green, bg = c.bg2 }
  hl.RenderMarkdownBullet     = { fg = c.purple }
  hl.RenderMarkdownChecked    = { fg = c.green }
  hl.RenderMarkdownUnchecked  = { fg = c.muted }
  hl.RenderMarkdownLink       = { fg = c.cyan, underline = true }
  hl.RenderMarkdownTableHead  = { fg = c.blue, bold = true }
  hl.RenderMarkdownTableRow   = { fg = c.fg1 }
  hl.RenderMarkdownQuote      = { fg = c.fg2, italic = true }

  -- ─── Snacks.nvim ─────────────────────────────────────────────────────────
  hl.SnacksNormal       = { fg = c.fg1, bg = c.bg2 }
  hl.SnacksBackdrop     = { bg = c.bg0 }
  hl.SnacksPickerBorder = { fg = c.muted, bg = c.bg2 }
  hl.SnacksPickerMatch  = { fg = c.blue, bold = true }
  hl.SnacksPickerTitle  = { fg = c.cyan, bold = true }
  hl.SnacksIndent       = { fg = c.border }
  hl.SnacksIndentScope  = { fg = c.muted }
  hl.SnacksNotifierTitle  = { bold = true }
  hl.SnacksNotifierBorder = { fg = c.muted }
  hl.SnacksNotifierIcon   = { fg = c.blue }

  return hl
end

function M.apply(c)
  local highlights = load_highlights(c)
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
