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
          indent = { enable = true },
        })
    end
    },{
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
}
}
