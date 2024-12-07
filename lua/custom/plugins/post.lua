-- require "custom.plugins.snipets"
vim.wo.rnu = true
vim.wo.number = true
vim.o.hlsearch = true
vim.o.termguicolors = true
vim.o.colorcolumn = '80'

vim.cmd 'map <C-s> <cmd>:w<cr>'
vim.cmd 'map <C-y> <cmd>:undo<cr>'
vim.cmd 'map <C-z> <cmd>:redo<cr>'
vim.cmd 'tnoremap <Esc> <C-\\><C-n>'
vim.cmd 'map <F2> :lua vim.lsp.buf.rename()<cr>'
vim.cmd 'nmap <silent> <c-k> :wincmd k<CR>'
vim.cmd 'nmap <silent> <c-j> :wincmd j<CR>'
vim.cmd 'nmap <silent> <c-h> :wincmd h<CR>'
vim.cmd 'nmap <silent> <c-l> :wincmd l<CR>'
vim.keymap.set('n', '<leader>Q', function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= '' then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
end, { desc = 'Toggle Floating Diagnostics' })

vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end)
vim.keymap.set('n', '<F10>', function()
  require('dap').step_over()
end)
vim.keymap.set('n', '<F11>', function()
  require('dap').step_into()
end)
vim.keymap.set('n', '<F12>', function()
  require('dap').step_out()
end)
vim.keymap.set('n', '<Leader>b', function()
  require('dap').toggle_breakpoint()
end)
vim.keymap.set('n', '<Leader>B', function()
  require('dap').set_breakpoint()
end)
vim.keymap.set('n', '<Leader>lp', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
end)
vim.keymap.set('n', '<Leader>dr', function()
  require('dap').repl.open()
end)
vim.keymap.set('n', '<Leader>dl', function()
  require('dap').run_last()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end)

local dap = require 'dap'
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '--interpreter=dap', '-nx', '--eval-command', 'set print pretty on' },
}

dap.configurations.c = {
  {
    name = 'Launch',
    type = 'gdb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = 'Select and attach to process',
    type = 'gdb',
    request = 'attach',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pid = function()
      local name = vim.fn.input 'Executable name (filter): '
      return require('dap.utils').pick_process { filter = name }
    end,
    cwd = '${workspaceFolder}',
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'gdb',
    request = 'attach',
    target = 'localhost:1234',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
  },
}

function Set_tab(tabwidth)
  -- vim.cmd("set tabstop=" .. tonumber(tabwidth) .. " shiftwidth=" .. tonumber(tabwidth) .. " expandtab")
  vim.o.tabstop = tonumber(tabwidth)
  vim.o.shiftwidth = tonumber(tabwidth)
  vim.o.expandtab = true
  vim.cmd('echo "Tab width set to ' .. tabwidth .. '"')
end

vim.cmd 'command! -nargs=1 Tab lua Set_tab(<q-args>)'
function Add_modeline(tabwidth)
  local full = (vim.o.commentstring):format(('Vim: set expandtab tabstop=%d shiftwidth=%d:'):format(tabwidth, tabwidth))
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { full })
  Set_tab(tabwidth)
end

vim.cmd 'command! -nargs=1 AML lua Add_modeline(<q-args>)'

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  -- group = ...,
  callback = function()
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
      fg = '#555555',
      ctermfg = 8,
      force = true,
    })
  end,
})

return {}
