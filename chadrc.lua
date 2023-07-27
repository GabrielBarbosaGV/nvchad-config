local M = {}

M.mappings = require "custom.mappings"

M.plugins = "custom.plugins"

M.ui = {
  theme = "chocolate"
}

vim.cmd("set rnu")

vim.opt.guifont = { "FiraCode NF", ":h12" }

return M
