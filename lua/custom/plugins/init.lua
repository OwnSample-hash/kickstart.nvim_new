return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
    keys = {
      { '<Tab>', '<cmd>bnext<cr>', desc = 'Next tab' },
      { '<S-Tab>', '<cmd>bprevious<cr>', desc = 'Prev tab' },
    },
  },
  {
    'tanvirtin/vgit.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('vgit').setup()
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreview<cr>', desc = '[M]arkdown[P]review' },
      { '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', desc = '[M]arkdownPreview[S]top' },
      { '<leader>mt', '<cmd>MarkdownPreviewToggle<cr>', desc = '[M]arkdownPreview[T]oggle' },
    },
  },
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'fedepujol/move.nvim',
    -- lazy = false,
    config = function()
      --           require('move').setup()
      local opts = { noremap = true, silent = true }
      -- Normal-mode commands
      vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
      vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', opts)
      vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
      vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
      vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
      vim.keymap.set('n', '<A-Left>', ':MoveHChar(-1)<CR>', opts)
      vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
      vim.keymap.set('n', '<A-Right>', ':MoveHChar(1)<CR>', opts)
      vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
      vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

      -- Visual-mode commands
      vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
      vim.keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)
      vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
      vim.keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
      vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
      vim.keymap.set('v', '<A-Left>', ':MoveHBlock(-1)<CR>', opts)
      vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
      vim.keymap.set('v', '<A-Right>', ':MoveHBlock(1)<CR>', opts)
    end,
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup()
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  'LunarVim/bigfile.nvim',
  {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    lazy = false,
    keys = {
      { '<Leader>gc', '<cmd>Neogen<cr>', desc = 'Gen annot' },
    },

    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    'Bekaboo/dropbar.nvim',
    -- enabled = false,
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    opts = { icons = { kinds = { use_devicons = false } } },
  },
}
