return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      hijack_netrw_behavior = "open_current",
      follow_current_file = {
        enabled = true,
      },
    },
  },
  keys = {
    { "<leader><leader>", "<cmd>Neotree toggle<cr>", desc = "Open explorer in side pane" },
  },
}
