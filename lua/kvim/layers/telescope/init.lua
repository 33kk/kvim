local function plugins(use)
	use { "nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim"
		}
	}
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
end

local function load()
end

return {
	plugins = plugins,

	load = load,
	load_after = { "core" }
}
