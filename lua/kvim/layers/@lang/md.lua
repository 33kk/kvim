local function plugins(use)
end

local function load(layers, defs)
	if defs.treesitter then
		table.insert(layers.treesitter.parsers, "markdown")
	end
end

return {
	plugins = plugins,

	load = load,
	load_after = { "treesitter" }
}
