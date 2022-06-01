local function load(layers)
	if layers.treesitter then
		table.insert(layers.treesitter.parsers, "json")
		table.insert(layers.treesitter.parsers, "jsonc")
		table.insert(layers.treesitter.parsers, "json5")
	end

	if layers.lsp then
		layers.lsp.configs.cssls = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" }
}
