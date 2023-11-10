local M = {}

M.mappings = require "custom.mappings"

M.plugins = "custom.plugins"

vim.cmd("set rnu")

vim.opt.guifont = { "FiraCode NF", ":h12" }

return M
