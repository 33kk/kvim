local function preload(layers)
	require("kvim.layers.core.options")(layers)
	require("kvim.layers.core.mappings")(layers)
end

return {
	depends = { "utils" },

	preload = preload,
	preload_after = { "utils" }
}
