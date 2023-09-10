return {
  'nvim-treesitter/nvim-treesitter',
  build =  ':TSUpdate',
  event = { "BufReadPost", "BufNewFile" },
  opts =  {
    ensure_installed = { "javascript", "typescript",  "css", "c", "lua", "vim", "vimdoc", "query" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    autotag = {
      enable = true,
    },

    indent = {
      enable = true,
    },

    highlight = {
      enable = true,

      additional_vim_regex_highlighting = false,
    },
  },
  config = function (_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
