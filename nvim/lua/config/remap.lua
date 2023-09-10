vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc='Open file explorer in current window'})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc='Move selected lines down'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",{desc='Move selected lines up'})

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc='Move cursor down'})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc='Move cursor up'})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {desc='Esc insert mode in terminal'})
vim.keymap.set("n", "<leader>tv", ":vsplit<bar>vertical resize 80 <bar> term<cr>", {desc= 'Open terminal in vertical split'})
vim.keymap.set("n", "<leader>to", ":split<bar>resize 20 <bar> term<cr>", {desc= 'Open terminal in vertical split'})
vim.keymap.set("n", "gp", ":silent %!prettier --stdin-filepath %<CR>")
vim.keymap.set("n", "<leader>ru", "<cmd>:TSToolsRemoveUnused<CR>", {  desc = "Remove unused" })
vim.keymap.set("n", "<leader>ai", "<cmd>:TSToolsAddMissingImports<CR>", {  desc = "Add missing import" })
vim.keymap.set("n", "<leader>oi", "<cmd>:TSToolsOrganizeImports<CR>", {  desc = "Organize imports" })



vim.keymap.set("n", "<C-h>", "<C-w>h", {desc="Move to right window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc="Move to left window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc="Move to bottom window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc="Move to top window"})
