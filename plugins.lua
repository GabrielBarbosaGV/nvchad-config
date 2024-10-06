local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { "/usr/local/bin/js-debug/src/dapDebugServer.js", "${port}" }
        }
      }

      for _, lang in ipairs({ "javascript", "typescript" }) do
        require("dap").configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "yarn start",
            cwd = "${workspaceFolder}"
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            -- processId = require("dap.utils").pick_process,
            port = function()
              return vim.fn.input("Please indicate which port should be used: ")
            end,
            cwd = "${workspaceFolder}"
          }
        }
      end
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end
  },
  {
    "f-person/git-blame.nvim",
    lazy = false
  },
  { "marilari88/twoslash-queries.nvim" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    opts = {}
  },
}

return plugins
