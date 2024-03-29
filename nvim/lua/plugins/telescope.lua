return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader><space>", false },
    {
      "<C-p>",
      function()
        require("config.telescopePickers").prettyFilesPicker({ picker = "find_files" })
      end,
      desc = "Fuzy find files",
    },
    {
      "<leader>fg",
      function()
        require("config.telescopePickers").prettyGrepPicker({ picker = "live_grep" })
      end,
      desc = "Find in file",
    },
    {
      "<leader>fb",
      function()
        require("config.telescopePickers").prettyBuffersPicker({ initial_mode = "normal" })
      end,
      desc = "List buffers",
    },
    {
      "<leader>fm",
      function()
        require("config.telescopePickers").prettyMarksPicker({ initial_mode = "normal" })
      end,
      desc = "List buffers",
    },
    {
      "<leader>fr",
      function()
        require("config.telescopePickers").prettyReferencePicker({ initial_mode = "normal" })
      end,
      desc = "List refernces",
    },
    {
      "gr",
      function()
        require("config.telescopePickers").prettyReferencePicker({ initial_mode = "normal" })
      end,
      desc = "List refernces",
    },
    {
      "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "List document symbols",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").resume()
      end,
      desc = "Resume last finder",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status({ initial_mode = "normal" })
      end,
      desc = "List git status",
    },
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "List git branches",
    },
  },
}
