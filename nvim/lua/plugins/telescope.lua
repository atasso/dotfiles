
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} },
  keys = {
    { '<C-p>', function() require 'telescope.builtin'.find_files() end, desc= "Fuzy find files"},
    { '<leader>fg', function() require  'telescope.builtin'.live_grep() end, desc="Find in file"},
    { '<leader>fb', function() require  'telescope.builtin'.buffers({initial_mode='normal'}) end, desc="List buffers"},
    { '<leader>fr', function() require 'telescope.builtin'.lsp_references({initial_mode='normal'}) end, desc="List refernces"},
    { '<leader>fs', function() require 'telescope.builtin'.lsp_document_symbols() end, desc="List document symbols"},
    { 'gr', function() require 'telescope.builtin'.lsp_references({initial_mode='normal'}) end, desc="List refernces"},
    { '<leader>ff', function() require 'telescope.builtin'.resume() end, desc="Resume last finder"},
    { '<leader>gs', function() require 'telescope.builtin'.git_status({initial_mode='normal'}) end, desc="List git status"},
    { '<leader>gb', function() require 'telescope.builtin'.git_branches() end, desc="List git branches"}
  },
  opts = {
    defaults = {
      mappings = {
        n = {
          ['<C-d>'] = "delete_buffer"
        },
        i = {
          ["<C-h>"] = "which_key",
          ['<C-d>'] = "delete_buffer"
        }
      }
    },
  }

}
