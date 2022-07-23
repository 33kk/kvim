local function plugins(use)
	use { "folke/todo-comments.nvim", requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" } }
end

local function load(layers, defs)
	require("todo-comments").setup()

	if defs.trouble then
		layers.utils.set_maps({
			{ "n", "<leader>xt", "<cmd>TroubleToggle todo<CR>", { desc = "Trouble: TODO" } },
		})
	end
end

return {
	plugins = plugins,

	load = load,
	load_after = { "core", "trouble" }
}
