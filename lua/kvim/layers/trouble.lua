local function plugins(use)
	use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
end

local function load(layers)
	require("trouble").setup()

	layers.utils.set_maps({
		{ "n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Trouble" } },
	})
end

return {
	plugins = plugins,

	load = load,
	load_after = { "core" }
}
