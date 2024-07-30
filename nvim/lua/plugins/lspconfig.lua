local capabilities = require("cmp_nvim_lsp").default_capabilities()
return {
  "neovim/nvim-lspconfig",
  opts = {
    ---@type lspconfig.options
    capabilities = capabilities,
  },
}
