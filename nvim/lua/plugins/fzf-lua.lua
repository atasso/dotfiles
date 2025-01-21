return {
  "folke/snacks.nvim",
  opts = {
    picker = {},
  },
  -- stylua: ignore
  keys = {
    { "<leader><space>", false },
    { "<C-p>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
  },
}
