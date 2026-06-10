local M = {}

function M.check()
  vim.health.start("overcast.nvim — neovim version")
  local v = vim.version()
  if v.major > 0 or (v.major == 0 and v.minor >= 9) then
    vim.health.ok(("neovim %d.%d.%d"):format(v.major, v.minor, v.patch))
  else
    vim.health.error(
      ("neovim %d.%d.%d — overcast requires >= 0.9"):format(v.major, v.minor, v.patch),
      { "upgrade neovim: https://github.com/neovim/neovim/releases" }
    )
  end

  vim.health.start("overcast.nvim — terminal colors")
  if vim.o.termguicolors then
    vim.health.ok("termguicolors enabled")
  else
    vim.health.warn("termguicolors not enabled", { "add `vim.opt.termguicolors = true`" })
  end

  vim.health.start("overcast.nvim — colorscheme")
  local name = vim.g.colors_name or ""
  if name == "overcast" or name == "overcast-dawn" then
    vim.health.ok(("active: %s"):format(name))
  else
    vim.health.warn(("active colorscheme is %q, not an overcast variant"):format(name))
  end

  vim.health.start("overcast.nvim — treesitter")
  if pcall(require, "nvim-treesitter") then
    vim.health.ok("nvim-treesitter found")
  else
    vim.health.info("nvim-treesitter not found — using legacy syntax groups")
  end
end

return M
