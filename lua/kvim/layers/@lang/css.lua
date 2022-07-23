local function load(layers, defs)
	if defs.treesitter then
		table.insert(layers.treesitter.parsers, "css")
		table.insert(layers.treesitter.parsers, "scss")
	end

	if defs.lsp then
		layers.lsp.configs.cssls = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" }
}
