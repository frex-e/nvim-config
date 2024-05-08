vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "number"

vim.opt.colorcolumn = "79"

vim.opt.wrap = false

-- Tabsize
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Remap leader and local leader to <Space>
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- vim.opt.clipboard = "unnamedplus"

vim.opt.pumheight = 10

vim.cmd("colorscheme dracula")

vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = true,
}

vim.opt.clipboard = "unnamedplus"
