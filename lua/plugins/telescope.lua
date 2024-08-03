return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
		},
		config = function ()
			ts = require("telescope")
			ts.load_extension("fzf")
			ts.load_extension("ui-select")
		end
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		"nvim-telescope/telescope-ui-select.nvim"
	}
}
