return {
  "nvim-neorg/neorg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  keys = {
    { "<leader>N", "<cmd>Neorg<cr>", desc = "Open neorg" },
    { "<leader>on", "<Plug>(neorg.dirman.new-note)", desc = "New note" },
    { "<leader>oi", "<cmd>Neorg index<cr>", desc = "Note index" },
    { "<leader>ot", "<cmd>Neorg toc<cr>", desc = "Note toc" },
    { "<leader>od", "<cmd>Neorg return<cr>", desc = "Close neorg" },
    { "<c-t>", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", desc = "Convert todo" },
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.keybinds"] = { config = { default_keybinds = true } }, -- Enable keybinds
        ["core.export"] = {}, -- Export to other formats (e.g. Markdown)
        ["core.concealer"] = {}, -- Allows for icons and other fancy things to be used in Neorg
        ["core.dirman"] = { -- Manage your directories with Neorg
          config = {
            workspaces = {
              notes = "C:/Users/itatas/OneDrive - Ascom/note",
            },
            default_workspace = "notes",
          },
        },
      },
    })
  end,
}
