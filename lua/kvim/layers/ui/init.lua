local function plugins(use)
	use { "33kk/kkDark" }
	use { "33kk/stl.nvim" }
	use { "lukas-reineke/indent-blankline.nvim" }
	use { "SmiteshP/nvim-gps", after = "nvim-treesitter" }
	use { "j-hui/fidget.nvim" }
end

local function load(layers)
	vim.cmd("colorscheme kkDark")

	require("indent_blankline").setup {
		char = "🭰",
		space_char_blankline = " ",
		show_current_context = true,
		show_current_context_start = false
	}

	require("kvim.layers.ui.signs")
	require("kvim.layers.ui.statusline")

	if layers.lsp then
		require("fidget").setup {
			text = {
				spinner = "dots"
			}
		}
	end
end

return {
	plugins = plugins,

	load = load,
	load_after = { "core", "lsp", "treesitter" },
}
