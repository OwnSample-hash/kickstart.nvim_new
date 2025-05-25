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
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = function()
      require('lazy').load { plugins = { 'markdown-preview.nvim' } }
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
      require('move').setup {
        char = { enable = true },
      }
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
  },
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    lazy = false,
    -- opts = { icons = { kinds = { use_devicons = true } } },
    keys = {
      { '<leader>dp', '<cmd>lua require("dropbar.api").pick()<cr>', desc = '[D]ropbar [p]ick' },
    },
  },
  {
    'mfussenegger/nvim-dap',
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dapui').setup()
    end,
    keys = {
      { '<leader>dt', "<cmd>lua require('dapui').toggle()<cr>", desc = '[D]apui [t]oggle' },
      { '<leader>do', "<cmd>lua require('dapui').open()<cr>", desc = '[D]apui [o]pne' },
      { '<leader>dc', "<cmd>lua require('dapui').close()<cr>", desc = '[D]apui [c]lose' },
    },
  },
  { 'github/copilot.vim' },
  {
    'RaafatTurki/hex.nvim',
    lazy = false,
    keys = {
      { '<leader>hx', '<cmd>HexDump<cr>', desc = 'Switches to hex view' },
      { '<leader>ha', '<cmd>HexAssemble<cr>', desc = 'Go back to normal view' },
      { '<leader>ht', '<cmd>HexToggle<cr>', desc = 'Toggles hex view' },
    },
    config = function()
      require('hex').setup()
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup {
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        }
      end
      require('ufo').setup()
      --{
      --   provider_selector = function(_, _, _)
      --     return { 'treesitter', 'indent' }
      --   end,
      -- }
    end,
  },
}
