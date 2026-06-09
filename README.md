# overcast.nvim

> A cool, desaturated Neovim colorscheme family.
> Steel grays, muted teals, dusty purples, and slate blues.
> One plugin. Two variants.

---

<!--
  SCREENSHOTS
  Replace with actual images once you have them.

  ![overcast](./assets/overcast.png)
  ![overcast-dawn](./assets/overcast-dawn.png)
-->

```
[ overcast ]                               [ overcast-dawn ]
  dark · steel gray · cool desaturated       light · pale fog · dark slate ink
```

---

## Variants

| Name | Background | Feel |
|---|---|---|
| `overcast` | dark | Cool gray-green, steel blues, dusty purples |
| `overcast-dawn` | light | Morning fog, pale gray-blue, dark slate ink |

---

## Palette

```
  bg0   #1a1c1c       fg0   #eeeeee       red      #cc5555
  bg1   #222424       fg1   #bbbbbb       green    #5a9e6f
  bg2   #2a2d2d       fg2   #8a8a8a       yellow   #a89a6a
                      fg3   #5a5e5e       blue     #5b8aad
                                          purple   #9c7aaa
                                          cyan     #4d9a94
```

---

## Installation

**lazy.nvim**

```lua
{
  "saeeedhany/overcast.nvim",
  priority = 1000,
  config = function()
    require("overcast").setup({})
    vim.cmd("colorscheme overcast")
  end,
}
```

**packer**

```lua
use {
  "saeeedhany/overcast.nvim",
  config = function()
    require("overcast").setup({})
    vim.cmd("colorscheme overcast")
  end,
}
```

---

## Switching Variants

```lua
vim.cmd("colorscheme overcast")       -- dark
vim.cmd("colorscheme overcast-dawn")  -- light
```

---

## Configuration

All options are optional. These are the defaults:

```lua
require("overcast").setup({
  terminal_colors = true,
  italic_comments = true,
  italic_strings  = false,
  bold_functions  = false,
  transparent_bg  = false,
  styles          = {},     -- override any highlight group
})
```

**Example with overrides:**

```lua
require("overcast").setup({
  italic_comments = false,
  transparent_bg  = true,
  styles = {
    ["@keyword"] = { fg = "#9c7aaa", bold = true },
  },
})
```

---

## Lualine

```lua
require("lualine").setup({
  options = { theme = require("overcast.lualine") },
})
```

Pin to a specific variant:

```lua
require("lualine").setup({
  options = {
    theme = require("overcast.lualine").get("overcast-dawn"),
  },
})
```

---

## Using the Palette

```lua
local c = require("overcast").palette()                   -- active variant
local c = require("overcast").palette("overcast-dawn")    -- specific variant

-- example: bufferline
require("bufferline").setup({
  highlights = {
    buffer_selected    = { fg = c.fg0, bold = true },
    indicator_selected = { fg = c.blue },
  },
})
```

---

## Plugin Support

```
Core              Completion        Git               Navigation
────────────────  ────────────────  ────────────────  ────────────────
Treesitter        nvim-cmp          GitSigns          Telescope
LSP diagnostics   Lualine           Diff highlights   Flash / Hop / Leap
Semantic tokens   Which-key         Neo-tree          Navic
Inlay hints       Trouble           nvim-tree
Terminal colors   nvim-notify
                  Lazy.nvim
                  Mason
                  Snacks.nvim
                  indent-blankline
                  render-markdown
```

---

## Structure

```
overcast.nvim/
├── colors/
│   ├── overcast.lua
│   └── overcast-dawn.lua
└── lua/overcast/
    ├── init.lua          setup(), _load(), palette()
    ├── palettes.lua      both color palettes
    ├── highlights.lua    shared highlight definitions
    ├── terminal.lua      terminal color mappings
    └── lualine.lua       lualine theme (both variants)
```

---

## License

MIT
