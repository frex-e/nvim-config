return {
    "tpope/vim-fugitive",
	{ "folke/which-key.nvim", event = "VeryLazy", },
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = false },
        })
    end
    },{
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
},
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
}
}
