# Changelog

## [Unreleased]

### Added
- `on_highlights` callback for fine-grained overrides
- `require("overcast").load(variant)` public API
- `setup({ load = "overcast-dawn" })` convenience
- `:checkhealth overcast`
- bufferline.nvim, blink.cmp, dap/dap-ui, todo-comments
- oil.nvim, fidget.nvim, fzf-lua, mini.nvim
- Copilot/Codeium ghost text colors
- Rainbow delimiters
- GitSigns word-diff inline groups
- Noice.nvim

### Fixed
- `italic_comments`, `italic_strings`, `bold_functions` now apply to all subgroups at definition time

## [1.0.0] — Initial release
- overcast (dark) and overcast-dawn (light)
- Full treesitter, LSP semantic tokens, diagnostics
- Telescope, nvim-cmp, GitSigns, Neo-tree, Trouble
- Lualine theme, terminal colors
