local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require('java').setup()

local lspconfig = require "lspconfig"

local servers = {
  "tsserver",
  "rust_analyzer",
  "angularls",
  "tailwindcss",
  "html",
  "zls",
  "svelte",
  "pyright",
  "jdtls"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
