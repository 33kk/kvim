local function load(layers, defs)
	if defs.treesitter then
		table.insert(layers.treesitter.parsers, "java")
		table.insert(layers.treesitter.parsers, "kotlin")
	end

	if defs.lsp then
		layers.lsp.configs.jdtls = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" }
}
