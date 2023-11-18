return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  event = "InsertEnter",
  dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end, dependencies = { "rafamadriz/friendly-snippets" },

  }
}
