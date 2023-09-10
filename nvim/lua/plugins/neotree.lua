return {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_current",
        follow_current_file = {
          enabled = true
      }
      }
    },
    keys = {
      {"<leader><leader>", ":Neotree toggle<cr>", desc = "Open explorer in side pane"}
    }
  }
