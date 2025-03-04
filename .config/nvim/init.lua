vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set tab spacing 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Plugins
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-tree/nvim-tree.lua')

vim.call('plug#end')

-- Telescope mappings.
local map = vim.keymap.set
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- Window focus mappings.
map('n', '<leader>h', '<C-w>h', { desc = 'Move focus to the left window' })
map('n', '<leader>l', '<C-w>l', { desc = 'Move focus to the right window' })
map('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Toggle File tree.
map('n', '<leader>n', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Nvim tree config. 
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
})

-- Colorscheme.
vim.cmd('silent! colorscheme murphy')
