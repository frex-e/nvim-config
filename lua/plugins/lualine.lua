return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = true,
		opts = {
			options = {
				section_separators = '',
				component_separators = '|'
			}
		}
	},
}
