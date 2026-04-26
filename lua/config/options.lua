vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true -- Convert tabs into spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.breakindent = true

vim.opt.cursorline = true -- show line under cursor

vim.opt.undofile = true -- stores undo between sessions

vim.opt.mouse = "a"

vim.opt.showmode = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 10

-- Shims for outdated plugins using deprecated Neovim APIs
vim.lsp.buf_get_clients = vim.lsp.get_clients

local _validate = vim.validate
vim.validate = function(opt, ...)
  if type(opt) == 'table' then
    for k, v in pairs(opt) do
      _validate(k, v[1], v[2], v[3])
    end
  else
    _validate(opt, ...)
  end
end
