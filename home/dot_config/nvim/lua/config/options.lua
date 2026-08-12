local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 2
opt.signcolumn = "yes"
opt.tabstop = 2
opt.termguicolors = true
opt.updatetime = 300
opt.mouse = "a"

vim.env.BAT_THEME = "catppuccin"

local signs = { Error = "", Warn = "", Hint = "󰛩", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  severity_sort = true,
  float = { source = "always", border = "rounded", header = "", prefix = "" },
})
