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
  {
    "nvim-java/nvim-java",
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      }
    }
  }
}

return plugins
