vim.cmd("set rnu")

vim.opt.guifont = { "FiraCode NF", ":h12" }

local java_augroup_id = vim.api.nvim_create_augroup("Java", {
  clear = true
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  group = java_augroup_id,
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
  pattern = {"*.java"}
})
