vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "number"

vim.opt.colorcolumn = "79"

vim.opt.wrap = false

-- Tabsize
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Remap leader and local leader to <Space>
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.opt.clipboard = "unnamedplus"

vim.cmd("colorscheme dracula")
