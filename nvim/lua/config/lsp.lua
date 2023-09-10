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

