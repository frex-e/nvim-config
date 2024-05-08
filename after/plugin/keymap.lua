require("telescope").load_extension("fzf")

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true}
local expr_opts = {noremap = true, expr = true, silent = true}

-- Escape using "jk".
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)

local ts = require("telescope.builtin")

-- Whickkey
local km = {
    f = {
        name = "Find",
        b = { ":Telescope file_browser<CR>", "File Browser" },
        f = {ts.find_files, "Files"},
        l = {ts.live_grep, "Live Grep"},
        g = {
            function ()
                ts.grep_string({search = vim.fn.input("Grep > ")})
            end,
            "Grep String"
        },
    },

    ["\\"] = {":vs<cr>", "Vertical Split"},

    b = {
      name = "Buffer",
      d = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },
}

local wk = require("which-key")

wk.register(
    km
    ,{prefix = "<leader>"}
)
