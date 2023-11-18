return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- LSP Support
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = ":MasonUpdate",
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'neovim/nvim-lspconfig'},             -- Required

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
      },
      opts = function ()
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = bufnr, remap = false, desc='Peek definition'})
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = bufnr, remap = false, desc='Go to definition'})
  vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, {buffer = bufnr, remap = false, desc='Lsp show error'})
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, {buffer = bufnr, remap = false, desc='Lsp rename function'})
  vim.keymap.set("n", "<leader>qf", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false, desc='Lsp quick fix'})

end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()

        local cmp = require('cmp')

        cmp.setup({
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          preselect = 'item',
          mapping = {
            ['<CR>'] = cmp.mapping.confirm({select = false}),
            ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          },
          completion = {
            completeopt = 'menu,menuone,noinsert'
          },
          sources = {
            {name = 'path'},
            {name = 'nvim_lsp'},
            {name = 'nvim_lua'},
            {name = 'buffer', keyword_length = 3},
            {name = 'luasnip', keyword_length = 2},
          }
        })
      end
    },
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}
