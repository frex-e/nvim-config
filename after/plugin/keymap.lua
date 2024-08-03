local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true}

local expr_opts = {noremap = true, expr = true, silent = true}

local function describe(desc)
	return { noremap = true, silent = true, desc = desc}
end

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

-- Toggle Terminal Stuff
keymap("n", "<C-1>", ":ToggleTerm<CR>", default_opts)
keymap("i", "<C-1>", "<Esc>:ToggleTerm<CR>", default_opts)
keymap("t", "<C-1>", "<C-\\><C-n>:ToggleTerm<CR>", default_opts)

keymap("t", "<C-w>", "<C-\\><C-n><C-w>", default_opts)

-- Signature Help
keymap({"n","i"}, "<C-s>", vim.lsp.buf.signature_help,describe("Signature Help"))

-- Switch Tabs
keymap({"n", "i"}, "<C-8>","<Cmd>bprevious<Cr>",default_opts)
keymap({"n", "i"}, "<C-9>","<Cmd>bnext<Cr>",default_opts)

local ts = require("telescope.builtin")

-- Whickkey
local km = {
	-- Telescope Stuff
    f = {
        name = "Find",
        D = { ":Telescope file_browser<CR>", "File Browser (root)" },
        d = { ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "File Browser (cwd)" },
        b = {ts.buffers, "Buffers"},
        f = {ts.find_files, "Files"},
        g = {ts.live_grep, "Grep String"},
        -- g = {
        --     function ()
        --         ts.grep_string({search = vim.fn.input("Grep > ")})
        --     end,
        --     "Grep String"
        -- },
    },

    ["\\"] = {":vs<cr>", "Vertical Split"},

	-- Buffer Management
    b = {
      name = "Buffer",
      d = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },
	-- Lsp
	l = {
		name = "Lsp",
		r = {vim.lsp.buf.rename, "Rename Symbol"},
		f = {vim.lsp.buf.format, "Format"},
		a = {vim.lsp.buf.code_action, "Code Actions"},
		h = {vim.lsp.buf.hover, "Hover Cursor"}
	},

	-- Terminal
	t = {
		name = "Terminal",
		v = {":ToggleTerm direction=vertical size=60<CR>", "Toggle Terminal Vertical"},
		h = {":ToggleTerm direction=horizontal<CR>", "Toggle Terminal Horizontal"}
	},
}

require("which-key").register(
    km
    ,{prefix = "<leader>"}
)
