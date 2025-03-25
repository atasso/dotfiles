return {
  "folke/snacks.nvim",
  opts = {},

  -- stylua: ignore
  keys = {
    { "<leader><space>", false },
 { "<C-p>", function() Snacks.picker.files() end, desc = "Find files" },
 { "<leader><leader>", function() Snacks.explorer() end, desc = "File Explorer" },
  },
}
