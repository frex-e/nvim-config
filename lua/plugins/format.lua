return {
	{
		"nvimdev/guard.nvim",

		-- Builtin configuration, optional
		dependencies = {
			"nvimdev/guard-collection",
		},
		config = function ()
			local ft = require('guard.filetype')

			ft('typescript;javascript'):fmt("prettier")

			vim.g.guard_config ={
				fmt_on_save = false,
				lsp_as_default_formatter = true
			}
		end
	},
}
