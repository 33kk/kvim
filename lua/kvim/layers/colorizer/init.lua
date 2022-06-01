local function plugins(use)
	use { "norcalli/nvim-colorizer.lua" }
end

local function load()
	require("colorizer").setup()
end

return {
	plugins = plugins,

	load = load,
	load_after = { "core" }
}
