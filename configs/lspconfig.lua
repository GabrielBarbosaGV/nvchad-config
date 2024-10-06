local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "rust_analyzer",
  "angularls",
  "tailwindcss",
  "html",
  "svelte",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end

lspconfig["tsserver"].setup {
  on_attach = function(client, bufnr)
    require("twoslash-queries").attach(client, bufnr)

    on_attach(client, bufnr)
  end,

  capabilities = capabilities
}

lspconfig["zls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,

  cmd = { "zls" },

  filetypes = { "zig", "zir" },

  root_dir = lspconfig.util.root_pattern("zls.json", "build.zig", ".git"),

  single_file_support = true
}

lspconfig["lemminx"].setup {
  settings = {
    xml = {
      server = {
        workDir = "~/.cache/lemminx",
      }
    }
  }
}

lspconfig["elixirls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/home/nb29877/Personal/elixir-ls/language_server.sh" }
}

lspconfig["crystalline"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("shard.yml", ".git")
}

lspconfig["hls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'haskell', 'lhaskell', 'cabal'}
}
