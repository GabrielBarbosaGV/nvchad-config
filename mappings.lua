local M = {}

M.abc = {
  n = {
    ["ç"] = { ":" , "Commands" },


    ["<leader>si"] = {
      function()
        require("dap").step_into()
      end
    },

    ["<leader>so"] = {
      function()
        require("dap").step_over()
      end
    },

    ["<leader>co"] = {
      function()
        require("dap").continue()
      end
    },

    ["<leader>tb"] = {
      function()
        require("dap").toggle_breakpoint()
      end
    },


    ["<leader>tui"] = {
      function()
        require("dapui").toggle()
      end
    },

    ["<leader>fl"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  },

  i = {
    ["kj"] = { "<Esc>" },
    ["Kj"] = { "<Esc>" },
    ["kJ"] = { "<Esc>" },
    ["KJ"] = { "<Esc>" }
  }
}

return M
