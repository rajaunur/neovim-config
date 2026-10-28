local M = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
}

M.config = function()
	require("tokyonight").setup({
		transparent = true,
		styles = {
			sidebars = "transparent",
			-- keywords = { italic = false },
			floats = "transparent",
		},
	})
	vim.cmd([[colorscheme tokyonight]])
end

return M
