local function plugins(use)
	use { "L3MON4D3/LuaSnip" }
end

return {
	plugins = plugins,

	load_after = { "core" }
}
