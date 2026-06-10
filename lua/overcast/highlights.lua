local M = {}

local function load_highlights(c, cfg)
  local hl = {}
  local italic_cmt = cfg.italic_comments
  local italic_str = cfg.italic_strings
  local bold_fn    = cfg.bold_functions

  -- ─── Editor UI ───────────────────────────────────────────────────────────
  hl.Normal       = { fg = c.fg0, bg = c.bg1 }
  hl.NormalFloat  = { fg = c.fg0, bg = c.bg2 }
  hl.NormalNC     = { fg = c.fg1, bg = c.bg0 }
  hl.FloatBorder  = { fg = c.muted, bg = c.bg2 }
  hl.FloatTitle   = { fg = c.blue, bg = c.bg2 }
  hl.Cursor       = { fg = c.bg1, bg = c.fg0 }
  hl.CursorIM     = { fg = c.bg1, bg = c.fg0 }
  hl.CursorColumn = { bg = c.bg3 }
  hl.CursorLine   = { bg = c.bg3 }
  hl.CursorLineNr = { fg = c.blue, bold = true }
  hl.LineNr       = { fg = c.fg3 }
  hl.LineNrAbove  = { fg = c.fg3 }
  hl.LineNrBelow  = { fg = c.fg3 }
  hl.ColorColumn  = { bg = c.bg2 }
  hl.Conceal      = { fg = c.muted }
  hl.SignColumn   = { fg = c.muted, bg = c.bg1 }
  hl.FoldColumn   = { fg = c.muted, bg = c.bg1 }
  hl.Folded       = { fg = c.fg2, bg = c.bg2, italic = true }
  hl.VertSplit    = { fg = c.border }
  hl.WinSeparator = { fg = c.border }
  hl.EndOfBuffer  = { fg = c.bg2 }
  hl.NonText      = { fg = c.fg3 }
  hl.Whitespace   = { fg = c.bg3 }
  hl.SpecialKey   = { fg = c.muted }

  -- ─── Status / Tab ────────────────────────────────────────────────────────
  hl.StatusLine   = { fg = c.fg1, bg = c.bg0 }
  hl.StatusLineNC = { fg = c.muted, bg = c.bg0 }
  hl.TabLine      = { fg = c.muted, bg = c.bg0 }
  hl.TabLineFill  = { bg = c.bg0 }
  hl.TabLineSel   = { fg = c.fg0, bg = c.bg1, bold = true }
  hl.WinBar       = { fg = c.fg2, bg = c.bg1 }
  hl.WinBarNC     = { fg = c.muted, bg = c.bg0 }

  -- ─── Pmenu ───────────────────────────────────────────────────────────────
  hl.Pmenu         = { fg = c.fg1, bg = c.bg2 }
  hl.PmenuSel      = { fg = c.fg0, bg = c.bg4, bold = true }
  hl.PmenuSbar     = { bg = c.bg2 }
  hl.PmenuThumb    = { bg = c.muted }
  hl.PmenuKind     = { fg = c.cyan, bg = c.bg2 }
  hl.PmenuKindSel  = { fg = c.cyan, bg = c.bg4 }
  hl.PmenuExtra    = { fg = c.fg3, bg = c.bg2 }
  hl.PmenuExtraSel = { fg = c.fg2, bg = c.bg4 }
  hl.WildMenu      = { fg = c.fg0, bg = c.bg4, bold = true }

  -- ─── Search & Selection ──────────────────────────────────────────────────
  hl.Visual    = { bg = c.visual }
  hl.VisualNOS = { bg = c.visual }
  hl.Search    = { fg = c.bg1, bg = c.yellow }
  hl.CurSearch = { fg = c.bg1, bg = c.blue, bold = true }
  hl.IncSearch = { fg = c.bg1, bg = c.blue }
  hl.Substitute = { fg = c.bg1, bg = c.red }
  hl.MatchParen = { fg = c.cyan, bold = true, underline = true }

  -- ─── Messages ────────────────────────────────────────────────────────────
  hl.ErrorMsg   = { fg = c.red,    bold = true }
  hl.WarningMsg = { fg = c.yellow, bold = true }
  hl.ModeMsg    = { fg = c.fg0,    bold = true }
  hl.MsgArea    = { fg = c.fg1 }
  hl.MoreMsg    = { fg = c.green,  bold = true }
  hl.Question   = { fg = c.yellow, bold = true }

  -- ─── Diagnostics ─────────────────────────────────────────────────────────
  hl.DiagnosticError            = { fg = c.red }
  hl.DiagnosticWarn             = { fg = c.yellow }
  hl.DiagnosticInfo             = { fg = c.blue }
  hl.DiagnosticHint             = { fg = c.cyan }
  hl.DiagnosticOk               = { fg = c.green }
  hl.DiagnosticVirtualTextError = { fg = c.red,    bg = c.diff_delete, italic = true }
  hl.DiagnosticVirtualTextWarn  = { fg = c.yellow, bg = c.diff_change, italic = true }
  hl.DiagnosticVirtualTextInfo  = { fg = c.blue,   bg = c.bg2, italic = true }
  hl.DiagnosticVirtualTextHint  = { fg = c.cyan,   bg = c.bg2, italic = true }
  hl.DiagnosticUnderlineError   = { sp = c.red,    undercurl = true }
  hl.DiagnosticUnderlineWarn    = { sp = c.yellow, undercurl = true }
  hl.DiagnosticUnderlineInfo    = { sp = c.blue,   underline = true }
  hl.DiagnosticUnderlineHint    = { sp = c.cyan,   underline = true }
  hl.DiagnosticSignError        = { fg = c.red }
  hl.DiagnosticSignWarn         = { fg = c.yellow }
  hl.DiagnosticSignInfo         = { fg = c.blue }
  hl.DiagnosticSignHint         = { fg = c.cyan }
  hl.DiagnosticDeprecated       = { sp = c.muted, strikethrough = true }

  -- ─── LSP ─────────────────────────────────────────────────────────────────
  hl["@lsp.type.class"]         = { fg = c.yellow }
  hl["@lsp.type.decorator"]     = { fg = c.purple }
  hl["@lsp.type.enum"]          = { fg = c.yellow }
  hl["@lsp.type.enumMember"]    = { fg = c.fg0 }
  hl["@lsp.type.function"]      = { fg = c.blue, bold = bold_fn }
  hl["@lsp.type.interface"]     = { fg = c.cyan }
  hl["@lsp.type.keyword"]       = { fg = c.purple }
  hl["@lsp.type.macro"]         = { fg = c.purple }
  hl["@lsp.type.method"]        = { fg = c.blue, bold = bold_fn }
  hl["@lsp.type.namespace"]     = { fg = c.yellow }
  hl["@lsp.type.parameter"]     = { fg = c.fg0, italic = true }
  hl["@lsp.type.property"]      = { fg = c.fg1 }
  hl["@lsp.type.struct"]        = { fg = c.yellow }
  hl["@lsp.type.type"]          = { fg = c.yellow }
  hl["@lsp.type.typeParameter"] = { fg = c.yellow, italic = true }
  hl["@lsp.type.variable"]      = { fg = c.fg0 }
  hl["@lsp.mod.deprecated"]     = { sp = c.muted, strikethrough = true }
  hl["@lsp.mod.readonly"]       = { italic = true }
  hl.LspReferenceText           = { bg = c.bg3 }
  hl.LspReferenceRead           = { bg = c.bg3 }
  hl.LspReferenceWrite          = { bg = c.bg4, bold = true }
  hl.LspCodeLens                = { fg = c.muted, italic = true }
  hl.LspSignatureActiveParameter = { fg = c.blue, bold = true, underline = true }
  hl.LspInlayHint               = { fg = c.muted, italic = true }

  -- ─── Treesitter — variables ───────────────────────────────────────────────
  hl["@variable"]           = { fg = c.fg0 }
  hl["@variable.builtin"]   = { fg = c.cyan }
  hl["@variable.parameter"] = { fg = c.fg0, italic = true }
  hl["@variable.member"]    = { fg = c.fg1 }
  hl["@constant"]           = { fg = c.fg0, bold = true }
  hl["@constant.builtin"]   = { fg = c.purple }
  hl["@constant.macro"]     = { fg = c.purple }

  -- ─── Treesitter — functions ───────────────────────────────────────────────
  hl["@function"]             = { fg = c.blue, bold = bold_fn }
  hl["@function.builtin"]     = { fg = c.cyan, bold = bold_fn }
  hl["@function.call"]        = { fg = c.blue, bold = bold_fn }
  hl["@function.macro"]       = { fg = c.purple }
  hl["@function.method"]      = { fg = c.blue, bold = bold_fn }
  hl["@function.method.call"] = { fg = c.blue, bold = bold_fn }
  hl["@constructor"]          = { fg = c.yellow }
  hl["@operator"]             = { fg = c.fg2 }

  -- ─── Treesitter — keywords ────────────────────────────────────────────────
  hl["@keyword"]                     = { fg = c.purple }
  hl["@keyword.conditional"]         = { fg = c.purple }
  hl["@keyword.conditional.ternary"] = { fg = c.purple }
  hl["@keyword.coroutine"]           = { fg = c.purple }
  hl["@keyword.debug"]               = { fg = c.red }
  hl["@keyword.directive"]           = { fg = c.purple }
  hl["@keyword.exception"]           = { fg = c.red }
  hl["@keyword.function"]            = { fg = c.purple }
  hl["@keyword.import"]              = { fg = c.cyan }
  hl["@keyword.modifier"]            = { fg = c.purple }
  hl["@keyword.operator"]            = { fg = c.purple }
  hl["@keyword.repeat"]              = { fg = c.purple }
  hl["@keyword.return"]              = { fg = c.red }
  hl["@keyword.storage"]             = { fg = c.purple }
  hl["@keyword.type"]                = { fg = c.purple }

  -- ─── Treesitter — strings ─────────────────────────────────────────────────
  hl["@string"]                = { fg = c.green, italic = italic_str }
  hl["@string.documentation"]  = { fg = c.green, italic = true }
  hl["@string.escape"]         = { fg = c.purple, italic = italic_str }
  hl["@string.regexp"]         = { fg = c.yellow, italic = italic_str }
  hl["@string.special"]        = { fg = c.cyan,   italic = italic_str }
  hl["@string.special.path"]   = { fg = c.cyan }
  hl["@string.special.symbol"] = { fg = c.cyan }
  hl["@string.special.url"]    = { fg = c.cyan, underline = true }
  hl["@character"]             = { fg = c.green }
  hl["@character.special"]     = { fg = c.purple }

  -- ─── Treesitter — numbers / types ─────────────────────────────────────────
  hl["@number"]         = { fg = c.fg0, bold = true }
  hl["@number.float"]   = { fg = c.fg0, bold = true }
  hl["@boolean"]        = { fg = c.purple }
  hl["@type"]           = { fg = c.yellow }
  hl["@type.builtin"]   = { fg = c.yellow, italic = true }
  hl["@type.definition"]= { fg = c.yellow }
  hl["@type.qualifier"] = { fg = c.purple }
  hl["@attribute"]      = { fg = c.cyan }
  hl["@attribute.builtin"] = { fg = c.cyan }
  hl["@property"]       = { fg = c.fg1 }

  -- ─── Treesitter — punctuation ─────────────────────────────────────────────
  hl["@punctuation.bracket"]   = { fg = c.fg2 }
  hl["@punctuation.delimiter"] = { fg = c.fg2 }
  hl["@punctuation.special"]   = { fg = c.purple }

  -- ─── Treesitter — comments ────────────────────────────────────────────────
  hl["@comment"]               = { fg = c.fg2, italic = italic_cmt }
  hl["@comment.documentation"] = { fg = c.fg2, italic = italic_cmt }
  hl["@comment.error"]         = { fg = c.red,    bold = true, italic = italic_cmt }
  hl["@comment.warning"]       = { fg = c.yellow, bold = true, italic = italic_cmt }
  hl["@comment.todo"]          = { fg = c.blue,   bold = true, italic = italic_cmt }
  hl["@comment.note"]          = { fg = c.cyan,   bold = true, italic = italic_cmt }

  -- ─── Treesitter — markup ──────────────────────────────────────────────────
  hl["@markup.heading"]      = { fg = c.blue,   bold = true }
  hl["@markup.heading.1"]    = { fg = c.blue,   bold = true }
  hl["@markup.heading.2"]    = { fg = c.cyan,   bold = true }
  hl["@markup.heading.3"]    = { fg = c.green,  bold = true }
  hl["@markup.heading.4"]    = { fg = c.yellow, bold = true }
  hl["@markup.heading.5"]    = { fg = c.purple, bold = true }
  hl["@markup.heading.6"]    = { fg = c.fg1,    bold = true }
  hl["@markup.quote"]        = { fg = c.fg2, italic = true }
  hl["@markup.math"]         = { fg = c.yellow }
  hl["@markup.link"]         = { fg = c.cyan, underline = true }
  hl["@markup.link.label"]   = { fg = c.blue }
  hl["@markup.link.url"]     = { fg = c.cyan, underline = true }
  hl["@markup.raw"]          = { fg = c.green }
  hl["@markup.raw.block"]    = { fg = c.green }
  hl["@markup.list"]         = { fg = c.purple }
  hl["@markup.list.checked"] = { fg = c.green }
  hl["@markup.list.unchecked"] = { fg = c.muted }
  hl["@markup.strong"]       = { bold = true }
  hl["@markup.italic"]       = { italic = true }
  hl["@markup.strikethrough"]= { strikethrough = true }
  hl["@module"]              = { fg = c.yellow }
  hl["@module.builtin"]      = { fg = c.yellow }
  hl["@label"]               = { fg = c.cyan }
  hl["@tag"]                 = { fg = c.purple }
  hl["@tag.attribute"]       = { fg = c.yellow }
  hl["@tag.delimiter"]       = { fg = c.fg2 }
  hl["@none"]                = {}
  hl["@conceal"]             = { fg = c.muted }

  -- ─── Legacy syntax ────────────────────────────────────────────────────────
  hl.Comment     = { fg = c.fg2,    italic = italic_cmt }
  hl.Constant    = { fg = c.fg0,    bold = true }
  hl.String      = { fg = c.green,  italic = italic_str }
  hl.Character   = { fg = c.green }
  hl.Number      = { fg = c.fg0,    bold = true }
  hl.Boolean     = { fg = c.purple }
  hl.Float       = { fg = c.fg0,    bold = true }
  hl.Identifier  = { fg = c.fg0 }
  hl.Function    = { fg = c.blue,   bold = bold_fn }
  hl.Statement   = { fg = c.purple }
  hl.Conditional = { fg = c.purple }
  hl.Repeat      = { fg = c.purple }
  hl.Label       = { fg = c.cyan }
  hl.Operator    = { fg = c.fg2 }
  hl.Keyword     = { fg = c.purple }
  hl.Exception   = { fg = c.red }
  hl.PreProc     = { fg = c.cyan }
  hl.Include     = { fg = c.cyan }
  hl.Define      = { fg = c.purple }
  hl.Macro       = { fg = c.purple }
  hl.PreCondit   = { fg = c.purple }
  hl.Type        = { fg = c.yellow }
  hl.StorageClass= { fg = c.purple }
  hl.Structure   = { fg = c.yellow }
  hl.Typedef     = { fg = c.yellow }
  hl.Special     = { fg = c.purple }
  hl.SpecialChar = { fg = c.purple }
  hl.Tag         = { fg = c.purple }
  hl.Delimiter   = { fg = c.fg2 }
  hl.SpecialComment = { fg = c.fg2, bold = true }
  hl.Debug       = { fg = c.red }
  hl.Underlined  = { underline = true }
  hl.Ignore      = { fg = c.muted }
  hl.Error       = { fg = c.red, bold = true }
  hl.Todo        = { fg = c.blue, bold = true }

  -- ─── Diff ────────────────────────────────────────────────────────────────
  hl.DiffAdd    = { bg = c.diff_add }
  hl.DiffChange = { bg = c.diff_change }
  hl.DiffDelete = { fg = c.red_dim, bg = c.diff_delete }
  hl.DiffText   = { bg = c.diff_text, bold = true }
  hl.Added      = { fg = c.green }
  hl.Changed    = { fg = c.yellow }
  hl.Removed    = { fg = c.red }

  -- ─── Spell ───────────────────────────────────────────────────────────────
  hl.SpellBad   = { sp = c.red,    undercurl = true }
  hl.SpellCap   = { sp = c.yellow, undercurl = true }
  hl.SpellLocal = { sp = c.cyan,   undercurl = true }
  hl.SpellRare  = { sp = c.muted,  undercurl = true }

  -- ─── Indent ──────────────────────────────────────────────────────────────
  hl.IblIndent                  = { fg = c.border }
  hl.IblScope                   = { fg = c.muted }
  hl.IndentBlanklineChar        = { fg = c.border }
  hl.IndentBlanklineContextChar = { fg = c.muted }

  -- ─── Telescope ───────────────────────────────────────────────────────────
  hl.TelescopeBorder         = { fg = c.muted,  bg = c.bg2 }
  hl.TelescopeNormal         = { fg = c.fg1,    bg = c.bg2 }
  hl.TelescopePromptBorder   = { fg = c.blue,   bg = c.bg2 }
  hl.TelescopePromptNormal   = { fg = c.fg0,    bg = c.bg2 }
  hl.TelescopePromptPrefix   = { fg = c.blue,   bg = c.bg2 }
  hl.TelescopePromptTitle    = { fg = c.bg1,    bg = c.blue,  bold = true }
  hl.TelescopePreviewTitle   = { fg = c.bg1,    bg = c.green, bold = true }
  hl.TelescopeResultsTitle   = { fg = c.muted,  bg = c.bg2 }
  hl.TelescopeSelection      = { bg = c.bg3 }
  hl.TelescopeSelectionCaret = { fg = c.blue,   bg = c.bg3 }
  hl.TelescopeMatching       = { fg = c.yellow, bold = true }
  hl.TelescopeMultiSelection = { fg = c.green }

  -- ─── nvim-cmp ────────────────────────────────────────────────────────────
  hl.CmpItemAbbr           = { fg = c.fg1 }
  hl.CmpItemAbbrDeprecated = { fg = c.muted, strikethrough = true }
  hl.CmpItemAbbrMatch      = { fg = c.blue,  bold = true }
  hl.CmpItemAbbrMatchFuzzy = { fg = c.blue }
  hl.CmpItemMenu           = { fg = c.fg3,   italic = true }
  hl.CmpItemKind           = { fg = c.cyan }
  hl.CmpItemKindClass      = { fg = c.yellow }
  hl.CmpItemKindConstant   = { fg = c.purple }
  hl.CmpItemKindFunction   = { fg = c.blue }
  hl.CmpItemKindKeyword    = { fg = c.purple }
  hl.CmpItemKindMethod     = { fg = c.blue }
  hl.CmpItemKindSnippet    = { fg = c.green }
  hl.CmpItemKindStruct     = { fg = c.yellow }
  hl.CmpItemKindType       = { fg = c.yellow }
  hl.CmpItemKindVariable   = { fg = c.fg0 }

  -- ─── blink.cmp ───────────────────────────────────────────────────────────
  hl.BlinkCmpMenu          = { fg = c.fg1,    bg = c.bg2 }
  hl.BlinkCmpMenuBorder    = { fg = c.muted,  bg = c.bg2 }
  hl.BlinkCmpMenuSelection = { fg = c.fg0,    bg = c.bg4, bold = true }
  hl.BlinkCmpLabelMatch    = { fg = c.blue,   bold = true }
  hl.BlinkCmpLabel         = { fg = c.fg1 }
  hl.BlinkCmpLabelDeprecated = { fg = c.muted, strikethrough = true }
  hl.BlinkCmpDoc           = { fg = c.fg1,    bg = c.bg2 }
  hl.BlinkCmpDocBorder     = { fg = c.muted,  bg = c.bg2 }
  hl.BlinkCmpKind          = { fg = c.cyan }
  hl.BlinkCmpKindFunction  = { fg = c.blue }
  hl.BlinkCmpKindKeyword   = { fg = c.purple }
  hl.BlinkCmpKindSnippet   = { fg = c.green }
  hl.BlinkCmpKindVariable  = { fg = c.fg0 }

  -- ─── GitSigns ────────────────────────────────────────────────────────────
  hl.GitSignsAdd              = { fg = c.git_add }
  hl.GitSignsChange           = { fg = c.git_change }
  hl.GitSignsDelete           = { fg = c.git_delete }
  hl.GitSignsCurrentLineBlame = { fg = c.muted, italic = true }
  hl.GitSignsAddInline        = { bg = c.green_dim }
  hl.GitSignsDeleteInline     = { bg = c.red_dim }
  hl.GitSignsChangeInline     = { bg = c.yellow_dim }

  -- ─── Bufferline ──────────────────────────────────────────────────────────
  hl.BufferLineBackground      = { fg = c.muted, bg = c.bg0 }
  hl.BufferLineBufferSelected  = { fg = c.fg0,   bg = c.bg1, bold = true }
  hl.BufferLineBufferVisible   = { fg = c.fg2,   bg = c.bg2 }
  hl.BufferLineFill            = { bg = c.bg0 }
  hl.BufferLineIndicatorSelected = { fg = c.blue, bg = c.bg1 }
  hl.BufferLineModified        = { fg = c.yellow, bg = c.bg0 }
  hl.BufferLineModifiedSelected = { fg = c.yellow, bg = c.bg1 }
  hl.BufferLineSeparator       = { fg = c.border, bg = c.bg0 }
  hl.BufferLineSeparatorSelected = { fg = c.border, bg = c.bg1 }
  hl.BufferLineTab             = { fg = c.muted, bg = c.bg0 }
  hl.BufferLineTabSelected     = { fg = c.fg0,   bg = c.bg1, bold = true }
  hl.BufferLineCloseButtonSelected = { fg = c.red, bg = c.bg1 }
  hl.BufferLineError           = { fg = c.red,    bg = c.bg0 }
  hl.BufferLineErrorSelected   = { fg = c.red,    bg = c.bg1, bold = true }
  hl.BufferLineWarning         = { fg = c.yellow, bg = c.bg0 }
  hl.BufferLineWarningSelected = { fg = c.yellow, bg = c.bg1, bold = true }
  hl.BufferLineNumbers         = { fg = c.muted,  bg = c.bg0 }
  hl.BufferLineNumbersSelected = { fg = c.fg0,    bg = c.bg1, bold = true }
  hl.BufferLineOffset          = { fg = c.fg2,    bg = c.bg0, bold = true }
  hl.BufferLinePick            = { fg = c.blue,   bg = c.bg0, bold = true }
  hl.BufferLinePickSelected    = { fg = c.blue,   bg = c.bg1, bold = true }

  -- ─── Noice ───────────────────────────────────────────────────────────────
  hl.NoiceCmdline            = { fg = c.fg0,    bg = c.bg2 }
  hl.NoiceCmdlineIcon        = { fg = c.blue,   bg = c.bg2 }
  hl.NoiceCmdlineIconSearch  = { fg = c.yellow, bg = c.bg2 }
  hl.NoiceCmdlinePopup       = { fg = c.fg0,    bg = c.bg2 }
  hl.NoiceCmdlinePopupBorder = { fg = c.muted,  bg = c.bg2 }
  hl.NoiceCmdlinePopupTitle  = { fg = c.blue,   bg = c.bg2 }
  hl.NoicePopup              = { fg = c.fg0,    bg = c.bg2 }
  hl.NoicePopupBorder        = { fg = c.muted,  bg = c.bg2 }
  hl.NoiceConfirm            = { fg = c.fg0,    bg = c.bg2 }
  hl.NoiceConfirmBorder      = { fg = c.blue,   bg = c.bg2 }
  hl.NoiceMini               = { fg = c.fg1,    bg = c.bg0 }

  -- ─── nvim-dap ────────────────────────────────────────────────────────────
  hl.DapBreakpoint          = { fg = c.red }
  hl.DapBreakpointCondition = { fg = c.yellow }
  hl.DapBreakpointRejected  = { fg = c.muted }
  hl.DapLogPoint            = { fg = c.cyan }
  hl.DapStopped             = { fg = c.green, bg = c.diff_add }
  hl.DapStoppedLine         = { bg = c.diff_add }
  hl.DapUIScope             = { fg = c.blue,   bold = true }
  hl.DapUIType              = { fg = c.yellow }
  hl.DapUIValue             = { fg = c.fg0 }
  hl.DapUIModifiedValue     = { fg = c.blue,   bold = true }
  hl.DapUIThread            = { fg = c.green }
  hl.DapUIStoppedThread     = { fg = c.blue,   bold = true }
  hl.DapUIBreakpointsPath   = { fg = c.cyan }
  hl.DapUIPlayPause         = { fg = c.green }
  hl.DapUIRestart           = { fg = c.green }
  hl.DapUIStop              = { fg = c.red }
  hl.DapUIStepOver          = { fg = c.blue }
  hl.DapUIStepInto          = { fg = c.blue }
  hl.DapUIStepOut           = { fg = c.blue }

  -- ─── todo-comments ───────────────────────────────────────────────────────
  hl.TodoFgFIX   = { fg = c.red }
  hl.TodoFgTODO  = { fg = c.blue }
  hl.TodoFgHACK  = { fg = c.yellow }
  hl.TodoFgWARN  = { fg = c.yellow }
  hl.TodoFgNOTE  = { fg = c.green }
  hl.TodoBgFIX   = { fg = c.bg1, bg = c.red,    bold = true }
  hl.TodoBgTODO  = { fg = c.bg1, bg = c.blue,   bold = true }
  hl.TodoBgHACK  = { fg = c.bg1, bg = c.yellow, bold = true }
  hl.TodoBgWARN  = { fg = c.bg1, bg = c.yellow, bold = true }
  hl.TodoBgNOTE  = { fg = c.bg1, bg = c.green,  bold = true }
  hl.TodoSignFIX  = { fg = c.red }
  hl.TodoSignTODO = { fg = c.blue }
  hl.TodoSignHACK = { fg = c.yellow }
  hl.TodoSignWARN = { fg = c.yellow }
  hl.TodoSignNOTE = { fg = c.green }

  -- ─── oil.nvim ────────────────────────────────────────────────────────────
  hl.OilDir     = { fg = c.blue }
  hl.OilDirIcon = { fg = c.yellow }
  hl.OilFile    = { fg = c.fg1 }
  hl.OilLink    = { fg = c.cyan }
  hl.OilCreate  = { fg = c.green }
  hl.OilDelete  = { fg = c.red }
  hl.OilMove    = { fg = c.yellow }
  hl.OilChange  = { fg = c.blue }

  -- ─── fidget.nvim ─────────────────────────────────────────────────────────
  hl.FidgetTitle = { fg = c.blue,  bold = true }
  hl.FidgetTask  = { fg = c.muted }

  -- ─── fzf-lua ─────────────────────────────────────────────────────────────
  hl.FzfLuaNormal     = { fg = c.fg1,    bg = c.bg2 }
  hl.FzfLuaBorder     = { fg = c.muted,  bg = c.bg2 }
  hl.FzfLuaTitle      = { fg = c.blue,   bold = true }
  hl.FzfLuaSearch     = { fg = c.yellow, bold = true }
  hl.FzfLuaCursor     = { fg = c.bg1,    bg = c.blue }
  hl.FzfLuaFzfPointer = { fg = c.blue }
  hl.FzfLuaBufName    = { fg = c.blue }
  hl.FzfLuaBufNr      = { fg = c.fg3 }

  -- ─── Copilot / AI ────────────────────────────────────────────────────────
  hl.CopilotSuggestion = { fg = c.muted, italic = true }
  hl.CopilotAnnotation = { fg = c.muted, italic = true }
  hl.CodeiumSuggestion = { fg = c.muted, italic = true }

  -- ─── Rainbow delimiters ───────────────────────────────────────────────────
  hl.RainbowDelimiterRed    = { fg = c.red }
  hl.RainbowDelimiterYellow = { fg = c.yellow }
  hl.RainbowDelimiterBlue   = { fg = c.blue }
  hl.RainbowDelimiterOrange = { fg = c.yellow }
  hl.RainbowDelimiterGreen  = { fg = c.green }
  hl.RainbowDelimiterViolet = { fg = c.purple }
  hl.RainbowDelimiterCyan   = { fg = c.cyan }

  -- ─── mini.nvim ───────────────────────────────────────────────────────────
  hl.MiniFilesBorder           = { fg = c.muted, bg = c.bg2 }
  hl.MiniFilesDirectory        = { fg = c.blue }
  hl.MiniFilesFile             = { fg = c.fg1 }
  hl.MiniFilesNormal           = { fg = c.fg1,   bg = c.bg2 }
  hl.MiniFilesTitle            = { fg = c.blue,  bold = true }
  hl.MiniPickBorder            = { fg = c.muted, bg = c.bg2 }
  hl.MiniPickMatchRanges       = { fg = c.blue,  bold = true }
  hl.MiniPickNormal            = { fg = c.fg1,   bg = c.bg2 }
  hl.MiniPickPrompt            = { fg = c.blue,  bg = c.bg2 }
  hl.MiniStatuslineModeNormal  = { fg = c.bg1,   bg = c.blue,   bold = true }
  hl.MiniStatuslineModeInsert  = { fg = c.bg1,   bg = c.green,  bold = true }
  hl.MiniStatuslineModeVisual  = { fg = c.bg1,   bg = c.purple, bold = true }
  hl.MiniStatuslineModeReplace = { fg = c.bg1,   bg = c.red,    bold = true }
  hl.MiniStatuslineModeCommand = { fg = c.bg1,   bg = c.cyan,   bold = true }
  hl.MiniJump                  = { fg = c.bg1,   bg = c.blue,   bold = true }
  hl.MiniJump2dSpot            = { fg = c.blue,  bold = true, nocombine = true }
  hl.MiniCursorword            = { bg = c.bg3 }
  hl.MiniSurround              = { fg = c.bg1,   bg = c.blue }
  hl.MiniIndentscopeSymbol     = { fg = c.muted }

  -- ─── Which-key ───────────────────────────────────────────────────────────
  hl.WhichKey          = { fg = c.blue }
  hl.WhichKeyBorder    = { fg = c.muted, bg = c.bg2 }
  hl.WhichKeyDesc      = { fg = c.fg1 }
  hl.WhichKeyFloat     = { bg = c.bg2 }
  hl.WhichKeyGroup     = { fg = c.cyan, bold = true }
  hl.WhichKeySeparator = { fg = c.muted }
  hl.WhichKeyValue     = { fg = c.fg2 }

  -- ─── Trouble ─────────────────────────────────────────────────────────────
  hl.TroubleNormal    = { fg = c.fg1,    bg = c.bg0 }
  hl.TroubleText      = { fg = c.fg1 }
  hl.TroubleCount     = { fg = c.blue,   bg = c.bg2, bold = true }
  hl.TroubleFile      = { fg = c.cyan }
  hl.TroubleIndent    = { fg = c.muted }
  hl.TroubleSignError = { fg = c.red }
  hl.TroubleSignWarn  = { fg = c.yellow }
  hl.TroubleSignInfo  = { fg = c.blue }
  hl.TroubleSignHint  = { fg = c.cyan }

  -- ─── Navic ───────────────────────────────────────────────────────────────
  hl.NavicIconsFunction  = { fg = c.blue }
  hl.NavicIconsMethod    = { fg = c.blue }
  hl.NavicIconsClass     = { fg = c.yellow }
  hl.NavicIconsInterface = { fg = c.cyan }
  hl.NavicIconsConstant  = { fg = c.purple }
  hl.NavicIconsVariable  = { fg = c.fg0 }
  hl.NavicText           = { fg = c.fg2 }
  hl.NavicSeparator      = { fg = c.muted }

  -- ─── Flash / Hop / Leap ──────────────────────────────────────────────────
  hl.FlashBackdrop      = { fg = c.muted }
  hl.FlashLabel         = { fg = c.bg1, bg = c.blue, bold = true }
  hl.FlashMatch         = { fg = c.yellow }
  hl.FlashCurrent       = { fg = c.bg1, bg = c.cyan, bold = true }
  hl.HopNextKey         = { fg = c.blue,   bold = true }
  hl.HopNextKey1        = { fg = c.blue,   bold = true }
  hl.HopNextKey2        = { fg = c.cyan }
  hl.HopUnmatched       = { fg = c.muted }
  hl.LeapLabelPrimary   = { fg = c.bg1, bg = c.blue,   bold = true }
  hl.LeapLabelSecondary = { fg = c.bg1, bg = c.cyan }
  hl.LeapBackdrop       = { fg = c.muted }

  -- ─── Notify ──────────────────────────────────────────────────────────────
  hl.NotifyERRORBorder = { fg = c.red }
  hl.NotifyWARNBorder  = { fg = c.yellow }
  hl.NotifyINFOBorder  = { fg = c.blue }
  hl.NotifyERRORTitle  = { fg = c.red,    bold = true }
  hl.NotifyWARNTitle   = { fg = c.yellow, bold = true }
  hl.NotifyINFOTitle   = { fg = c.blue,   bold = true }
  hl.NotifyERRORBody   = { fg = c.fg1 }
  hl.NotifyWARNBody    = { fg = c.fg1 }
  hl.NotifyINFOBody    = { fg = c.fg1 }

  -- ─── Snacks.nvim ─────────────────────────────────────────────────────────
  hl.SnacksNormal         = { fg = c.fg1,    bg = c.bg2 }
  hl.SnacksBackdrop       = { bg = c.bg0 }
  hl.SnacksPickerBorder   = { fg = c.muted,  bg = c.bg2 }
  hl.SnacksPickerMatch    = { fg = c.blue,   bold = true }
  hl.SnacksPickerTitle    = { fg = c.cyan,   bold = true }
  hl.SnacksIndent         = { fg = c.border }
  hl.SnacksIndentScope    = { fg = c.muted }
  hl.SnacksNotifierTitle  = { bold = true }
  hl.SnacksNotifierBorder = { fg = c.muted }
  hl.SnacksNotifierIcon   = { fg = c.blue }

  -- ─── Lazy.nvim ───────────────────────────────────────────────────────────
  hl.LazyH1           = { fg = c.bg1,  bg = c.blue, bold = true }
  hl.LazyH2           = { fg = c.blue, bold = true }
  hl.LazyButton       = { bg = c.bg2 }
  hl.LazyButtonActive = { bg = c.bg3, bold = true }
  hl.LazyCommit       = { fg = c.green }
  hl.LazyCommitType   = { fg = c.blue }
  hl.LazyProgressDone = { fg = c.green, bold = true }
  hl.LazyProgressTodo = { fg = c.muted }
  hl.LazySpecial      = { fg = c.cyan }
  hl.LazyTaskDone     = { fg = c.green }
  hl.LazyTaskError    = { fg = c.red }
  hl.LazyNormal       = { bg = c.bg2 }

  -- ─── Mason ───────────────────────────────────────────────────────────────
  hl.MasonHeader           = { fg = c.bg1,  bg = c.blue, bold = true }
  hl.MasonHighlight        = { fg = c.blue }
  hl.MasonHighlightBlock   = { fg = c.bg1,  bg = c.blue }
  hl.MasonMuted            = { fg = c.muted }
  hl.MasonError            = { fg = c.red }

  -- ─── render-markdown ─────────────────────────────────────────────────────
  hl.RenderMarkdownH1      = { fg = c.blue,   bold = true }
  hl.RenderMarkdownH2      = { fg = c.cyan,   bold = true }
  hl.RenderMarkdownH3      = { fg = c.green,  bold = true }
  hl.RenderMarkdownH4      = { fg = c.yellow, bold = true }
  hl.RenderMarkdownH1Bg    = { bg = c.blue_dim }
  hl.RenderMarkdownH2Bg    = { bg = c.cyan_dim }
  hl.RenderMarkdownH3Bg    = { bg = c.green_dim }
  hl.RenderMarkdownCode    = { bg = c.bg2 }
  hl.RenderMarkdownBullet  = { fg = c.purple }
  hl.RenderMarkdownChecked = { fg = c.green }
  hl.RenderMarkdownLink    = { fg = c.cyan, underline = true }
  hl.RenderMarkdownTableHead = { fg = c.blue, bold = true }
  hl.RenderMarkdownTableRow  = { fg = c.fg1 }

  -- ─── NeoTree / NvimTree ──────────────────────────────────────────────────
  hl.NeoTreeNormal         = { fg = c.fg1,   bg = c.bg0 }
  hl.NeoTreeDirectoryName  = { fg = c.blue }
  hl.NeoTreeDirectoryIcon  = { fg = c.yellow }
  hl.NeoTreeFileName       = { fg = c.fg1 }
  hl.NeoTreeRootName       = { fg = c.cyan,  bold = true }
  hl.NeoTreeGitAdded       = { fg = c.git_add }
  hl.NeoTreeGitModified    = { fg = c.git_change }
  hl.NeoTreeGitDeleted     = { fg = c.git_delete }
  hl.NeoTreeGitIgnored     = { fg = c.muted }
  hl.NvimTreeNormal        = { fg = c.fg1,   bg = c.bg0 }
  hl.NvimTreeFolderName    = { fg = c.blue }
  hl.NvimTreeRootFolder    = { fg = c.cyan,  bold = true }

  return hl
end

function M.apply(c, cfg)
  cfg = cfg or { italic_comments = true, italic_strings = false, bold_functions = false }
  local highlights = load_highlights(c, cfg)
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
