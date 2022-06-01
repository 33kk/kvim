local function plugins(use)
	use { "lewis6991/gitsigns.nvim" }
end

local function load(layers)
	require("gitsigns").setup({
		on_attach = function(buffer)
			require("kvim.layers.gitsigns.mappings")(layers, buffer)
		end
	})
end

return {
	plugins = plugins,

	load = load,
	load_after = { "core", "utils" }
}
